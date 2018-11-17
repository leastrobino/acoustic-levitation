###############################################################################
# piezo.udo  -*- mode: tcl -*-
# =========
#
# Author       : Léa Strobino
# Revision     : 1.0
# Last updated : Tue, 13 Nov 2018 20:52:58 +0100
###############################################################################

restart -f

# 50 MHz clock
force -freeze clk_i 1, 0 10ns -r 20ns

# Reset
force reset_n_i 0, 1 50ns

run 100ns

# Synchronization
force sync_p1_i 1, 0 20ns -r 400ns

# Piezo duration = 10, phase = 0
force duration_i 0000000000001010
force phase_i    0000000000000000

run 500ns

# Enable
force enable_i 1

run 1us

# Piezo phase = 2
force phase_i 0000000000000010

run 1us

