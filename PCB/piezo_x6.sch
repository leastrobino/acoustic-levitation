EESchema Schematic File Version 4
LIBS:acoustic_levitation_main-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 12
Title "Acoustic levitation"
Date "2018-03-24"
Rev "1.0"
Comp "Main PCB"
Comment1 "License: CERN OHL v1.2"
Comment2 "Author: Léa Strobino"
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:GND #PWR010
U 1 1 5AA96AC3
P 6100 4800
AR Path="/5AAA516B/5AA96AC3" Ref="#PWR010"  Part="1" 
AR Path="/5AAA7BC7/5AA96AC3" Ref="#PWR017"  Part="1" 
AR Path="/5AAA7BDC/5AA96AC3" Ref="#PWR024"  Part="1" 
AR Path="/5AAA7C29/5AA96AC3" Ref="#PWR031"  Part="1" 
AR Path="/5AAA7C6A/5AA96AC3" Ref="#PWR038"  Part="1" 
AR Path="/5AAA7C7F/5AA96AC3" Ref="#PWR045"  Part="1" 
F 0 "#PWR010" H 6100 4550 50  0001 C CNN
F 1 "GND" H 6100 4650 50  0000 C CNN
F 2 "" H 6100 4800 50  0001 C CNN
F 3 "" H 6100 4800 50  0001 C CNN
	1    6100 4800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 5AA9744B
P 6200 2600
AR Path="/5AAA516B/5AA9744B" Ref="#PWR011"  Part="1" 
AR Path="/5AAA7BC7/5AA9744B" Ref="#PWR018"  Part="1" 
AR Path="/5AAA7BDC/5AA9744B" Ref="#PWR025"  Part="1" 
AR Path="/5AAA7C29/5AA9744B" Ref="#PWR032"  Part="1" 
AR Path="/5AAA7C6A/5AA9744B" Ref="#PWR039"  Part="1" 
AR Path="/5AAA7C7F/5AA9744B" Ref="#PWR046"  Part="1" 
F 0 "#PWR011" H 6200 2350 50  0001 C CNN
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
AR Path="/5AAA516B/5AAA8E46" Ref="C1"  Part="1" 
AR Path="/5AAA7BC7/5AAA8E46" Ref="C3"  Part="1" 
AR Path="/5AAA7BDC/5AAA8E46" Ref="C5"  Part="1" 
AR Path="/5AAA7C29/5AAA8E46" Ref="C7"  Part="1" 
AR Path="/5AAA7C6A/5AAA8E46" Ref="C9"  Part="1" 
AR Path="/5AAA7C7F/5AAA8E46" Ref="C11"  Part="1" 
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
L power:+3V3 #PWR012
U 1 1 5AAA8E48
P 4950 2000
AR Path="/5AAA516B/5AAA8E48" Ref="#PWR012"  Part="1" 
AR Path="/5AAA7BC7/5AAA8E48" Ref="#PWR019"  Part="1" 
AR Path="/5AAA7BDC/5AAA8E48" Ref="#PWR026"  Part="1" 
AR Path="/5AAA7C29/5AAA8E48" Ref="#PWR033"  Part="1" 
AR Path="/5AAA7C6A/5AAA8E48" Ref="#PWR040"  Part="1" 
AR Path="/5AAA7C7F/5AAA8E48" Ref="#PWR047"  Part="1" 
F 0 "#PWR012" H 4950 1850 50  0001 C CNN
F 1 "+3V3" H 4950 2140 50  0000 C CNN
F 2 "" H 4950 2000 50  0001 C CNN
F 3 "" H 4950 2000 50  0001 C CNN
	1    4950 2000
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR013
U 1 1 5AAA8E49
P 5650 2000
AR Path="/5AAA516B/5AAA8E49" Ref="#PWR013"  Part="1" 
AR Path="/5AAA7BC7/5AAA8E49" Ref="#PWR020"  Part="1" 
AR Path="/5AAA7BDC/5AAA8E49" Ref="#PWR027"  Part="1" 
AR Path="/5AAA7C29/5AAA8E49" Ref="#PWR034"  Part="1" 
AR Path="/5AAA7C6A/5AAA8E49" Ref="#PWR041"  Part="1" 
AR Path="/5AAA7C7F/5AAA8E49" Ref="#PWR048"  Part="1" 
F 0 "#PWR013" H 5650 1850 50  0001 C CNN
F 1 "+12V" H 5650 2140 50  0000 C CNN
F 2 "" H 5650 2000 50  0001 C CNN
F 3 "" H 5650 2000 50  0001 C CNN
	1    5650 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR014
