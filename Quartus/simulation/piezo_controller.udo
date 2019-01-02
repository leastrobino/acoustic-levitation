###############################################################################
# piezo_controller.udo  -*- mode: tcl -*-
# ====================
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

restart -f

# 50 MHz clock
force -freeze clk_i 1, 0 10ns -r 20ns

# Reset
force reset_n_i 0, 1 50ns

run 100ns

# Write parameters

# Period = 20
force AVS_Address_i   00000001
force AVS_WriteData_i 0000000000010100
force AVS_Write_i     1 10ns, 0 30ns
run 40ns

# Phase A = 1
force AVS_Address_i   00010000
force AVS_WriteData_i 0000000000000001
force AVS_Write_i     1 10ns, 0 30ns
run 40ns

# Phase B = 15
force AVS_Address_i   10001000
force AVS_WriteData_i 0000000000001111
force AVS_Write_i     1 10ns, 0 30ns
run 40ns

# Phase A count = 3
force AVS_Address_i   00000010
force AVS_WriteData_i 0000000000000011
force AVS_Write_i     1 10ns, 0 30ns
run 40ns

# Phase B count = 4
force AVS_Address_i   00000011
force AVS_WriteData_i 0000000000000100
force AVS_Write_i     1 10ns, 0 30ns
run 40ns

force AVS_Address_i   00000000
force AVS_WriteData_i 0000000000000000
run 100ns

# Enable
force AVS_Address_i   00000000
force AVS_WriteData_i 0000000000000001, 0000000000000000 40ns
force AVS_Write_i     1 10ns, 0 30ns
run 40ns

run 10us

