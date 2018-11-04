EESchema Schematic File Version 4
LIBS:acoustic_levitation_wing-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 3
Title "Acoustic levitation"
Date "2018-03-24"
Rev "1.0"
Comp "Léa Strobino"
Comment1 "Wing PCB"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:GND #PWR04
U 1 1 5AA96AC3
P 6100 4800
AR Path="/5AB0E51A/5AA96AC3" Ref="#PWR04"  Part="1" 
AR Path="/5AB0F1A6/5AA96AC3" Ref="#PWR010"  Part="1" 
F 0 "#PWR04" H 6100 4550 50  0001 C CNN
F 1 "GND" H 6100 4650 50  0000 C CNN
F 2 "" H 6100 4800 50  0001 C CNN
F 3 "" H 6100 4800 50  0001 C CNN
	1    6100 4800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5AA9744B
P 6200 2600
AR Path="/5AB0E51A/5AA9744B" Ref="#PWR05"  Part="1" 
AR Path="/5AB0F1A6/5AA9744B" Ref="#PWR011"  Part="1" 
F 0 "#PWR05" H 6200 2350 50  0001 C CNN
F 1 "GND" H 6200 2450 50  0000 C CNN
F 2 "" H 6200 2600 50  0001 C CNN
F 3 "" H 6200 2600 50  0001 C CNN
	1    6200 2600
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C1
U 1 1 5AAA8E46
P 4950 2350
AR Path="/5AB0E51A/5AAA8E46" Ref="C1"  Part="1" 
AR Path="/5AB0F1A6/5AAA8E46" Ref="C3"  Part="1" 
F 0 "C1" H 4975 2450 50  0000 L CNN
F 1 "100n" H 4975 2250 50  0000 L CNN
F 2 "footprints:C_0805_HandSoldering" H 4988 2200 50  0001 C CNN
F 3 "" H 4950 2350 50  0001 C CNN
F 4 "Wurth Electronics Inc." H 4950 2350 60  0001 C CNN "Manufacturer"
F 5 "885012207072" H 4950 2350 60  0001 C CNN "ManufacturerPartNumber"
F 6 "Digi-Key" H 4950 2350 60  0001 C CNN "Supplier1"
F 7 "732-8061-1-ND" H 4950 2350 60  0001 C CNN "Supplier1PartNumber"
	1    4950 2350
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR06
U 1 1 5AAA8E48
P 4950 2000
AR Path="/5AB0E51A/5AAA8E48" Ref="#PWR06"  Part="1" 
AR Path="/5AB0F1A6/5AAA8E48" Ref="#PWR012"  Part="1" 
F 0 "#PWR06" H 4950 1850 50  0001 C CNN
F 1 "+3V3" H 4950 2140 50  0000 C CNN
F 2 "" H 4950 2000 50  0001 C CNN
F 3 "" H 4950 2000 50  0001 C CNN
	1    4950 2000
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR07
U 1 1 5AAA8E49
P 5650 2000
AR Path="/5AB0E51A/5AAA8E49" Ref="#PWR07"  Part="1" 
AR Path="/5AB0F1A6/5AAA8E49" Ref="#PWR013"  Part="1" 
F 0 "#PWR07" H 5650 1850 50  0001 C CNN
F 1 "+12V" H 5650 2140 50  0000 C CNN
F 2 "" H 5650 2000 50  0001 C CNN
F 3 "" H 5650 2000 50  0001 C CNN
	1    5650 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5AAA8E4A
P 4950 2600
AR Path="/5AB0E51A/5AAA8E4A" Ref="#PWR08"  Part="1" 
AR Path="/5AB0F1A6/5AAA8E4A" Ref="#PWR014"  Part="1" 
F 0 "#PWR08" H 4950 2350 50  0001 C CNN
F 1 "GND" H 4950 2450 50  0000 C CNN
F 2 "" H 4950 2600 50  0001 C CNN
F 3 "" H 4950 2600 50  0001 C CNN
	1    4950 2600
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR09
U 1 1 5AAA8E4B
P 4600 2750
AR Path="/5AB0E51A/5AAA8E4B" Ref="#PWR09"  Part="1" 
AR Path="/5AB0F1A6/5AAA8E4B" Ref="#PWR015"  Part="1" 
F 0 "#PWR09" H 4600 2600 50  0001 C CNN
F 1 "+3V3" H 4600 2890 50  0000 C CNN
F 2 "" H 4600 2750 50  0001 C CNN
F 3 "" H 4600 2750 50  0001 C CNN
	1    4600 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 2100 5350 2600
