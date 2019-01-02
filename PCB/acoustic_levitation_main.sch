EESchema Schematic File Version 4
LIBS:acoustic_levitation_main-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 12
Title "Acoustic levitation"
Date "2018-03-24"
Rev "1.0"
Comp "Main PCB"
Comment1 "License: CERN OHL v1.2"
Comment2 "Author: Léa Strobino"
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 5850 1950 850  300 
U 5AAA516B
F0 "Piezo A" 60
F1 "piezo_x6.sch" 60
F2 "Enable" I L 5850 2150 60 
F3 "In[1..6]" I L 5850 2050 60 
$EndSheet
$Sheet
S 5850 2450 850  300 
U 5AAA7BC7
F0 "Piezo B" 60
F1 "piezo_x6.sch" 60
F2 "Enable" I L 5850 2650 60 
F3 "In[1..6]" I L 5850 2550 60 
$EndSheet
$Sheet
S 5850 2950 850  300 
U 5AAA7BDC
F0 "Piezo C" 60
F1 "piezo_x6.sch" 60
F2 "Enable" I L 5850 3150 60 
F3 "In[1..6]" I L 5850 3050 60 
$EndSheet
$Sheet
S 5850 3450 850  300 
U 5AAA7C29
F0 "Piezo D" 60
F1 "piezo_x6.sch" 60
F2 "Enable" I L 5850 3650 60 
F3 "In[1..6]" I L 5850 3550 60 
$EndSheet
$Sheet
S 5850 3950 850  300 
U 5AAA7C6A
F0 "Piezo E" 60
F1 "piezo_x6.sch" 60
F2 "Enable" I L 5850 4150 60 
F3 "In[1..6]" I L 5850 4050 60 
$EndSheet
$Sheet
S 5850 4450 850  300 
U 5AAA7C7F
F0 "Piezo F" 60
F1 "piezo_x6.sch" 60
F2 "Enable" I L 5850 4650 60 
F3 "In[1..6]" I L 5850 4550 60 
$EndSheet
Text Label 4850 2050 0    60   ~ 0
Piezo_A[1..6]
Text Label 4850 2550 0    60   ~ 0
Piezo_B[1..6]
Text Label 4850 3050 0    60   ~ 0
Piezo_C[1..6]
Text Label 4850 3550 0    60   ~ 0
Piezo_D[1..6]
Text Label 4850 4050 0    60   ~ 0
Piezo_E[1..6]
Text Label 4850 4550 0    60   ~ 0
Piezo_F[1..6]
Text Label 4850 4850 0    60   ~ 0
Enable
$Comp
L Connector_Generic:Conn_02x20_Odd_Even J1
U 1 1 5AAAB377
P 2200 2050
F 0 "J1" H 2250 3050 50  0000 C CNN
F 1 "DE0-Nano-SoC: GPIO 0" H 2250 950 50  0000 C CNN
F 2 "footprints:Socket_Strip_Straight_2x20_Pitch2.54mm" H 2200 2050 50  0001 C CNN
F 3 "" H 2200 2050 50  0001 C CNN
F 4 "Samtec Inc." H 2200 2050 60  0001 C CNN "Manufacturer"
F 5 "SSW-120-03-G-D" H 2200 2050 60  0001 C CNN "ManufacturerPartNumber"
F 6 "Digi-Key" H 2200 2050 60  0001 C CNN "Supplier1"
F 7 "SAM11959-ND" H 2200 2050 60  0001 C CNN "Supplier1PartNumber"
	1    2200 2050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5AAAC302
P 3300 2650
F 0 "#PWR01" H 3300 2400 50  0001 C CNN
F 1 "GND" V 3300 2500 50  0000 R CNN
F 2 "" H 3300 2650 50  0001 C CNN
F 3 "" H 3300 2650 50  0001 C CNN
	1    3300 2650
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR02
U 1 1 5AAAC4C5
P 1200 2450
F 0 "#PWR02" H 1200 2300 50  0001 C CNN
F 1 "+3V3" V 1200 2590 50  0000 L CNN
F 2 "" H 1200 2450 50  0001 C CNN
F 3 "" H 1200 2450 50  0001 C CNN
	1    1200 2450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR03
