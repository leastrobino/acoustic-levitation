/*
 * peripherals.h
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

#ifndef PERIPHERALS_H_
#define PERIPHERALS_H_

#include <stdint.h>
#include "socal/hps.h"
#include "soc_system.h"

#define ALT_LWFPGASLVS_BASE       ALT_LWFPGASLVS_OFST
#define ALT_LWFPGASLVS_SPAN       (ALT_LWFPGASLVS_UB_ADDR - ALT_LWFPGASLVS_LB_ADDR + 1)

#define PIEZO_ENABLE_BASE         (PIEZO_CONTROLLER_0_BASE + PIEZO_CONTROLLER_0_ENABLE_REG_OFST)
#define PIEZO_PERIOD_BASE         (PIEZO_CONTROLLER_0_BASE + PIEZO_CONTROLLER_0_PERIOD_REG_OFST)
#define PIEZO_PHASE_A_COUNT_BASE  (PIEZO_CONTROLLER_0_BASE + PIEZO_CONTROLLER_0_PHASE_A_COUNT_REG_OFST)
#define PIEZO_PHASE_B_COUNT_BASE  (PIEZO_CONTROLLER_0_BASE + PIEZO_CONTROLLER_0_PHASE_B_COUNT_REG_OFST)
#define PIEZO_PHASE_A_BASE        (PIEZO_CONTROLLER_0_BASE + PIEZO_CONTROLLER_0_PHASE_A_REG_OFST)
#define PIEZO_PHASE_B_BASE        (PIEZO_CONTROLLER_0_BASE + PIEZO_CONTROLLER_0_PHASE_B_REG_OFST)
#define PIEZO_COUNT               88
#define PIEZO_FREQ                40000
#define PIEZO_PERIOD_CLK          (PIEZO_CONTROLLER_0_FREQ / PIEZO_FREQ)

typedef enum {REGISTER_A, REGISTER_B} phase_register;

void open_dev_mem();
void close_dev_mem();

void assert_mmap(void *ptr, const char *peripheral);
void assert_munmap(int s, const char *peripheral);
void mmap_fpga_peripherals();
void munmap_fpga_peripherals();

uint8_t get_key(uint8_t key);
void set_led_status(uint8_t status);
void set_led_trap(uint8_t trap);

void init_piezo();
void set_piezo_phase(phase_register r, double phase[]);
void set_piezo_phase_count(uint16_t n_a, uint16_t n_b);
void set_piezo_enable(uint8_t enable);

#endif /* PERIPHERALS_H_ */