Wire Wire Line
	5350 2600 5500 2600
Wire Wire Line
	5500 2600 5500 2700
Wire Wire Line
	5650 2500 5650 2600
Wire Wire Line
	5650 2600 5800 2600
Wire Wire Line
	6100 2600 6100 2700
Wire Wire Line
	5800 2700 5800 2600
Connection ~ 5800 2600
Wire Wire Line
	5950 2700 5950 2600
Connection ~ 5950 2600
Connection ~ 6100 2600
Wire Wire Line
	4950 2000 4950 2100
Wire Wire Line
	4950 2500 4950 2600
Wire Wire Line
	4950 2100 5200 2100
Wire Wire Line
	5200 2100 5200 2700
Connection ~ 4950 2100
Wire Wire Line
	5350 2100 5650 2100
Wire Wire Line
	5650 2000 5650 2100
Connection ~ 5350 2600
Connection ~ 5650 2100
Connection ~ 5650 2600
Wire Wire Line
	5350 4700 5500 4700
Connection ~ 5800 4700
Wire Wire Line
	6100 4600 6100 4700
Wire Wire Line
	5950 4600 5950 4700
Connection ~ 5950 4700
Wire Wire Line
	5500 4600 5500 4700
Wire Wire Line
	5350 4600 5350 4700
Connection ~ 5500 4700
Wire Wire Line
	4600 3900 4700 3900
Connection ~ 4600 3900
Wire Wire Line
	4600 3500 4700 3500
Connection ~ 4600 3500
Wire Wire Line
	4600 3300 4700 3300
Connection ~ 4600 3300
Wire Wire Line
	4700 3100 4600 3100
Connection ~ 4600 3100
Connection ~ 6100 4700
Text HLabel 3900 2800 0    60   Input ~ 0
In[1..7]
Text HLabel 3900 4700 0    60   Input ~ 0
Enable
Wire Wire Line
	3900 4700 5200 4700
Wire Wire Line
	5200 4700 5200 4600
Wire Bus Line
	3900 2800 4000 2800
Entry Wire Line
	4000 2900 4100 3000
Entry Wire Line
	4000 3100 4100 3200
Entry Wire Line
	4000 3300 4100 3400
Entry Wire Line
	4000 3500 4100 3600
Entry Wire Line
	4000 4100 4100 4200
Entry Wire Line
	4000 3700 4100 3800
Wire Wire Line
	4100 3000 4700 3000
Wire Wire Line
	4100 3200 4700 3200
Wire Wire Line
	4100 3400 4700 3400
Wire Wire Line
	4100 3600 4700 3600
Wire Wire Line
	4100 3800 4700 3800
Wire Wire Line
	4100 4200 4700 4200
Text Label 4150 3000 0    60   ~ 0
In1
Text Label 4150 3200 0    60   ~ 0
In2
Text Label 4150 3400 0    60   ~ 0
In3
Text Label 4150 3600 0    60   ~ 0
In4
Text Label 4150 3800 0    60   ~ 0
In5
Text Label 4150 4200 0    60   ~ 0
In7
Wire Wire Line
	5800 4600 5800 4700
Wire Wire Line
	4700 4300 4600 4300
Wire Wire Line
	4600 4300 4600 4100
Wire Wire Line
	4700 4100 4600 4100
Connection ~ 4600 4100
Entry Wire Line
	4000 3900 4100 4000
Wire Wire Line
	4100 4000 4700 4000
Text Label 4150 4000 0    60   ~ 0
In6
Wire Wire Line
	4700 3700 4600 3700
Connection ~ 4600 3700
Wire Wire Line
	7550 3450 7350 3450
Wire Wire Line
	7350 3450 7350 3600
Wire Wire Line
	7350 3600 6600 3600
Wire Wire Line
	6600 3700 7350 3700
Wire Wire Line
	7350 3700 7350 3850
Wire Wire Line
	7350 3850 7550 3850
Wire Wire Line
	7550 3350 7250 3350
Wire Wire Line
	7250 3350 7250 3500
Wire Wire Line
	7250 3500 6600 3500
Wire Wire Line
	7550 2950 7150 2950
Wire Wire Line
	7150 2950 7150 3400
Wire Wire Line
	7150 3400 6600 3400
Wire Wire Line
	7550 2850 7050 2850