U 1 1 5AAAC548
P 1200 1550
F 0 "#PWR03" H 1200 1400 50  0001 C CNN
F 1 "+5V" V 1200 1690 50  0000 L CNN
F 2 "" H 1200 1550 50  0001 C CNN
F 3 "" H 1200 1550 50  0001 C CNN
	1    1200 1550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5AAAC5A7
P 3300 1750
F 0 "#PWR04" H 3300 1500 50  0001 C CNN
F 1 "GND" V 3300 1600 50  0000 R CNN
F 2 "" H 3300 1750 50  0001 C CNN
F 3 "" H 3300 1750 50  0001 C CNN
	1    3300 1750
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x20_Odd_Even J2
U 1 1 5AAAEB76
P 2200 4450
F 0 "J2" H 2250 5450 50  0000 C CNN
F 1 "DE0-Nano-SoC: GPIO 1" H 2250 3350 50  0000 C CNN
F 2 "footprints:Socket_Strip_Straight_2x20_Pitch2.54mm" H 2200 4450 50  0001 C CNN
F 3 "" H 2200 4450 50  0001 C CNN
F 4 "Samtec Inc." H 2200 4450 60  0001 C CNN "Manufacturer"
F 5 "SSW-120-03-G-D" H 2200 4450 60  0001 C CNN "ManufacturerPartNumber"
F 6 "Digi-Key" H 2200 4450 60  0001 C CNN "Supplier1"
F 7 "SAM11959-ND" H 2200 4450 60  0001 C CNN "Supplier1PartNumber"
	1    2200 4450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5AAAEB81
P 3300 5050
F 0 "#PWR05" H 3300 4800 50  0001 C CNN
F 1 "GND" V 3300 4900 50  0000 R CNN
F 2 "" H 3300 5050 50  0001 C CNN
F 3 "" H 3300 5050 50  0001 C CNN
	1    3300 5050
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR06
U 1 1 5AAAEB8B
P 1200 4850
F 0 "#PWR06" H 1200 4700 50  0001 C CNN
F 1 "+3V3" V 1200 4990 50  0000 L CNN
F 2 "" H 1200 4850 50  0001 C CNN
F 3 "" H 1200 4850 50  0001 C CNN
	1    1200 4850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR07
U 1 1 5AAAEB91
P 1200 3950
F 0 "#PWR07" H 1200 3800 50  0001 C CNN
F 1 "+5V" V 1200 4090 50  0000 L CNN
F 2 "" H 1200 3950 50  0001 C CNN
F 3 "" H 1200 3950 50  0001 C CNN
	1    1200 3950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5AAAEB97
