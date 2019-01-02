/*
 * trap.c
 *
 * Author       : Léa Strobino
 * Revision     : 1.0
 * Last updated : Tue, 29 May 2018 09:34:09 +0200
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

#include <math.h>
#include <stdint.h>
#include "trap.h"

void calc_vortex_sig(point_t piezo_xyz[], uint8_t helicity, double phase[]) {
  uint16_t i;
  for (i=0; i<N; i++) {
    phase[i] = (double)helicity*atan2(piezo_xyz[i].y,piezo_xyz[i].x);
  }
}

void calc_twin_sig(point_t piezo_xyz[], double angle, double phase[]) {
  double a;
  uint16_t i;
  angle = fmod(angle,2*M_PI);
  for (i=0; i<N; i++) {
    a = atan2(piezo_xyz[i].y,piezo_xyz[i].x);
    a = fmod(angle+a+4*M_PI,2*M_PI);
    if ((a > M_PI_2) && (a <= 3*M_PI_2)) phase[i] = M_PI_2;
    else phase[i] = -M_PI_2;
  }
}

void calc_bottle_sig(point_t piezo_xyz[], double radius, double phase[]) {
  uint16_t i;
  for (i=0; i<N; i++) {
    if (sqrt(pow(piezo_xyz[i].x,2)+pow(piezo_xyz[i].y,2)) < radius) phase[i] = 0;
    else phase[i] = M_PI;
  }
}

void calc_focus(point_t piezo_xyz[], point_t p, double phase[]) {
  double r;
  uint16_t i;
  for (i=0; i<N; i++) {
    r = sqrt(pow((p.x-piezo_xyz[i].x),2)+pow((p.y-piezo_xyz[i].y),2)+pow((p.z-piezo_xyz[i].z),2));
    phase[i] = -WAVE_K*r;
  }
}