U 1 1 5AAA8E4A
P 4950 2600
AR Path="/5AAA516B/5AAA8E4A" Ref="#PWR014"  Part="1" 
AR Path="/5AAA7BC7/5AAA8E4A" Ref="#PWR021"  Part="1" 
AR Path="/5AAA7BDC/5AAA8E4A" Ref="#PWR028"  Part="1" 
AR Path="/5AAA7C29/5AAA8E4A" Ref="#PWR035"  Part="1" 
AR Path="/5AAA7C6A/5AAA8E4A" Ref="#PWR042"  Part="1" 
AR Path="/5AAA7C7F/5AAA8E4A" Ref="#PWR049"  Part="1" 
F 0 "#PWR014" H 4950 2350 50  0001 C CNN
F 1 "GND" H 4950 2450 50  0000 C CNN
F 2 "" H 4950 2600 50  0001 C CNN
F 3 "" H 4950 2600 50  0001 C CNN
	1    4950 2600
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR015
U 1 1 5AAA8E4B
P 4600 2750
AR Path="/5AAA516B/5AAA8E4B" Ref="#PWR015"  Part="1" 
AR Path="/5AAA7BC7/5AAA8E4B" Ref="#PWR022"  Part="1" 
AR Path="/5AAA7BDC/5AAA8E4B" Ref="#PWR029"  Part="1" 
AR Path="/5AAA7C29/5AAA8E4B" Ref="#PWR036"  Part="1" 
AR Path="/5AAA7C6A/5AAA8E4B" Ref="#PWR043"  Part="1" 
AR Path="/5AAA7C7F/5AAA8E4B" Ref="#PWR050"  Part="1" 
F 0 "#PWR015" H 4600 2600 50  0001 C CNN
F 1 "+3V3" H 4600 2890 50  0000 C CNN
F 2 "" H 4600 2750 50  0001 C CNN
F 3 "" H 4600 2750 50  0001 C CNN
	1    4600 2750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR016
U 1 1 5AAA6DA1
P 4500 4800
AR Path="/5AAA516B/5AAA6DA1" Ref="#PWR016"  Part="1" 
AR Path="/5AAA7BC7/5AAA6DA1" Ref="#PWR023"  Part="1" 
AR Path="/5AAA7BDC/5AAA6DA1" Ref="#PWR030"  Part="1" 
AR Path="/5AAA7C29/5AAA6DA1" Ref="#PWR037"  Part="1" 
AR Path="/5AAA7C6A/5AAA6DA1" Ref="#PWR044"  Part="1" 
AR Path="/5AAA7C7F/5AAA6DA1" Ref="#PWR051"  Part="1" 
F 0 "#PWR016" H 4500 4550 50  0001 C CNN
F 1 "GND" H 4500 4650 50  0000 C CNN
F 2 "" H 4500 4800 50  0001 C CNN
F 3 "" H 4500 4800 50  0001 C CNN
	1    4500 4800
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
Wire Wire Line
	7550 3600 7350 3600
Wire Wire Line
	7350 3600 7350 3500
Wire Wire Line
	6600 3400 7350 3400
Wire Wire Line
	7350 3400 7350 3200
Wire Wire Line
	7350 3200 7550 3200
Wire Wire Line
	6600 3300 7250 3300
Wire Wire Line
	7250 3300 7250 3100
Wire Wire Line
	7250 3100 7550 3100
Wire Wire Line
	6600 3200 7150 3200
Wire Wire Line
	7150 3200 7150 2700
Wire Wire Line
	7150 2700 7550 2700
Wire Wire Line
	6600 3100 7050 3100
Wire Wire Line
	7050 3100 7050 2600
Wire Wire Line
	7050 2600 7550 2600
Wire Wire Line
	6600 3000 6950 3000
Wire Wire Line
	6950 3000 6950 2200
Wire Wire Line
	6950 2200 7550 2200
Wire Wire Line
	7350 3500 6600 3500
Connection ~ 6100 4700
Text HLabel 3900 2800 0    60   Input ~ 0
In[1..6]
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
	4000 3700 4100 3800
Entry Wire Line
	4000 4100 4100 4200
Entry Wire Line
	4000 3900 4100 4000
Wire Wire Line
	4100 3000 4700 3000
Wire Wire Line
	4100 3200 4700 3200