P 3300 4150
F 0 "#PWR08" H 3300 3900 50  0001 C CNN
F 1 "GND" V 3300 4000 50  0000 R CNN
F 2 "" H 3300 4150 50  0001 C CNN
F 3 "" H 3300 4150 50  0001 C CNN
	1    3300 4150
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x08 J3
U 1 1 5AAAF9DE
P 1550 6250
F 0 "J3" H 1550 6650 50  0000 C CNN
F 1 "DE0-Nano-SoC: JP3" H 1600 5750 50  0000 R CNN
F 2 "footprints:Pin_Header_Straight_1x08_Pitch2.54mm" H 1550 6250 50  0001 C CNN
F 3 "" H 1550 6250 50  0001 C CNN
F 4 "Wurth Electronics Inc." H 1550 6250 60  0001 C CNN "Manufacturer"
F 5 "61300811121" H 1550 6250 60  0001 C CNN "ManufacturerPartNumber"
F 6 "Digi-Key" H 1550 6250 60  0001 C CNN "Supplier1"
F 7 "732-5321-ND" H 1550 6250 60  0001 C CNN "Supplier1PartNumber"
F 8 "Distrelec" H 1550 6250 60  0001 C CNN "Supplier2"
F 9 "300-93-649" H 1550 6250 60  0001 C CNN "Supplier2PartNumber"
	1    1550 6250
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x10 J4
U 1 1 5AAAFB02
P 3000 6350
F 0 "J4" H 3000 6850 50  0000 C CNN
F 1 "DE0-Nano-SoC: JP2" H 3050 5750 50  0000 R CNN
F 2 "footprints:Pin_Header_Straight_1x10_Pitch2.54mm" H 3000 6350 50  0001 C CNN
F 3 "" H 3000 6350 50  0001 C CNN
F 4 "Wurth Electronics Inc." H 3000 6350 60  0001 C CNN "Manufacturer"
F 5 "61301011121" H 3000 6350 60  0001 C CNN "ManufacturerPartNumber"
F 6 "Digi-Key" H 3000 6350 60  0001 C CNN "Supplier1"
F 7 "732-2670-ND" H 3000 6350 60  0001 C CNN "Supplier1PartNumber"
F 8 "Distrelec" H 3000 6350 60  0001 C CNN "Supplier2"
F 9 "300-93-651" H 3000 6350 60  0001 C CNN "Supplier2PartNumber"
	1    3000 6350
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J5
U 1 1 5AAAFF13
P 1550 7050
F 0 "J5" H 1550 6950 50  0000 C CNN
F 1 "DE0-Nano-SoC: JP5[3]" H 700 7150 50  0000 L CNN
F 2 "footprints:Pin_Header_Straight_1x01_Pitch2.54mm" H 1550 7050 50  0001 C CNN
F 3 "" H 1550 7050 50  0001 C CNN
F 4 "Wurth Electronics Inc." H 1550 7050 60  0001 C CNN "Manufacturer"
F 5 "61300111121" H 1550 7050 60  0001 C CNN "ManufacturerPartNumber"
F 6 "Digi-Key" H 1550 7050 60  0001 C CNN "Supplier1"
F 7 "732-5314-ND" H 1550 7050 60  0001 C CNN "Supplier1PartNumber"
F 8 "Distrelec" H 1550 7050 60  0001 C CNN "Supplier2"
F 9 "300-93-642" H 1550 7050 60  0001 C CNN "Supplier2PartNumber"
	1    1550 7050
	-1   0    0    1   
