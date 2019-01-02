/*
 * main.c
 *
 * Author       : Léa Strobino
 * Revision     : 1.0
 * Last updated : Sun, 10 Jun 2018 12:47:43 +0200
 * 
 * Copyright Léa Strobino, 2018
 * Licensed under the CERN OHL v1.2
 * 
 * You may redistribute and modify this file under the terms of the CERN OHL
 * v1.2. (http://ohwr.org/cernohl). This file is distributed WITHOUT ANY EXPRESS
 * OR IMPLIED WARRANTY, INCLUDING OF MERCHANTABILITY, SATISFACTORY QUALITY AND
 * FITNESS FOR A PARTICULAR PURPOSE.
 * Please see the CERN OHL v1.2 for applicable conditions.
 */

#include <ctype.h>
#include <errno.h>
#include <fcntl.h>
#include <math.h>
#include <signal.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#include "main.h"
#include "peripherals.h"
#include "trap.h"

double vortex_sig[N]; uint8_t vortex_helicity = DEFAULT_VORTEX_HELICITY;
double twin_sig[N], twin_angle = DEFAULT_TWIN_ANGLE;
double bottle_sig[N], bottle_radius = DEFAULT_BOTTLE_RADIUS;
point_t piezo_xyz[N];
trap_t trap = TWIN;
uint16_t n_a = DEFAULT_N, n_b = DEFAULT_N;
uint8_t tty;
volatile uint8_t sigint = 0;

int main(int argc, char *argv[]) {

  char c[2], line[256], *cmd, *str;
  double a, angle = DEFAULT_TWIN_ANGLE, radius = DEFAULT_BOTTLE_RADIUS, velocity = DEFAULT_V;
  point_t p = {DEFAULT_X,DEFAULT_Y,DEFAULT_Z}, q;
  uint16_t i;
  uint8_t helicity = DEFAULT_VORTEX_HELICITY, m;

  // Init signals, /dev/mem, mmap, exit function and status LED
  init_signal();
  open_dev_mem();
  mmap_fpga_peripherals();
  atexit(cleanup);
  set_led_status(1);

  // Set STDIN non-blocking
  if ((tty = isatty(0))) fcntl(0,F_SETFL,fcntl(0,F_GETFL,0)|O_NONBLOCK);

  // Print header
  printf("    __\n");
  printf(" -=(o '.        Acoustic levitation v1.0\n");
  printf("    '.-.\\       ========================\n");
  printf("    /|  \\\\\n");
  printf("    '|  ||      Frequency: %.3f kHz\n",PIEZO_FREQ/1000.0);
  printf("     _\\_):,_    Phase resolution: %.3f°\n\n",360.0/PIEZO_PERIOD_CLK);

  // Read piezo configuration file and print it
  if (argc > 1) get_piezo_conf(argv[1]);
  else get_piezo_conf("transducers.csv");

  printf("Piezo     X / mm      Y / mm      Z / mm\n");
  printf("----------------------------------------\n");
  for (i=0; i<N; i++) {
    printf("%-4d  %10.2f  %10.2f  %10.2f\n",i+1,
        piezo_xyz[i].x,piezo_xyz[i].y,piezo_xyz[i].z);
  }
  printf("\n");

  // Init traps
  calc_vortex_sig(piezo_xyz,vortex_helicity,vortex_sig);
  calc_twin_sig(piezo_xyz,twin_angle,twin_sig);
  calc_bottle_sig(piezo_xyz,bottle_radius,bottle_sig);

  // Set initial levitation point
  init_piezo();
  set_trap_twin(p,twin_angle);
  set_piezo_phase_count(0,0);
  set_piezo_enable(1);

  print_info(p,velocity);
  printf("\n");
  if (tty) printf("> ");

  // Handle commands
  while (1) {

    if (fgets(line,sizeof(line),stdin) != NULL) {

      str = &line[0];
      q.x = p.x; q.y = p.y; q.z = p.z;
      m = 0;

      if (!tty) printf("+ %s",line);

      while ((cmd = strword(&str)) != NULL) {

        // vortex [%u] [%u] [%u]
        if (strcasecmp(cmd,"vortex") == 0) {
          if (str && sscanf(str,"%hhu",&helicity)) strword(&str);
          if (str && sscanf(str,"%hu",&n_a)) strword(&str);
          if (str && sscanf(str,"%hu",&n_b)) strword(&str);
          set_piezo_phase_count(n_a,n_b);
          set_trap_vortex(p,helicity);
          trap = VORTEX;
          printf("Vortex trap (helicity: %d, cycles: %d/%d)\n",vortex_helicity,n_a,n_b);
          break;
        }

        // twin [%f]
        else if (strcasecmp(cmd,"twin") == 0) {
          if (str && sscanf(str,"%lf",&angle)) strword(&str);
          set_piezo_phase_count(0,0);
          set_trap_twin(p,angle*M_PI/180);
          trap = TWIN;
          printf("Twin trap (angle: %.0f°)\n",twin_angle*180/M_PI);
          break;
        }

        // bottle [%f]
        else if (strcasecmp(cmd,"bottle") == 0) {
          if (str && sscanf(str,"%lf",&radius)) strword(&str);
          set_piezo_phase_count(0,0);
          set_trap_bottle(p,radius);
          trap = BOTTLE;
          printf("Bottle trap (radius: %.1f mm)\n",bottle_radius);
          break;
        }

        // home (G28)
        else if ((strcasecmp(cmd,"home") == 0) || (strcasecmp(cmd,"G28") == 0)) {
          q.x = DEFAULT_X; q.y = DEFAULT_Y; q.z = DEFAULT_Z;
          m = 1;
        }

        // sleep %f (G4 P%f)
        else if ((strcasecmp(cmd,"sleep") == 0) || (strcasecmp(cmd,"G4") == 0)) {
          if (str && ((sscanf(str,"%lf",&a) == 1) || (sscanf(str,"%*1[pP]%lf",&a) == 1))) {
            strword(&str);
            if (a > 0) usleep(1000000*a);
            sigint = 0;
          } else {
            printf("sleep: missing operand\n");
          }
          break;
        }

        // exit (M2)
        else if ((strcasecmp(cmd,"exit") == 0) || (strcasecmp(cmd,"M2") == 0)) {
          return EXIT_SUCCESS;
        }

        // clear
        else if (strcasecmp(cmd,"clear") == 0) {
          printf(ANSI_ED);
          break;
        }

        // nophase
        else if (strcasecmp(cmd,"nophase") == 0) {
          set_phase_zero();
          printf("0° phase on each channel\n");
          m = 0;
          break;
        }

        // ?
        else if (strcmp(cmd,"?") == 0) {
          print_info(p,velocity);
          break;
        }

        // one-character commands: %c%f
        else if (sscanf(cmd,"%1["GCODE"]%lf",c,&a) == 2) {
          switch (toupper(c[0])) {
            case 'X': q.x  = a; m = 1; break;
            case 'Y': q.y  = a; m = 1; break;
            case 'Z': q.z  = a; m = 1; break;
            case 'U': q.x += a; m = 1; break;
            case 'V': q.y += a; m = 1; break;
            case 'W': q.z += a; m = 1; break;
            case 'R':
              if (trap == TWIN) {
                set_trap_twin(p,a*M_PI/180);
                printf("Twin trap (angle: %.0f°)\n",twin_angle*180/M_PI);
              } else {
                printf("R: only available for twin trap\n");
              }
              break;
            case 'F':
              velocity = a;
              printf("Velocity: %.1f mm/s\n",velocity);
              break;
          }
        } else if ((strlen(cmd) == 1) && strspn(cmd,GCODE)) {
          printf("%c: missing operand\n",toupper(cmd[0]));
          m = 0;
          break;
        }

        // default: command not found
        else {
          printf("%s: command not found\n",cmd);
          m = 0;
          break;
        }

      }

      if (m) move(&p,q,velocity);

      if (tty) printf("> ");

    }

    if (sigint || get_key(0)) return EXIT_SUCCESS;

  }

  return EXIT_SUCCESS;

}