Wire Wire Line
	4100 3400 4700 3400
Wire Wire Line
	4100 3800 4700 3800
Wire Wire Line
	4100 4000 4700 4000
Wire Wire Line
	4100 4200 4700 4200
Text Label 4150 3000 0    60   ~ 0
In1
Text Label 4150 3200 0    60   ~ 0
In2
Text Label 4150 3400 0    60   ~ 0
In3
Text Label 4150 3800 0    60   ~ 0
In4
Text Label 4150 4000 0    60   ~ 0
In5
Text Label 4150 4200 0    60   ~ 0
In6
Wire Wire Line
	5800 4600 5800 4700
NoConn ~ 6600 3600
NoConn ~ 6600 3700
Wire Wire Line
	7550 3700 7350 3700
Wire Wire Line
	7350 3700 7350 3800
Wire Wire Line
	7350 3800 6600 3800
Wire Wire Line
	6600 3900 7350 3900
Wire Wire Line
	7350 3900 7350 4100
Wire Wire Line
	7350 4100 7550 4100
Wire Wire Line
	7550 4200 7250 4200
Wire Wire Line
	7250 4200 7250 4000
Wire Wire Line
	7250 4000 6600 4000
Wire Wire Line
	6600 4100 7150 4100
Wire Wire Line
	7150 4100 7150 4600
Wire Wire Line
	7150 4600 7550 4600
Wire Wire Line
	7550 4700 7050 4700
Wire Wire Line
	7050 4700 7050 4200
Wire Wire Line
	7050 4200 6600 4200
Wire Wire Line
	6600 4300 6950 4300
Wire Wire Line
	6950 4300 6950 5100
Wire Wire Line
	6950 5100 7550 5100
Wire Wire Line
	4600 4300 4700 4300
Wire Wire Line
	4600 2750 4600 3100
Wire Wire Line
	4700 4100 4600 4100
Connection ~ 4600 4100
Wire Wire Line
	4700 3700 4500 3700
Wire Wire Line
	4500 3600 4500 3700
Wire Wire Line
	4700 3600 4500 3600
Connection ~ 4500 3700
$Comp
L Device:C C2
U 1 1 5AC4D782
P 5650 2350
AR Path="/5AAA516B/5AC4D782" Ref="C2"  Part="1" 
AR Path="/5AAA7BC7/5AC4D782" Ref="C4"  Part="1" 
AR Path="/5AAA7BDC/5AC4D782" Ref="C6"  Part="1" 
AR Path="/5AAA7C29/5AC4D782" Ref="C8"  Part="1" 
AR Path="/5AAA7C6A/5AC4D782" Ref="C10"  Part="1" 
AR Path="/5AAA7C7F/5AC4D782" Ref="C12"  Part="1" 
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
U 1 1 5AC4D7DE
P 5650 3650
AR Path="/5AAA516B/5AC4D7DE" Ref="U1"  Part="1" 
AR Path="/5AAA7BC7/5AC4D7DE" Ref="U2"  Part="1" 
AR Path="/5AAA7BDC/5AC4D7DE" Ref="U3"  Part="1" 
AR Path="/5AAA7C29/5AC4D7DE" Ref="U4"  Part="1" 
AR Path="/5AAA7C6A/5AC4D7DE" Ref="U5"  Part="1" 
AR Path="/5AAA7C7F/5AC4D7DE" Ref="U6"  Part="1" 
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
U 1 1 5AC4D8A9
P 7550 2400
AR Path="/5AAA516B/5AC4D8A9" Ref="TR1"  Part="1" 
AR Path="/5AAA7BC7/5AC4D8A9" Ref="TR7"  Part="1" 
AR Path="/5AAA7BDC/5AC4D8A9" Ref="TR13"  Part="1" 
AR Path="/5AAA7C29/5AC4D8A9" Ref="TR19"  Part="1" 
AR Path="/5AAA7C6A/5AC4D8A9" Ref="TR25"  Part="1" 
AR Path="/5AAA7C7F/5AC4D8A9" Ref="TR31"  Part="1" 
F 0 "TR1" H 7650 2500 50  0000 L CNN
F 1 "MA40S4S" H 7650 2300 50  0000 L CNN
F 2 "footprints:Murata_MA40S4S_TE_8134-HC-8P2" H 7650 2200 50  0001 L CNN
F 3 "https://www.murata.com/~/media/webrenewal/products/sensor/ultrasonic/open/datasheet_maopn.pdf" H 7650 2100 50  0001 L CNN
F 4 "Murata" H 7650 2000 50  0001 L CNN "Manufacturer"
F 5 "MA40S4S" H 7950 2000 50  0001 L CNN "ManufacturerPartNumber"
F 6 "Digi-Key" H 7650 1900 50  0001 L CNN "Supplier1"
F 7 "490-7707-ND" H 8050 1900 50  0001 L CNN "Supplier1PartNumber"
	1    7550 2400
	1    0    0    -1  