$EndComp
$Sheet
S 9300 2450 900  300 
U 5AAB028D
F0 "Wing conn. 1" 60
F1 "conn_x14.sch" 60
F2 "In[1..14]" I L 9300 2550 60 
F3 "Enable" I L 9300 2650 60 
$EndSheet
Text Label 2250 7050 2    60   ~ 0
Enable
$Sheet
S 9300 2950 900  300 
U 5AAA9F80
F0 "Wing conn. 2" 60
F1 "conn_x14.sch" 60
F2 "In[1..14]" I L 9300 3050 60 
F3 "Enable" I L 9300 3150 60 
$EndSheet
$Sheet
S 9300 3450 900  300 
U 5AAAA010
F0 "Wing conn. 3" 60
F1 "conn_x14.sch" 60
F2 "In[1..14]" I L 9300 3550 60 
F3 "Enable" I L 9300 3650 60 
$EndSheet
$Sheet
S 9300 3950 900  300 
U 5AAAA0A0
F0 "Wing conn. 4" 60
F1 "conn_x14.sch" 60
F2 "In[1..14]" I L 9300 4050 60 
F3 "Enable" I L 9300 4150 60 
$EndSheet
Text Label 8300 4350 0    60   ~ 0
Enable
Text Label 8300 2550 0    60   ~ 0
Wing_A[1..14]
Text Label 8300 3050 0    60   ~ 0
Wing_B[1..14]
Text Label 8300 3550 0    60   ~ 0
Wing_C[1..14]
Text Label 8300 4050 0    60   ~ 0
Wing_D[1..14]
NoConn ~ 3200 6150
$Sheet
S 5150 6250 700  300 
U 5AAB6D26
F0 "Power" 60
F1 "power.sch" 60
$EndSheet
Text Label 1500 3550 0    60   ~ 0
Piezo_C1
Text Label 1500 3650 0    60   ~ 0
Piezo_C3
Text Label 1500 3750 0    60   ~ 0
Piezo_C5
Text Label 3000 3550 2    60   ~ 0
Piezo_C2
Text Label 3000 3650 2    60   ~ 0
Piezo_C4
Text Label 3000 3750 2    60   ~ 0
Piezo_C6
Text Label 1500 3850 0    60   ~ 0
Piezo_B1
Text Label 1500 3950 0    60   ~ 0
Piezo_B3
Text Label 1500 4150 0    60   ~ 0
Piezo_B5
Text Label 3000 3850 2    60   ~ 0
Piezo_B2
Text Label 3000 3950 2    60   ~ 0
Piezo_B4
Text Label 3000 4150 2    60   ~ 0
Piezo_B6
Text Label 1500 4250 0    60   ~ 0
Wing_D1
Text Label 1500 4350 0    60   ~ 0
Wing_D3
Text Label 1500 4450 0    60   ~ 0
Wing_D5
Text Label 1500 4550 0    60   ~ 0
Wing_D7
Text Label 1500 4650 0    60   ~ 0
Wing_D9
Text Label 1500 4750 0    60   ~ 0
Wing_D11
Text Label 1500 4850 0    60   ~ 0
Wing_D13
Text Label 3000 4250 2    60   ~ 0
Wing_D2
Text Label 3000 4350 2    60   ~ 0
Wing_D4
Text Label 3000 4450 2    60   ~ 0
Wing_D6
Text Label 3000 4550 2    60   ~ 0
Wing_D8
Text Label 3000 4650 2    60   ~ 0
Wing_D10
Text Label 3000 4750 2    60   ~ 0
Wing_D12
Text Label 3000 4850 2    60   ~ 0
Piezo_A1
Text Label 3000 5050 2    60   ~ 0
Piezo_A3
Text Label 3000 5150 2    60   ~ 0
Piezo_A5
Text Label 1500 5050 0    60   ~ 0
Piezo_A2
Text Label 1500 5150 0    60   ~ 0
Piezo_A4
Text Label 1500 5250 0    60   ~ 0
Piezo_A6
Text Label 1500 5350 0    60   ~ 0
Wing_C4
Text Label 1500 5450 0    60   ~ 0
Wing_C2
Text Label 3000 5250 2    60   ~ 0
Wing_C5
Text Label 3000 5350 2    60   ~ 0
Wing_C3
Text Label 3000 5450 2    60   ~ 0
Wing_C1
Text Label 3700 5950 2    60   ~ 0
Piezo_D1
Text Label 3700 6050 2    60   ~ 0
Piezo_D2
Text Label 1500 1550 0    60   ~ 0
Piezo_D4
Text Label 3000 1550 2    60   ~ 0
Piezo_D3
Text Label 3700 6350 2    60   ~ 0
Piezo_D5
Text Label 3700 6450 2    60   ~ 0
Piezo_D6
Text Label 1500 1150 0    60   ~ 0
Wing_C6
Text Label 1500 1250 0    60   ~ 0
Wing_C8
Text Label 1500 1350 0    60   ~ 0
Wing_C10
Text Label 1500 1450 0    60   ~ 0
Wing_C12
Text Label 3000 1150 2    60   ~ 0
Wing_C7
Text Label 3000 1250 2    60   ~ 0
Wing_C9
Text Label 3000 1350 2    60   ~ 0
Wing_C11
Text Label 3000 1450 2    60   ~ 0
Wing_C13
Text Label 1500 1750 0    60   ~ 0
Piezo_E2
Text Label 3000 1750 2    60   ~ 0
Piezo_E1
Text Label 3700 6550 2    60   ~ 0
Piezo_E3
Text Label 3700 6650 2    60   ~ 0
Piezo_E4
Text Label 3700 6750 2    60   ~ 0
Piezo_E5
Text Label 3700 6850 2    60   ~ 0
Piezo_E6
Text Label 1500 1850 0    60   ~ 0
Wing_B1
Text Label 1500 1950 0    60   ~ 0
Wing_B3
Text Label 1500 2050 0    60   ~ 0
Wing_B5
Text Label 1500 2150 0    60   ~ 0
Wing_B7
Text Label 1500 2250 0    60   ~ 0
Wing_B9
Text Label 1500 2350 0    60   ~ 0
Wing_B11
Text Label 1500 2450 0    60   ~ 0
Wing_B13
Text Label 3000 1850 2    60   ~ 0
Wing_B2
Text Label 3000 1950 2    60   ~ 0
Wing_B4
Text Label 3000 2050 2    60   ~ 0
Wing_B6
Text Label 3000 2150 2    60   ~ 0
Wing_B8
Text Label 3000 2250 2    60   ~ 0
Wing_B10
Text Label 3000 2350 2    60   ~ 0
Wing_B12
Text Label 2250 5950 2    60   ~ 0
Piezo_F1
Text Label 2250 6050 2    60   ~ 0
Piezo_F2
Text Label 2250 6150 2    60   ~ 0
Piezo_F3
Text Label 2250 6250 2    60   ~ 0
Piezo_F4
Text Label 2250 6350 2    60   ~ 0
Piezo_F5
Text Label 2250 6450 2    60   ~ 0
Piezo_F6
Text Label 2250 6550 2    60   ~ 0
Wing_A13
Text Label 2250 6650 2    60   ~ 0
Wing_A12
Text Label 3000 2450 2    60   ~ 0
Wing_A11
Text Label 3000 2650 2    60   ~ 0
Wing_A9
Text Label 3000 2750 2    60   ~ 0
Wing_A7
Text Label 3000 2850 2    60   ~ 0
Wing_A5
Text Label 3000 2950 2    60   ~ 0
Wing_A3
Text Label 3000 3050 2    60   ~ 0
Wing_A1
Text Label 1500 2650 0    60   ~ 0
Wing_A10
Text Label 1500 2750 0    60   ~ 0
Wing_A8
Text Label 1500 2850 0    60   ~ 0
Wing_A6
Text Label 1500 2950 0    60   ~ 0
Wing_A4
Text Label 1500 3050 0    60   ~ 0
Wing_A2
Text Label 9200 5250 0    60   ~ 0
Wing_A13
Text Label 9200 5350 0    60   ~ 0
Wing_B13
Text Label 9200 5450 0    60   ~ 0
Wing_C13
Text Label 9200 5550 0    60   ~ 0
Wing_D13
Text Label 10200 5350 2    60   ~ 0
Wing_C14
Text Label 10200 5450 2    60   ~ 0
Wing_D14
Text Label 10200 5550 2    60   ~ 0
Wing_A14
Text Label 10200 5250 2    60   ~ 0
Wing_B14
Text Notes 3200 1550 2    60   ~ 0
19
Text Notes 3200 1750 2    60   ~ 0
33
Text Notes 1400 1550 2    60   ~ 0
20
Text Notes 1400 1750 2    60   ~ 0
27
Text Notes 3200 3550 2    60   ~ 0
12
Text Notes 3200 3650 2    60   ~ 0
17
Text Notes 3200 3750 2    60   ~ 0
5
Text Notes 3200 3850 2    60   ~ 0
10
Text Notes 3200 3950 2    60   ~ 0
15
Text Notes 3200 4150 2    60   ~ 0
3
Text Notes 3200 4850 2    60   ~ 0
2
Text Notes 3200 5050 2    60   ~ 0
14
Text Notes 3200 5150 2    60   ~ 0
7
Text Notes 1400 3550 2    60   ~ 0
6
Text Notes 1400 3650 2    60   ~ 0
18
Text Notes 1400 3750 2    60   ~ 0
11
Text Notes 1400 3850 2    60   ~ 0
4
Text Notes 1400 3950 2    60   ~ 0
16
Text Notes 1400 4150 2    60   ~ 0
9
Text Notes 1400 5050 2    60   ~ 0
8
Text Notes 1400 5150 2    60   ~ 0
13
Text Notes 1400 5250 2    60   ~ 0
1
Text Notes 2450 5950 2    60   ~ 0
35
Text Notes 2450 6050 2    60   ~ 0
29
Text Notes 2450 6150 2    60   ~ 0
23
Text Notes 2450 6250 2    60   ~ 0
24
Text Notes 2450 6350 2    60   ~ 0
30
Text Notes 2450 6450 2    60   ~ 0
36
Text Notes 3900 6350 2    60   ~ 0
26
Text Notes 3900 6450 2    60   ~ 0
32
Text Notes 3900 6550 2    60   ~ 0
21
Text Notes 3900 6650 2    60   ~ 0
22
Text Notes 3900 6750 2    60   ~ 0
28
Text Notes 3900 6850 2    60   ~ 0
34
Text Notes 3900 6050 2    60   ~ 0
25
Text Notes 3900 5950 2    60   ~ 0
31
Text Notes 1400 1350 2    60   ~ 0
72
Text Notes 1400 1250 2    60   ~ 0
70
Text Notes 1400 1150 2    60   ~ 0
68
Text Notes 1400 1850 2    60   ~ 0
50
Text Notes 1400 1950 2    60   ~ 0
52
Text Notes 1400 2050 2    60   ~ 0
54
Text Notes 1400 2150 2    60   ~ 0
56
Text Notes 1400 2250 2    60   ~ 0
58
Text Notes 1400 2350 2    60   ~ 0
60
Text Notes 1400 2450 2    60   ~ 0
62
Text Notes 1400 2650 2    60   ~ 0
46
Text Notes 1400 2750 2    60   ~ 0
44
Text Notes 1400 2850 2    60   ~ 0
42
Text Notes 1400 2950 2    60   ~ 0
40
Text Notes 1400 3050 2    60   ~ 0
38
Text Notes 3200 1350 2    60   ~ 0
73
Text Notes 3200 1250 2    60   ~ 0
71
Text Notes 3200 1150 2    60   ~ 0
69
Text Notes 3200 1850 2    60   ~ 0
51
Text Notes 3200 1950 2    60   ~ 0
53
Text Notes 3200 2050 2    60   ~ 0
55
Text Notes 3200 2150 2    60   ~ 0
57
Text Notes 3200 2250 2    60   ~ 0
59
Text Notes 3200 2350 2    60   ~ 0
61
Text Notes 3200 2450 2    60   ~ 0
47
Text Notes 3200 2650 2    60   ~ 0
45
Text Notes 3200 2750 2    60   ~ 0
43
Text Notes 3200 2850 2    60   ~ 0
41
Text Notes 3200 2950 2    60   ~ 0
39
Text Notes 3200 3050 2    60   ~ 0
37
Text Notes 2450 6650 2    60   ~ 0
48
Text Notes 2450 6550 2    60   ~ 0
49
Text Notes 1400 4250 2    60   ~ 0
76
Text Notes 1400 4350 2    60   ~ 0
78
Text Notes 1400 4450 2    60   ~ 0
80
Text Notes 1400 4550 2    60   ~ 0
82
Text Notes 1400 4650 2    60   ~ 0
84
Text Notes 1400 4750 2    60   ~ 0
86
Text Notes 1400 4850 2    60   ~ 0
88
Text Notes 1400 5350 2    60   ~ 0
66
Text Notes 1400 5450 2    60   ~ 0
64
Text Notes 3200 4250 2    60   ~ 0
77
Text Notes 3200 4350 2    60   ~ 0
79
Text Notes 3200 4450 2    60   ~ 0
81
Text Notes 3200 4550 2    60   ~ 0
83
Text Notes 3200 4650 2    60   ~ 0
85
Text Notes 3200 4750 2    60   ~ 0
87
Text Notes 3200 5250 2    60   ~ 0
67
Text Notes 3200 5350 2    60   ~ 0
65
Text Notes 3200 5450 2    60   ~ 0
63
Text Notes 3200 1450 2    60   ~ 0
75
Text Notes 1400 1450 2    60   ~ 0
74
Wire Bus Line
	5850 2050 4850 2050
