/*
 * peripherals.c
 *
 * Author       : Léa Strobino
 * Revision     : 1.0
 * Last updated : Tue, 29 May 2018 09:34:09 +0200
 */

#include <assert.h>
#include <errno.h>
#include <fcntl.h>
#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include "socal/socal.h"
#include "peripherals.h"

int32_t mem = 0;

void *h2f_lw_axi_master = NULL;

uint8_t *fpga_key = NULL;
uint8_t *fpga_led = NULL;

uint16_t *piezo_enable = NULL, *piezo_period = NULL;
uint16_t *piezo_phase_a_count = NULL, *piezo_phase_b_count = NULL;
uint16_t *piezo_phase_a = NULL, *piezo_phase_b = NULL;

inline void open_dev_mem() {
  mem = open("/dev/mem",O_RDWR|O_SYNC);
  if (mem == -1) {
    printf("[Error] Could not open \"/dev/mem\": %s\n",strerror(errno));
    exit(EXIT_FAILURE);
  }
}

inline void close_dev_mem() {
  close(mem);
}

inline void assert_mmap(void *ptr, const char *peripheral) {
  if (ptr == MAP_FAILED) {
    printf("[Error] %s mmap() failed: %s\n",peripheral,strerror(errno));
    close_dev_mem();
    exit(EXIT_FAILURE);
  }
}

inline void assert_munmap(int s, const char *peripheral) {
  if (s == -1) {
    printf("[Error] %s munmap() failed: %s\n",peripheral,strerror(errno));
    close_dev_mem();
    exit(EXIT_FAILURE);
  }
}

inline void mmap_fpga_peripherals() {
  h2f_lw_axi_master = mmap(NULL,ALT_LWFPGASLVS_SPAN,PROT_READ|PROT_WRITE,MAP_SHARED,mem,ALT_LWFPGASLVS_BASE);
  assert_mmap(h2f_lw_axi_master,"h2f_lw_axi_master");
  fpga_key            = h2f_lw_axi_master + FPGA_KEY_BASE;
  fpga_led            = h2f_lw_axi_master + FPGA_LED_BASE;
  piezo_enable        = h2f_lw_axi_master + PIEZO_ENABLE_BASE;
  piezo_period        = h2f_lw_axi_master + PIEZO_PERIOD_BASE;
  piezo_phase_a_count = h2f_lw_axi_master + PIEZO_PHASE_A_COUNT_BASE;
  piezo_phase_b_count = h2f_lw_axi_master + PIEZO_PHASE_B_COUNT_BASE;
  piezo_phase_a       = h2f_lw_axi_master + PIEZO_PHASE_A_BASE;
  piezo_phase_b       = h2f_lw_axi_master + PIEZO_PHASE_B_BASE;
}

inline void munmap_fpga_peripherals() {
  assert_munmap(munmap(h2f_lw_axi_master,ALT_LWFPGASLVS_SPAN),"h2f_lw_axi_master");
  h2f_lw_axi_master = NULL;
  fpga_key = fpga_led = NULL;
  piezo_enable = piezo_period = NULL;
  piezo_phase_a_count = piezo_phase_b_count = NULL;
  piezo_phase_a = piezo_phase_b = NULL;
}

inline uint8_t get_key(uint8_t key) {
  return !((alt_read_byte(fpga_key) >> key) & 0x1);
}

inline void set_led_status(uint8_t status) {
  alt_replbits_byte(fpga_led,1 << 7,status << 7);
}

inline void set_led_trap(uint8_t trap) {
  if (trap) alt_replbits_byte(fpga_led,0x7,0x8 >> trap);
  else alt_clrbits_byte(fpga_led,0x7);
}

inline void init_piezo() {
  alt_write_hword(piezo_enable,0);
  alt_write_hword(piezo_period,PIEZO_PERIOD_CLK);
  alt_write_hword(piezo_phase_a_count,0);
  alt_write_hword(piezo_phase_b_count,0);
}

void set_piezo_phase(phase_register r, double phase[]) {
  double phase_mod;
  uint16_t phase_clk, i;
  for (i=0; i<PIEZO_COUNT; i++) {
    phase_mod = fmod(phase[i],2*M_PI);
    if (phase_mod < 0) phase_mod += 2*M_PI;
    phase_clk = phase_mod*PIEZO_PERIOD_CLK/(2*M_PI);
    switch (r) {
      case REGISTER_A:
        alt_write_hword(&piezo_phase_a[i],phase_clk);
        break;
      case REGISTER_B:
        alt_write_hword(&piezo_phase_b[i],phase_clk);
        break;
    }
  }
}

inline void set_piezo_phase_count(uint16_t n_a, uint16_t n_b) {
  alt_write_hword(piezo_phase_a_count,n_a);
  alt_write_hword(piezo_phase_b_count,n_b);
}

inline void set_piezo_enable(uint8_t enable) {
  alt_write_hword(piezo_enable,enable & 0x1);
}
