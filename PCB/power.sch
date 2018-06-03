EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:library
LIBS:acoustic_levitation_main-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 12 12
Title "Acoustic levitation"
Date "2018-03-24"
Rev "1.0"
Comp "Léa Strobino"
Comment1 "Main PCB"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L GND #PWR064
U 1 1 5AAB1DD3
P 5100 3700
F 0 "#PWR064" H 5100 3450 50  0001 C CNN
F 1 "GND" H 5100 3550 50  0000 C CNN
F 2 "" H 5100 3700 50  0001 C CNN
F 3 "" H 5100 3700 50  0001 C CNN
	1    5100 3700
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR065
U 1 1 5AAB1DEA
P 5700 3050
F 0 "#PWR065" H 5700 2900 50  0001 C CNN
F 1 "+12V" H 5700 3200 50  0000 C CNN
F 2 "" H 5700 3050 50  0001 C CNN
F 3 "" H 5700 3050 50  0001 C CNN
	1    5700 3050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR066
U 1 1 5AAA7C9E
P 6300 3700
F 0 "#PWR066" H 6300 3450 50  0001 C CNN
F 1 "GND" H 6300 3550 50  0000 C CNN
F 2 "" H 6300 3700 50  0001 C CNN
F 3 "" H 6300 3700 50  0001 C CNN
	1    6300 3700
	1    0    0    -1  
$EndComp
$Comp
L Barrel_Jack J10
U 1 1 5AAAC0A9
P 4700 3350
F 0 "J10" H 4700 3560 50  0000 C CNN
F 1 "PJ-102AH" H 4700 3175 50  0000 C CNN
F 2 "footprints:CUI_PJ-102AH" H 4750 3310 50  0001 C CNN
F 3 "" H 4750 3310 50  0001 C CNN
F 4 "CUI Inc." H 4700 3350 60  0001 C CNN "Manufacturer"
F 5 "PJ-102AH" H 4700 3350 60  0001 C CNN "ManufacturerPartNumber"
F 6 "Digi-Key" H 4700 3350 60  0001 C CNN "Supplier1"
F 7 "CP-102AH-ND" H 4700 3350 60  0001 C CNN "Supplier1PartNumber"
	1    4700 3350
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR067
U 1 1 5AABB86C
P 6900 3050
F 0 "#PWR067" H 6900 2900 50  0001 C CNN
F 1 "+5V" H 6900 3200 50  0000 C CNN
F 2 "" H 6900 3050 50  0001 C CNN
F 3 "" H 6900 3050 50  0001 C CNN
	1    6900 3050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR068
U 1 1 5AB62943
P 5400 3700
F 0 "#PWR068" H 5400 3450 50  0001 C CNN
F 1 "GND" H 5400 3550 50  0000 C CNN
F 2 "" H 5400 3700 50  0001 C CNN
F 3 "" H 5400 3700 50  0001 C CNN
	1    5400 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 3250 5800 3250
Wire Wire Line
	5700 3250 5700 3050
Wire Wire Line
	5000 3350 5100 3350
Wire Wire Line
	5100 3350 5100 3700
Connection ~ 5700 3250
Wire Wire Line
	6800 3250 6900 3250
Wire Wire Line
	6900 3250 6900 3050
Wire Wire Line
	5000 3450 5100 3450
Connection ~ 5100 3450
Wire Wire Line
	5000 3250 5200 3250
Wire Wire Line
	5400 3550 5400 3700
$Comp
L +VDC #PWR069
U 1 1 5AB6380E
P 5100 3150
F 0 "#PWR069" H 5100 3050 50  0001 C CNN
F 1 "+VDC" H 5100 3400 50  0000 C CNN
F 2 "" H 5100 3150 50  0001 C CNN
F 3 "" H 5100 3150 50  0001 C CNN
	1    5100 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 3150 5100 3250
Connection ~ 5100 3250
$Comp
L Si3421DV Q1
U 1 1 5AC4DD7C
P 5400 3350
F 0 "Q1" H 5600 3400 50  0000 L CNN
F 1 "Si3421DV" H 5600 3300 50  0000 L CNN
F 2 "footprints:TSOP-6_2.9x1.5mm_Pitch0.95mm" H 5600 3200 50  0001 L CNN
F 3 "http://www.vishay.com/docs/62921/si3421dv.pdf" H 5600 3100 50  0001 L CNN
F 4 "Digi-Key" H 5600 2900 50  0001 L CNN "Supplier1"
F 5 "SI3421DV-T1-GE3" H 6250 3000 50  0001 L CNN "ManufacturerPartNumber"
F 6 "SI3421DV-T1-GE3CT-ND" H 6000 2900 50  0001 L CNN "Supplier1PartNumber"
F 7 "Vishay Siliconix" H 5600 3000 50  0001 L CNN "Manufacturer"
	1    5400 3350
	0    -1   -1   0   
$EndComp
$Comp
L TSR2-2450 U7
U 1 1 5AC4DDD8
P 6300 3350
F 0 "U7" H 6000 3600 60  0000 L CNN
F 1 "TSR2-2450" H 6350 3100 60  0000 L CNN
F 2 "footprints:Traco_TSR2" H 6350 3000 50  0001 L CNN
F 3 "https://assets.tracopower.com/TSR2/documents/tsr2-datasheet.pdf" H 6350 2900 50  0001 L CNN
F 4 "300-67-301" H 6750 2600 50  0001 L CNN "Supplier2PartNumber"
F 5 "495-TSR2-2450" H 6650 2700 50  0001 L CNN "Supplier1PartNumber"
F 6 "Distrelec" H 6350 2600 50  0001 L CNN "Supplier2"
F 7 "Mouser" H 6350 2700 50  0001 L CNN "Supplier1"
F 8 "Traco Power" H 6350 2800 50  0001 L CNN "Manufacturer"
F 9 "TSR 2-2450" H 6850 2800 50  0001 L CNN "ManufacturerPartNumber"
	1    6300 3350
	1    0    0    -1  
$EndComp
$EndSCHEMATC