Wire Wire Line
	7050 2850 7050 3300
Wire Wire Line
	7050 3300 6600 3300
Wire Wire Line
	7550 2450 6950 2450
Wire Wire Line
	6950 2450 6950 3200
Wire Wire Line
	6950 3200 6600 3200
Wire Wire Line
	7550 2350 6850 2350
Wire Wire Line
	6850 2350 6850 3100
Wire Wire Line
	6850 3100 6600 3100
Wire Wire Line
	7550 1950 6750 1950
Wire Wire Line
	6750 1950 6750 3000
Wire Wire Line
	6750 3000 6600 3000
Wire Wire Line
	7550 3950 7250 3950
Wire Wire Line
	7250 3950 7250 3800
Wire Wire Line
	7250 3800 6600 3800
Wire Wire Line
	7550 4350 7150 4350
Wire Wire Line
	7150 4350 7150 3900
Wire Wire Line
	7150 3900 6600 3900
Wire Wire Line
	7550 4450 7050 4450
Wire Wire Line
	7050 4450 7050 4000
Wire Wire Line
	7050 4000 6600 4000
Wire Wire Line
	7550 4850 6950 4850
Wire Wire Line
	6950 4850 6950 4100
Wire Wire Line
	6950 4100 6600 4100
Wire Wire Line
	7550 4950 6850 4950
Wire Wire Line
	6850 4950 6850 4200
Wire Wire Line
	6850 4200 6600 4200
Wire Wire Line
	7550 5350 6750 5350
Wire Wire Line
	6750 5350 6750 4300
Wire Wire Line
	6750 4300 6600 4300
$Comp
L Device:C C2
U 1 1 5AC4E940
P 5650 2350
AR Path="/5AB0E51A/5AC4E940" Ref="C2"  Part="1" 
AR Path="/5AB0F1A6/5AC4E940" Ref="C4"  Part="1" 
F 0 "C2" H 5675 2450 50  0000 L CNN
F 1 "100n" H 5675 2250 50  0000 L CNN
F 2 "footprints:C_0805_HandSoldering" H 5688 2200 50  0001 C CNN
F 3 "" H 5650 2350 50  0001 C CNN
F 4 "Wurth Electronics Inc." H 5650 2350 60  0001 C CNN "Manufacturer"
F 5 "885012207072" H 5650 2350 60  0001 C CNN "ManufacturerPartNumber"
F 6 "Digi-Key" H 5650 2350 60  0001 C CNN "Supplier1"
F 7 "732-8061-1-ND" H 5650 2350 60  0001 C CNN "Supplier1PartNumber"
	1    5650 2350
	1    0    0    -1  
$EndComp
$Comp
L library:MAX17079 U1
U 1 1 5AC4E987
P 5650 3650
AR Path="/5AB0E51A/5AC4E987" Ref="U1"  Part="1" 
AR Path="/5AB0F1A6/5AC4E987" Ref="U2"  Part="1" 
F 0 "U1" H 6200 4500 60  0000 L CNN
F 1 "MAX17079" H 6200 2800 60  0000 L CNN
F 2 "footprints:QFN-40-1EP_6x6mm_Pitch0.5mm_HandSoldering" H 6200 2700 50  0001 L CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/MAX17079.pdf" H 6200 2600 50  0001 L CNN
F 4 "Maxim Integrated" H 6200 2500 50  0001 L CNN "Manufacturer"
F 5 "MAX17079GTL+" H 6900 2500 50  0001 L CNN "ManufacturerPartNumber"
F 6 "Digi-Key" H 6200 2400 50  0001 L CNN "Supplier1"
F 7 "MAX17079GTL+-ND" H 6600 2400 50  0001 L CNN "Supplier1PartNumber"
	1    5650 3650
	1    0    0    -1  
$EndComp
$Comp
L library:MA40S4S TR1
U 1 1 5AC4E9C8
P 7550 2150
AR Path="/5AB0E51A/5AC4E9C8" Ref="TR1"  Part="1" 
AR Path="/5AB0F1A6/5AC4E9C8" Ref="TR8"  Part="1" 
F 0 "TR1" H 7650 2250 50  0000 L CNN
F 1 "MA40S4S" H 7650 2050 50  0000 L CNN
F 2 "footprints:Murata_MA40S4S_TE_8134-HC-8P2" H 7650 1950 50  0001 L CNN
F 3 "https://www.murata.com/~/media/webrenewal/products/sensor/ultrasonic/open/datasheet_maopn.pdf" H 7650 1850 50  0001 L CNN
F 4 "Murata" H 7650 1750 50  0001 L CNN "Manufacturer"
F 5 "MA40S4S" H 7950 1750 50  0001 L CNN "ManufacturerPartNumber"
F 6 "Digi-Key" H 7650 1650 50  0001 L CNN "Supplier1"
F 7 "490-7707-ND" H 8050 1650 50  0001 L CNN "Supplier1PartNumber"
	1    7550 2150
	1    0    0    -1  
