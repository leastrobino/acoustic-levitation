/*
 * trap.h
 *
 * Author       : Léa Strobino
 * Revision     : 1.0
 * Last updated : Tue, 29 May 2018 09:34:09 +0200
 */

#ifndef TRAP_H_
#define TRAP_H_

#include <stdint.h>
#include "peripherals.h"

#define WAVE_C  343 // m/s
#define WAVE_K  (2*M_PI*PIEZO_FREQ/(1000*WAVE_C)) // 1/mm
#define N       PIEZO_COUNT

typedef struct {
  double x;
  double y;
  double z;
} point_t;

void calc_vortex_sig(point_t piezo_xyz[], uint8_t helicity, double phase[]);
void calc_twin_sig(point_t piezo_xyz[], double angle, double phase[]);
void calc_bottle_sig(point_t piezo_xyz[], double radius, double phase[]);
void calc_focus(point_t piezo_xyz[], point_t p, double phase[]);

#endif /* TRAP_H_ */