$EndComp
$Comp
L library:MA40S4S TR2
U 1 1 5AC4D904
P 7550 2900
AR Path="/5AAA516B/5AC4D904" Ref="TR2"  Part="1" 
AR Path="/5AAA7BC7/5AC4D904" Ref="TR8"  Part="1" 
AR Path="/5AAA7BDC/5AC4D904" Ref="TR14"  Part="1" 
AR Path="/5AAA7C29/5AC4D904" Ref="TR20"  Part="1" 
AR Path="/5AAA7C6A/5AC4D904" Ref="TR26"  Part="1" 
AR Path="/5AAA7C7F/5AC4D904" Ref="TR32"  Part="1" 
F 0 "TR2" H 7650 3000 50  0000 L CNN
F 1 "MA40S4S" H 7650 2800 50  0000 L CNN
F 2 "footprints:Murata_MA40S4S_TE_8134-HC-8P2" H 7650 2700 50  0001 L CNN
F 3 "https://www.murata.com/~/media/webrenewal/products/sensor/ultrasonic/open/datasheet_maopn.pdf" H 7650 2600 50  0001 L CNN
F 4 "Murata" H 7650 2500 50  0001 L CNN "Manufacturer"
F 5 "MA40S4S" H 7950 2500 50  0001 L CNN "ManufacturerPartNumber"
F 6 "Digi-Key" H 7650 2400 50  0001 L CNN "Supplier1"
F 7 "490-7707-ND" H 8050 2400 50  0001 L CNN "Supplier1PartNumber"
	1    7550 2900
	1    0    0    -1  
$EndComp
$Comp
L library:MA40S4S TR3
U 1 1 5AC4D930
P 7550 3400
AR Path="/5AAA516B/5AC4D930" Ref="TR3"  Part="1" 
AR Path="/5AAA7BC7/5AC4D930" Ref="TR9"  Part="1" 
AR Path="/5AAA7BDC/5AC4D930" Ref="TR15"  Part="1" 
AR Path="/5AAA7C29/5AC4D930" Ref="TR21"  Part="1" 
AR Path="/5AAA7C6A/5AC4D930" Ref="TR27"  Part="1" 
AR Path="/5AAA7C7F/5AC4D930" Ref="TR33"  Part="1" 
F 0 "TR3" H 7650 3500 50  0000 L CNN
F 1 "MA40S4S" H 7650 3300 50  0000 L CNN
F 2 "footprints:Murata_MA40S4S_TE_8134-HC-8P2" H 7650 3200 50  0001 L CNN
F 3 "https://www.murata.com/~/media/webrenewal/products/sensor/ultrasonic/open/datasheet_maopn.pdf" H 7650 3100 50  0001 L CNN
F 4 "Murata" H 7650 3000 50  0001 L CNN "Manufacturer"
F 5 "MA40S4S" H 7950 3000 50  0001 L CNN "ManufacturerPartNumber"
F 6 "Digi-Key" H 7650 2900 50  0001 L CNN "Supplier1"
F 7 "490-7707-ND" H 8050 2900 50  0001 L CNN "Supplier1PartNumber"
	1    7550 3400
	1    0    0    -1  