$EndComp
$Comp
L library:MA40S4S TR2
U 1 1 5AC4EA1E
P 7550 2650
AR Path="/5AB0E51A/5AC4EA1E" Ref="TR2"  Part="1" 
AR Path="/5AB0F1A6/5AC4EA1E" Ref="TR9"  Part="1" 
F 0 "TR2" H 7650 2750 50  0000 L CNN
F 1 "MA40S4S" H 7650 2550 50  0000 L CNN
F 2 "footprints:Murata_MA40S4S_TE_8134-HC-8P2" H 7650 2450 50  0001 L CNN
F 3 "https://www.murata.com/~/media/webrenewal/products/sensor/ultrasonic/open/datasheet_maopn.pdf" H 7650 2350 50  0001 L CNN
F 4 "Murata" H 7650 2250 50  0001 L CNN "Manufacturer"
F 5 "MA40S4S" H 7950 2250 50  0001 L CNN "ManufacturerPartNumber"
F 6 "Digi-Key" H 7650 2150 50  0001 L CNN "Supplier1"
F 7 "490-7707-ND" H 8050 2150 50  0001 L CNN "Supplier1PartNumber"
	1    7550 2650
	1    0    0    -1  
$EndComp
$Comp
L library:MA40S4S TR3
U 1 1 5AC4EA4D
P 7550 3150
AR Path="/5AB0E51A/5AC4EA4D" Ref="TR3"  Part="1" 
AR Path="/5AB0F1A6/5AC4EA4D" Ref="TR10"  Part="1" 
F 0 "TR3" H 7650 3250 50  0000 L CNN
F 1 "MA40S4S" H 7650 3050 50  0000 L CNN
F 2 "footprints:Murata_MA40S4S_TE_8134-HC-8P2" H 7650 2950 50  0001 L CNN
F 3 "https://www.murata.com/~/media/webrenewal/products/sensor/ultrasonic/open/datasheet_maopn.pdf" H 7650 2850 50  0001 L CNN
F 4 "Murata" H 7650 2750 50  0001 L CNN "Manufacturer"
F 5 "MA40S4S" H 7950 2750 50  0001 L CNN "ManufacturerPartNumber"
F 6 "Digi-Key" H 7650 2650 50  0001 L CNN "Supplier1"
F 7 "490-7707-ND" H 8050 2650 50  0001 L CNN "Supplier1PartNumber"
	1    7550 3150
	1    0    0    -1  
$EndComp
$Comp
L library:MA40S4S TR4
U 1 1 5AC4EA7C
P 7550 3650
AR Path="/5AB0E51A/5AC4EA7C" Ref="TR4"  Part="1" 
AR Path="/5AB0F1A6/5AC4EA7C" Ref="TR11"  Part="1" 
F 0 "TR4" H 7650 3750 50  0000 L CNN
F 1 "MA40S4S" H 7650 3550 50  0000 L CNN
F 2 "footprints:Murata_MA40S4S_TE_8134-HC-8P2" H 7650 3450 50  0001 L CNN
F 3 "https://www.murata.com/~/media/webrenewal/products/sensor/ultrasonic/open/datasheet_maopn.pdf" H 7650 3350 50  0001 L CNN
F 4 "Murata" H 7650 3250 50  0001 L CNN "Manufacturer"
F 5 "MA40S4S" H 7950 3250 50  0001 L CNN "ManufacturerPartNumber"
F 6 "Digi-Key" H 7650 3150 50  0001 L CNN "Supplier1"
F 7 "490-7707-ND" H 8050 3150 50  0001 L CNN "Supplier1PartNumber"
	1    7550 3650
	1    0    0    -1  