Wire Bus Line
	5850 2550 4850 2550
Wire Bus Line
	5850 3050 4850 3050
Wire Bus Line
	5850 3550 4850 3550
Wire Bus Line
	5850 4050 4850 4050
Wire Bus Line
	5850 4550 4850 4550
Wire Wire Line
	5650 4850 4850 4850
Wire Wire Line
	5650 2150 5650 2650
Wire Wire Line
	5650 2150 5850 2150
Wire Wire Line
	5650 2650 5850 2650
Connection ~ 5650 2650
Wire Wire Line
	5650 3150 5850 3150
Connection ~ 5650 3150
Wire Wire Line
	5650 3650 5850 3650
Connection ~ 5650 3650
Wire Wire Line
	5650 4150 5850 4150
Connection ~ 5650 4150
Wire Wire Line
	5650 4650 5850 4650
Connection ~ 5650 4650
Wire Wire Line
	2000 1150 1500 1150
Wire Wire Line
	3000 1250 2500 1250
Wire Wire Line
	3000 1350 2500 1350
Wire Wire Line
	3000 1450 2500 1450
Wire Wire Line
	3000 1550 2500 1550
Wire Wire Line
	3000 1750 2500 1750
Wire Wire Line
	1500 1950 2000 1950
Wire Wire Line
	1500 2050 2000 2050
