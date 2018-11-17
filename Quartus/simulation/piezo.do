###############################################################################
# piezo.do  -*- mode: tcl -*-
# ========
#
# Author       : Léa Strobino
# Revision     : 1.0
# Last updated : Tue, 13 Nov 2018 20:52:58 +0100
###############################################################################

vlib work

vcom -93 ../../VHDL/piezo.vhd

vsim piezo

view objects
view wave

add wave -divider "Clock & reset"
add wave -label clk_i clk_i
add wave -label reset_n_i reset_n_i

add wave -divider "Inputs"
add wave -label duration_i -radix unsigned duration_i
add wave -label phase_i -radix unsigned phase_i
add wave -label enable_i enable_i
add wave -label sync_p1_i sync_p1_i

add wave -divider "Internal signals"
add wave -label s_state0 s_state0
add wave -label s_ctr0_c -radix unsigned s_ctr0_c
add wave -label s_state1 s_state1
add wave -label s_ctr1_c -radix unsigned s_ctr1_c

add wave -divider "Outputs"
add wave -label wave_o wave_o

do piezo.udo