$EndComp
$Comp
L library:MA40S4S TR5
U 1 1 5AC4EAB0
P 7550 4150
AR Path="/5AB0E51A/5AC4EAB0" Ref="TR5"  Part="1" 
AR Path="/5AB0F1A6/5AC4EAB0" Ref="TR12"  Part="1" 
F 0 "TR5" H 7650 4250 50  0000 L CNN
F 1 "MA40S4S" H 7650 4050 50  0000 L CNN
F 2 "footprints:Murata_MA40S4S_TE_8134-HC-8P2" H 7650 3950 50  0001 L CNN
F 3 "https://www.murata.com/~/media/webrenewal/products/sensor/ultrasonic/open/datasheet_maopn.pdf" H 7650 3850 50  0001 L CNN
F 4 "Murata" H 7650 3750 50  0001 L CNN "Manufacturer"
F 5 "MA40S4S" H 7950 3750 50  0001 L CNN "ManufacturerPartNumber"
F 6 "Digi-Key" H 7650 3650 50  0001 L CNN "Supplier1"
F 7 "490-7707-ND" H 8050 3650 50  0001 L CNN "Supplier1PartNumber"
	1    7550 4150
	1    0    0    -1  
$EndComp
$Comp
L library:MA40S4S TR6
U 1 1 5AC4EAE5
P 7550 4650
AR Path="/5AB0E51A/5AC4EAE5" Ref="TR6"  Part="1" 
AR Path="/5AB0F1A6/5AC4EAE5" Ref="TR13"  Part="1" 
F 0 "TR6" H 7650 4750 50  0000 L CNN
F 1 "MA40S4S" H 7650 4550 50  0000 L CNN
F 2 "footprints:Murata_MA40S4S_TE_8134-HC-8P2" H 7650 4450 50  0001 L CNN
F 3 "https://www.murata.com/~/media/webrenewal/products/sensor/ultrasonic/open/datasheet_maopn.pdf" H 7650 4350 50  0001 L CNN
F 4 "Murata" H 7650 4250 50  0001 L CNN "Manufacturer"
F 5 "MA40S4S" H 7950 4250 50  0001 L CNN "ManufacturerPartNumber"
F 6 "Digi-Key" H 7650 4150 50  0001 L CNN "Supplier1"
F 7 "490-7707-ND" H 8050 4150 50  0001 L CNN "Supplier1PartNumber"
	1    7550 4650
	1    0    0    -1  
$EndComp
$Comp
L library:MA40S4S TR7
U 1 1 5AC4EB20
P 7550 5150
AR Path="/5AB0E51A/5AC4EB20" Ref="TR7"  Part="1" 
AR Path="/5AB0F1A6/5AC4EB20" Ref="TR14"  Part="1" 
F 0 "TR7" H 7650 5250 50  0000 L CNN
F 1 "MA40S4S" H 7650 5050 50  0000 L CNN
F 2 "footprints:Murata_MA40S4S_TE_8134-HC-8P2" H 7650 4950 50  0001 L CNN
F 3 "https://www.murata.com/~/media/webrenewal/products/sensor/ultrasonic/open/datasheet_maopn.pdf" H 7650 4850 50  0001 L CNN
F 4 "Murata" H 7650 4750 50  0001 L CNN "Manufacturer"
F 5 "MA40S4S" H 7950 4750 50  0001 L CNN "ManufacturerPartNumber"
F 6 "Digi-Key" H 7650 4650 50  0001 L CNN "Supplier1"
F 7 "490-7707-ND" H 8050 4650 50  0001 L CNN "Supplier1PartNumber"
	1    7550 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 2600 5950 2600
Wire Wire Line
	5950 2600 6100 2600
Wire Wire Line
	6100 2600 6200 2600
Wire Wire Line
	4950 2100 4950 2200
Wire Wire Line
	5350 2600 5350 2700
Wire Wire Line
	5650 2100 5650 2200
Wire Wire Line
	5650 2600 5650 2700
Wire Wire Line
	5800 4700 5950 4700
Wire Wire Line
	5950 4700 6100 4700
Wire Wire Line
	5500 4700 5800 4700
Wire Wire Line
	4600 3900 4600 3700
Wire Wire Line
	4600 3500 4600 3300
Wire Wire Line
	4600 3300 4600 3100
Wire Wire Line
	4600 3100 4600 2750
Wire Wire Line
	6100 4700 6100 4800
Wire Wire Line
	4600 4100 4600 3900
Wire Wire Line
	4600 3700 4600 3500
Wire Bus Line
	4000 2800 4000 4100
$EndSCHEMATC