void get_piezo_conf(const char *file) {

  FILE *h;
  uint16_t i = 0;
  char line[256];

  h = fopen(file,"r");
  if (h == NULL) {
    printf("[Error] get_piezo_conf() failed: %s\n",strerror(errno));
    exit(EXIT_FAILURE);
  }

  while ((i<N) && !feof(h)) {
    fgets(line,sizeof(line),h);
    if (line[0] != '%') {
      sscanf(line,"%lf,%lf,%lf",&piezo_xyz[i].x,&piezo_xyz[i].y,&piezo_xyz[i].z);
      i++;
    }
  }

  fclose(h);

}

void set_phase_zero() {
  double phase[N] = {0};
  set_piezo_phase(REGISTER_A,phase);
  set_piezo_phase_count(0,0);
  set_led_trap(0);
}

void set_trap_vortex(point_t p, uint8_t helicity) {

  uint16_t i;
  double focus[N], phase[N];

  if (helicity != vortex_helicity) {
    vortex_helicity = helicity;
    calc_vortex_sig(piezo_xyz,vortex_helicity,vortex_sig);
  }

  calc_focus(piezo_xyz,p,focus);

  for (i=0; i<N; i++) phase[i] = vortex_sig[i]+focus[i];
  set_piezo_phase(REGISTER_A,phase);
  for (i=0; i<N; i++) phase[i] = 2*M_PI-vortex_sig[i]+focus[i];
  set_piezo_phase(REGISTER_B,phase);

  set_led_trap(LED_VORTEX);

}