Wire Wire Line
	1500 2150 2000 2150
Wire Wire Line
	1500 2250 2000 2250
Wire Wire Line
	1500 2350 2000 2350
Wire Wire Line
	1500 2450 2000 2450
Wire Wire Line
	3000 2650 2500 2650
Wire Wire Line
	3000 2750 2500 2750
Wire Wire Line
	3000 2850 2500 2850
Wire Wire Line
	3000 2950 2500 2950
Wire Wire Line
	2000 1250 1500 1250
Wire Wire Line
	2000 1350 1500 1350
Wire Wire Line
	2000 1450 1500 1450
Wire Wire Line
	2000 1550 1500 1550
Wire Wire Line
	2000 1750 1500 1750
Wire Wire Line
	2500 1850 3000 1850
Wire Wire Line
	2500 1950 3000 1950
Wire Wire Line
	2500 2050 3000 2050
Wire Wire Line
	2500 2150 3000 2150
Wire Wire Line
	2500 2250 3000 2250
Wire Wire Line
	2500 2350 3000 2350
Wire Wire Line
	2000 2650 1500 2650
Wire Wire Line
	2000 2750 1500 2750
Wire Wire Line
	2000 2850 1500 2850
Wire Wire Line
	2000 2950 1500 2950
Wire Wire Line
	3000 1150 2500 1150