$EndComp
$Comp
L library:MA40S4S TR4
U 1 1 5AC4D961
P 7550 3900
AR Path="/5AAA516B/5AC4D961" Ref="TR4"  Part="1" 
AR Path="/5AAA7BC7/5AC4D961" Ref="TR10"  Part="1" 
AR Path="/5AAA7BDC/5AC4D961" Ref="TR16"  Part="1" 
AR Path="/5AAA7C29/5AC4D961" Ref="TR22"  Part="1" 
AR Path="/5AAA7C6A/5AC4D961" Ref="TR28"  Part="1" 
AR Path="/5AAA7C7F/5AC4D961" Ref="TR34"  Part="1" 
F 0 "TR4" H 7650 4000 50  0000 L CNN
F 1 "MA40S4S" H 7650 3800 50  0000 L CNN
F 2 "footprints:Murata_MA40S4S_TE_8134-HC-8P2" H 7650 3700 50  0001 L CNN
F 3 "https://www.murata.com/~/media/webrenewal/products/sensor/ultrasonic/open/datasheet_maopn.pdf" H 7650 3600 50  0001 L CNN
F 4 "Murata" H 7650 3500 50  0001 L CNN "Manufacturer"
F 5 "MA40S4S" H 7950 3500 50  0001 L CNN "ManufacturerPartNumber"
F 6 "Digi-Key" H 7650 3400 50  0001 L CNN "Supplier1"
F 7 "490-7707-ND" H 8050 3400 50  0001 L CNN "Supplier1PartNumber"
	1    7550 3900
	1    0    0    -1  
$EndComp
$Comp
L library:MA40S4S TR5
U 1 1 5AC4D997
P 7550 4400
AR Path="/5AAA516B/5AC4D997" Ref="TR5"  Part="1" 
AR Path="/5AAA7BC7/5AC4D997" Ref="TR11"  Part="1" 
AR Path="/5AAA7BDC/5AC4D997" Ref="TR17"  Part="1" 
AR Path="/5AAA7C29/5AC4D997" Ref="TR23"  Part="1" 
AR Path="/5AAA7C6A/5AC4D997" Ref="TR29"  Part="1" 
AR Path="/5AAA7C7F/5AC4D997" Ref="TR35"  Part="1" 
F 0 "TR5" H 7650 4500 50  0000 L CNN
F 1 "MA40S4S" H 7650 4300 50  0000 L CNN
F 2 "footprints:Murata_MA40S4S_TE_8134-HC-8P2" H 7650 4200 50  0001 L CNN
F 3 "https://www.murata.com/~/media/webrenewal/products/sensor/ultrasonic/open/datasheet_maopn.pdf" H 7650 4100 50  0001 L CNN
F 4 "Murata" H 7650 4000 50  0001 L CNN "Manufacturer"
F 5 "MA40S4S" H 7950 4000 50  0001 L CNN "ManufacturerPartNumber"
F 6 "Digi-Key" H 7650 3900 50  0001 L CNN "Supplier1"
F 7 "490-7707-ND" H 8050 3900 50  0001 L CNN "Supplier1PartNumber"
	1    7550 4400
	1    0    0    -1  
$EndComp
$Comp
L library:MA40S4S TR6
U 1 1 5AC4D9CF
P 7550 4900
AR Path="/5AAA516B/5AC4D9CF" Ref="TR6"  Part="1" 
AR Path="/5AAA7BC7/5AC4D9CF" Ref="TR12"  Part="1" 
AR Path="/5AAA7BDC/5AC4D9CF" Ref="TR18"  Part="1" 
AR Path="/5AAA7C29/5AC4D9CF" Ref="TR24"  Part="1" 
AR Path="/5AAA7C6A/5AC4D9CF" Ref="TR30"  Part="1" 
AR Path="/5AAA7C7F/5AC4D9CF" Ref="TR36"  Part="1" 
F 0 "TR6" H 7650 5000 50  0000 L CNN
F 1 "MA40S4S" H 7650 4800 50  0000 L CNN
F 2 "footprints:Murata_MA40S4S_TE_8134-HC-8P2" H 7650 4700 50  0001 L CNN
F 3 "https://www.murata.com/~/media/webrenewal/products/sensor/ultrasonic/open/datasheet_maopn.pdf" H 7650 4600 50  0001 L CNN
F 4 "Murata" H 7650 4500 50  0001 L CNN "Manufacturer"
F 5 "MA40S4S" H 7950 4500 50  0001 L CNN "ManufacturerPartNumber"
F 6 "Digi-Key" H 7650 4400 50  0001 L CNN "Supplier1"
F 7 "490-7707-ND" H 8050 4400 50  0001 L CNN "Supplier1PartNumber"
	1    7550 4900
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
	4600 3900 4600 4100
Wire Wire Line
	4600 3500 4600 3900
Wire Wire Line
	4600 3300 4600 3500
Wire Wire Line
	4600 3100 4600 3300
Wire Wire Line
	6100 4700 6100 4800
Wire Wire Line
	4600 4100 4600 4300
Wire Wire Line
	4500 3700 4500 4800
Wire Bus Line
	4000 2800 4000 4100
$EndSCHEMATC