void set_trap_twin(point_t p, double angle) {

  uint16_t i;
  double focus[N], phase[N];

  if (angle != twin_angle) {
    twin_angle = angle;
    calc_twin_sig(piezo_xyz,twin_angle,twin_sig);
  }

  calc_focus(piezo_xyz,p,focus);

  for (i=0; i<N; i++) phase[i] = twin_sig[i]+focus[i];
  set_piezo_phase(REGISTER_A,phase);

  set_led_trap(LED_TWIN);

}

void set_trap_bottle(point_t p, double radius) {

  uint16_t i;
  double focus[N], phase[N];

  if (radius != bottle_radius) {
    bottle_radius = radius;
    calc_bottle_sig(piezo_xyz,bottle_radius,bottle_sig);
  }

  calc_focus(piezo_xyz,p,focus);

  for (i=0; i<N; i++) phase[i] = bottle_sig[i]+focus[i];
  set_piezo_phase(REGISTER_A,phase);

  set_led_trap(LED_BOTTLE);

}

void move(point_t *p, point_t q, double velocity) {

  struct timespec t0, t1;
  int32_t dt;
  uint16_t i = 0, n;

  point_t d = {q.x-p->x,q.y-p->y,q.z-p->z};
  n = sqrt(pow(d.x,2)+pow(d.y,2)+pow(d.z,2))*1000/velocity;
  d.x /= n; d.y /= n; d.z /= n;

  clock_gettime(CLOCK_REALTIME,&t0);
  sigint = 0;

  for (i=1; (i<n) && !sigint; i++) {
    p->x += d.x; p->y += d.y; p->z += d.z;
    switch (trap) {
      case VORTEX: set_trap_vortex(*p,vortex_helicity); break;
      case TWIN:   set_trap_twin(*p,twin_angle);        break;
      case BOTTLE: set_trap_bottle(*p,bottle_radius);   break;
    }
    if (i % 100 == 0) {
      printf(ANSI_EL"Focus: ( %.1f ; %.1f ; %.1f ) mm",p->x,p->y,p->z);
      fflush(stdout);
    }
    clock_gettime(CLOCK_REALTIME,&t1);
    dt = 1000*i-((t1.tv_sec-t0.tv_sec)*1000000+(t1.tv_nsec-t0.tv_nsec)/1000);
    if (dt > 0) usleep(dt);
  }

  if (!sigint) {
    p->x = q.x; p->y = q.y; p->z = q.z;
    switch (trap) {
      case VORTEX: set_trap_vortex(*p,vortex_helicity); break;
      case TWIN:   set_trap_twin(*p,twin_angle);        break;
      case BOTTLE: set_trap_bottle(*p,bottle_radius);   break;
    }
  }
  printf(ANSI_EL"Focus: ( %.1f ; %.1f ; %.1f ) mm\n",p->x,p->y,p->z);

  sigint = 0;

}

void print_info(point_t p, double velocity) {
  printf("Trap     : ");
  switch (trap) {
    case VORTEX:
      printf("vortex, helicity = %d, cycles = %d/%d\n",vortex_helicity,n_a,n_b);
      break;
    case TWIN:
      printf("twin, angle = %.0f°\n",twin_angle*180/M_PI);
      break;
    case BOTTLE:
      printf("bottle, radius = %.1f mm\n",bottle_radius);
      break;
  }
  printf("Focus    : ( %.1f ; %.1f ; %.1f ) mm\n",p.x,p.y,p.z);
  printf("Velocity : %.1f mm/s\n",velocity);
}

void cleanup() {
  set_piezo_enable(0);
  set_led_trap(0);
  set_led_status(0);
  munmap_fpga_peripherals();
  close_dev_mem();
}

inline void init_signal() {

  struct sigaction sa;
  sa.sa_flags = SA_RESTART;
  sigfillset(&sa.sa_mask);

  // Ignore SIGTTIN
  sa.sa_handler = SIG_IGN;
  sigaction(SIGTTIN,&sa,NULL);

  // Catch SIGINT & SIGTERM
  sa.sa_handler = handle_signal;
  sigaction(SIGINT,&sa,NULL);
  sigaction(SIGTERM,&sa,NULL);

}

void handle_signal(int sig) {

  if (!tty) exit(EXIT_SUCCESS);

  switch (sig) {
    case SIGINT:
      sigint = 1;
      break;
    case SIGTERM:
      exit(EXIT_SUCCESS);
  }

}

char *strword(char **stringp) {
  char *b, *e;
  if ((b = *stringp) == NULL) return NULL;
  while ((*b != '\0') && ((*b == ' ') || (*b == '\t') || (*b == '\r') || (*b == '\n'))) b++;
  if (*b == '\0') {
    *stringp = NULL;
    return NULL;
  }
  e = b;
  while ((*e != '\0') && (*e != ' ') && (*e != '\t') && (*e != '\r') && (*e != '\n')) e++;
  if (*e) {
    *e++ = '\0';
    *stringp = e;
  } else {
    *stringp = NULL;
  }
  return b;
}