Wire Wire Line
	2000 3550 1500 3550
Wire Wire Line
	1200 4050 1200 3950
Wire Wire Line
	1200 4950 1200 4850
Wire Wire Line
	3300 4050 3300 4150
Wire Wire Line
	3300 4950 3300 5050
Wire Wire Line
	2000 3650 1500 3650
Wire Wire Line
	2000 3750 1500 3750
Wire Wire Line
	2000 3850 1500 3850
Wire Wire Line
	2000 3950 1500 3950
Wire Wire Line
	2000 4150 1500 4150
Wire Wire Line
	2000 4250 1500 4250
Wire Wire Line
	2000 4350 1500 4350
Wire Wire Line
	2000 4450 1500 4450
Wire Wire Line
	2000 4550 1500 4550
Wire Wire Line
	2000 4650 1500 4650
Wire Wire Line
	2000 4750 1500 4750
Wire Wire Line
	2000 4850 1500 4850
Wire Wire Line
	2000 5050 1500 5050
Wire Wire Line
	2000 5150 1500 5150
Wire Wire Line
	2000 5250 1500 5250
Wire Wire Line
	2000 5350 1500 5350
Wire Wire Line
	2000 5450 1500 5450
Wire Wire Line
	2250 6650 1750 6650
Wire Wire Line
	2250 6550 1750 6550
Wire Wire Line
	2250 6350 1750 6350
Wire Wire Line
	2250 6250 1750 6250
Wire Wire Line
	2250 6150 1750 6150
Wire Wire Line
	2250 6050 1750 6050
Wire Wire Line
	2250 5950 1750 5950
Wire Wire Line
	3700 6850 3200 6850
Wire Wire Line
	3700 6750 3200 6750
Wire Wire Line
	3700 6650 3200 6650
Wire Wire Line
	3700 6550 3200 6550
