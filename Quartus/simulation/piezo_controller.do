###############################################################################
# piezo_controller.do  -*- mode: tcl -*-
# ===================
#
# Author       : Léa Strobino
# Revision     : 1.0
# Last updated : Tue, 13 Nov 2018 20:52:58 +0100
#
# Copyright Léa Strobino, 2018
# Licensed under the CERN OHL v1.2 
#
# You may redistribute and modify this file under the terms of the CERN OHL
# v1.2. (http://ohwr.org/cernohl). This file is distributed WITHOUT ANY EXPRESS
# OR IMPLIED WARRANTY, INCLUDING OF MERCHANTABILITY, SATISFACTORY QUALITY AND
# FITNESS FOR A PARTICULAR PURPOSE.
# Please see the CERN OHL v1.2 for applicable conditions.
###############################################################################

vlib work

vcom -93 ../../VHDL/piezo.vhd
vcom -93 ../../VHDL/piezo_controller.vhd

vsim piezo_controller

view objects
view wave

add wave -divider "Clock & reset"
add wave -label clk_i clk_i
add wave -label reset_n_i reset_n_i

add wave -divider "Avalon"
add wave -label AVS_Address_i -radix hexadecimal AVS_Address_i
add wave -label AVS_ReadData_o -radix unsigned AVS_ReadData_o
add wave -label AVS_WriteData_i -radix unsigned AVS_WriteData_i
add wave -label AVS_Read_i AVS_Read_i
add wave -label AVS_Write_i AVS_Write_i

add wave -divider "Registers"
add wave -label s_enable s_enable
add wave -label s_period -radix unsigned s_period
add wave -label s_phase_A_count -radix unsigned s_phase_A_count
add wave -label s_phase_B_count -radix unsigned s_phase_B_count
add wave -label s_phase_A(0) -radix unsigned s_phase_A(0)
add wave -label s_phase_B(0) -radix unsigned s_phase_B(0)

add wave -divider "Internal signals"
add wave -label s_ctr_c -radix unsigned s_ctr_c
add wave -label s_sync_p1_{-2} s_sync_p1(2)
add wave -label s_sync_p1 s_sync_p1(0)
add wave -label s_phase(0) -radix unsigned s_phase(0)
add wave -label s_phase_AB s_phase_AB
add wave -label s_ctr_AB_c -radix unsigned s_ctr_AB_c
add wave -label s_new_value s_new_value

add wave -divider "Outputs"
add wave -label wave_o(0) wave_o(0)

do piezo_controller.udo

