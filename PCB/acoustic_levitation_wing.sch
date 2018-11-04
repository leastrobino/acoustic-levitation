EESchema Schematic File Version 4
LIBS:acoustic_levitation_wing-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 3
Title "Acoustic levitation"
Date "2018-03-24"
Rev "1.0"
Comp "Léa Strobino"
Comment1 "Wing PCB"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 5600 4250 850  300 
U 5AB0E51A
F0 "Piezo A" 60
F1 "piezo_x7.sch" 60
F2 "In[1..7]" I L 5600 4350 60 
F3 "Enable" I L 5600 4450 60 
$EndSheet
$Sheet
S 5600 4800 850  300 
U 5AB0F1A6
F0 "Piezo B" 60
F1 "piezo_x7.sch" 60
F2 "In[1..7]" I L 5600 4900 60 
F3 "Enable" I L 5600 5000 60 
$EndSheet
$Comp
L Connector_Generic:Conn_02x09_Odd_Even J1
U 1 1 5AB0F29A
P 5600 3150
F 0 "J1" H 5650 3650 50  0000 C CNN
F 1 "8-215079-8" H 5550 2650 50  0000 L CNN
F 2 "footprints:TE_8-215079-8" H 5600 3150 50  0001 C CNN
F 3 "" H 5600 3150 50  0001 C CNN
F 4 "TE Connectivity AMP Connectors" H 5600 3150 60  0001 C CNN "Manufacturer"
F 5 "8-215079-8" H 5600 3150 60  0001 C CNN "ManufacturerPartNumber"
F 6 "Digi-Key" H 5600 3150 60  0001 C CNN "Supplier1"
F 7 "A99466CT-ND" H 5600 3150 60  0001 C CNN "Supplier1PartNumber"
	1    5600 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 2750 4900 2750
Text Label 4900 2750 0    60   ~ 0
Piezo_B3
Wire Wire Line
	5400 2850 4900 2850
Text Label 4900 2850 0    60   ~ 0
Piezo_B1
Wire Wire Line
	5400 2950 4900 2950
Text Label 4900 2950 0    60   ~ 0
Piezo_A6
Wire Wire Line
	5400 3050 4900 3050
Text Label 4900 3050 0    60   ~ 0
Piezo_B5
Wire Wire Line
	5400 3150 4900 3150
Text Label 4900 3150 0    60   ~ 0
Piezo_B7
Wire Wire Line
	5400 3250 4900 3250
Text Label 4900 3250 0    60   ~ 0
Piezo_A2
Wire Wire Line
	5400 3350 4900 3350
Text Label 4900 3350 0    60   ~ 0
Piezo_A4
Wire Wire Line
	5900 2750 6400 2750
Text Label 6400 2750 2    60   ~ 0
Piezo_B2
Wire Wire Line
	5900 2850 6400 2850
Text Label 6400 2850 2    60   ~ 0
Piezo_A7
Wire Wire Line
	5900 2950 6400 2950
Text Label 6400 2950 2    60   ~ 0
Piezo_A5
Wire Wire Line
	5900 3050 6400 3050
Text Label 6400 3050 2    60   ~ 0
Piezo_B6
Wire Wire Line
	5900 3150 6400 3150
Text Label 6400 3150 2    60   ~ 0
Piezo_A1
Wire Wire Line
	5900 3250 6400 3250
Text Label 6400 3250 2    60   ~ 0
Piezo_A3
Wire Wire Line
	5900 3350 6400 3350
Text Label 6400 3350 2    60   ~ 0
Piezo_B4
Wire Wire Line
	5400 3550 5300 3550
Wire Wire Line
	5300 3550 5300 3650
$Comp
L power:GND #PWR01
U 1 1 5AB0F821
P 5300 3650
F 0 "#PWR01" H 5300 3400 50  0001 C CNN
F 1 "GND" H 5300 3500 50  0000 C CNN
F 2 "" H 5300 3650 50  0001 C CNN
F 3 "" H 5300 3650 50  0001 C CNN
	1    5300 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 3450 4900 3450
Text Label 4900 3450 0    60   ~ 0
Enable
$Comp
L power:+12V #PWR02
U 1 1 5AB0F8BD
P 6300 3450
F 0 "#PWR02" H 6300 3300 50  0001 C CNN
F 1 "+12V" V 6300 3590 50  0000 L CNN
F 2 "" H 6300 3450 50  0001 C CNN
F 3 "" H 6300 3450 50  0001 C CNN
	1    6300 3450
	0    1    1    0   
$EndComp
$Comp
L power:+3V3 #PWR03
U 1 1 5AB0F918
P 6300 3550
F 0 "#PWR03" H 6300 3400 50  0001 C CNN
F 1 "+3V3" V 6300 3690 50  0000 L CNN
F 2 "" H 6300 3550 50  0001 C CNN
F 3 "" H 6300 3550 50  0001 C CNN
	1    6300 3550
	0    1    1    0   
$EndComp
Wire Wire Line
	5900 3450 6300 3450
Wire Wire Line
	5900 3550 6300 3550
Wire Wire Line
	5600 4450 4900 4450
Text Label 4900 4450 0    60   ~ 0
Enable
Wire Bus Line
	5600 4350 4900 4350
Text Label 4900 4350 0    60   ~ 0
Piezo_A[1..7]
Wire Wire Line
	5600 5000 4900 5000
Text Label 4900 5000 0    60   ~ 0
Enable
Wire Bus Line
	5600 4900 4900 4900
Text Label 4900 4900 0    60   ~ 0
Piezo_B[1..7]
Text Notes 6600 2750 2    60   ~ 0
2
Text Notes 6600 2850 2    60   ~ 0
4
Text Notes 6600 2950 2    60   ~ 0
6
Text Notes 6600 3050 2    60   ~ 0
8
Text Notes 6600 3150 2    60   ~ 0
10
Text Notes 6600 3250 2    60   ~ 0
12
Text Notes 6600 3350 2    60   ~ 0
14
Text Notes 4800 2750 2    60   ~ 0
Piezo #1
Text Notes 4800 2850 2    60   ~ 0
3
Text Notes 4800 2950 2    60   ~ 0
5
Text Notes 4800 3050 2    60   ~ 0
7
Text Notes 4800 3150 2    60   ~ 0
9
Text Notes 4800 3250 2    60   ~ 0
11
Text Notes 4800 3350 2    60   ~ 0
13
$EndSCHEMATC