Wire Wire Line
	3700 6450 3200 6450
Wire Wire Line
	3700 6350 3200 6350
Wire Wire Line
	3700 6050 3200 6050
Wire Wire Line
	2250 7050 1750 7050
Wire Wire Line
	9300 2650 9100 2650
Wire Wire Line
	9100 2650 9100 3150
Wire Wire Line
	9100 4350 8300 4350
Wire Wire Line
	9300 3150 9100 3150
Connection ~ 9100 3150
Wire Wire Line
	9300 3650 9100 3650
Connection ~ 9100 3650
Wire Wire Line
	9300 4150 9100 4150
Connection ~ 9100 4150
Wire Bus Line
	9300 2550 8300 2550
Wire Bus Line
	9300 3050 8300 3050
Wire Bus Line
	9300 3550 8300 3550
Wire Bus Line
	9300 4050 8300 4050
Wire Wire Line
	2000 3050 1500 3050
Wire Wire Line
	3000 3050 2500 3050
Wire Wire Line
	2500 3550 3000 3550
Wire Wire Line
	2500 3650 3000 3650
Wire Wire Line
	2500 3750 3000 3750
Wire Wire Line
	2500 3850 3000 3850
Wire Wire Line
	2500 3950 3000 3950
Wire Wire Line
	2500 4150 3000 4150
Wire Wire Line
	2500 4250 3000 4250
Wire Wire Line
	2500 4350 3000 4350
Wire Wire Line
	2500 4450 3000 4450
Wire Wire Line
	2500 4550 3000 4550
Wire Wire Line
	2500 4650 3000 4650
Wire Wire Line
	2500 4750 3000 4750
Wire Wire Line
	2500 4850 3000 4850
Wire Wire Line
	2500 5050 3000 5050
Wire Wire Line
	2500 5150 3000 5150
Wire Wire Line
	2500 5250 3000 5250
Wire Wire Line
	2500 5350 3000 5350
Wire Wire Line
	2500 5450 3000 5450
Wire Wire Line
	2500 2450 3000 2450
Wire Wire Line
	1500 1850 2000 1850
Wire Wire Line
	3700 5950 3200 5950
Wire Wire Line
	2250 6450 1750 6450
Wire Wire Line
	9200 5250 10200 5250
Wire Wire Line
	9200 5350 10200 5350
Wire Wire Line
	9200 5450 10200 5450
Wire Wire Line
	9200 5550 10200 5550
Wire Wire Line
	2500 1650 3300 1650
Wire Wire Line
	3300 1650 3300 1750
Wire Wire Line
	2500 2550 3300 2550
Wire Wire Line
	3300 2550 3300 2650
Wire Wire Line
	2000 1650 1200 1650
Wire Wire Line
	1200 1650 1200 1550
Wire Wire Line
	2000 2550 1200 2550
Wire Wire Line
	1200 2550 1200 2450
Wire Wire Line
	1200 4050 2000 4050
Wire Wire Line
	1200 4950 2000 4950
Wire Wire Line
	3300 4950 2500 4950
Wire Wire Line
	3300 4050 2500 4050
$Comp
L power:GND #PWR09
U 1 1 5AB78DB2
P 4000 6350
F 0 "#PWR09" H 4000 6100 50  0001 C CNN
F 1 "GND" V 4000 6200 50  0000 R CNN
F 2 "" H 4000 6350 50  0001 C CNN
F 3 "" H 4000 6350 50  0001 C CNN
	1    4000 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 6250 4000 6350
Wire Wire Line
	4000 6250 3200 6250
Text Notes 3350 1150 0    60   ~ 0
Piezo #
Wire Wire Line
	5650 2650 5650 3150
Wire Wire Line
	5650 3150 5650 3650
Wire Wire Line
	5650 3650 5650 4150
Wire Wire Line
	5650 4150 5650 4650
Wire Wire Line
	5650 4650 5650 4850
Wire Wire Line
	9100 3150 9100 3650
Wire Wire Line
	9100 3650 9100 4150
Wire Wire Line
	9100 4150 9100 4350
$EndSCHEMATC
