/*
 * main.h
 *
 * Author       : Léa Strobino
 * Revision     : 1.0
 * Last updated : Sat, 02 Jun 2018 11:04:22 +0200
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

#ifndef MAIN_H_
#define MAIN_H_

#include <stdint.h>
#include "trap.h"

#define DEFAULT_X   0 // mm
#define DEFAULT_Y   0 // mm
#define DEFAULT_Z  20 // mm
#define DEFAULT_V  20 // mm/s

#define DEFAULT_VORTEX_HELICITY    1
#define DEFAULT_TWIN_ANGLE         0 // rad
#define DEFAULT_BOTTLE_RADIUS     10 // mm
#define DEFAULT_N                200 // 40 kHz / (200+200) = 100 Hz

#define LED_VORTEX  2
#define LED_TWIN    1
#define LED_BOTTLE  3

#define ANSI_ED  "\33[2J\33[H"
#define ANSI_EL  "\33[2K\r"

#define GCODE "GgMmFfSsTtXxYyZzUuVvWwRr"

typedef enum {
  VORTEX,
  TWIN,
  BOTTLE
} trap_t;

int main(int argc, char *argv[]);
void get_piezo_conf(const char *file);
void set_phase_zero();
void set_trap_vortex(point_t p, uint8_t helicity);
void set_trap_twin(point_t p, double angle);
void set_trap_bottle(point_t p, double radius);
void move(point_t *p, point_t q, double velocity);
void print_info(point_t p, double velocity);
void cleanup();
void init_signal();
void handle_signal(int sig);
char *strword(char **stringp);

#endif /* MAIN_H_ */
