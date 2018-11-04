EESchema Schematic File Version 4
LIBS:acoustic_levitation_main-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 8 12
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
L Connector_Generic:Conn_02x09_Odd_Even J6
U 1 1 5AAB02F6
P 5800 3600
AR Path="/5AAB028D/5AAB02F6" Ref="J6"  Part="1" 
AR Path="/5AAA9F80/5AAB02F6" Ref="J7"  Part="1" 
AR Path="/5AAAA010/5AAB02F6" Ref="J8"  Part="1" 
AR Path="/5AAAA0A0/5AAB02F6" Ref="J9"  Part="1" 
F 0 "J6" H 5850 4100 50  0000 C CNN
F 1 "8-215079-8" H 5750 3100 50  0000 L CNN
F 2 "footprints:TE_8-215079-8" H 5800 3600 50  0001 C CNN
F 3 "" H 5800 3600 50  0001 C CNN
F 4 "TE Connectivity AMP Connectors" H 5800 3600 60  0001 C CNN "Manufacturer"
F 5 "8-215079-8" H 5800 3600 60  0001 C CNN "ManufacturerPartNumber"
F 6 "Digi-Key" H 5800 3600 60  0001 C CNN "Supplier1"
F 7 "A99466CT-ND" H 5800 3600 60  0001 C CNN "Supplier1PartNumber"
	1    5800 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 3200 6450 3200
Entry Wire Line
	6450 3800 6550 3700
Entry Wire Line
	6450 3700 6550 3600
Entry Wire Line
	6450 3600 6550 3500
Entry Wire Line
	6450 3500 6550 3400
Entry Wire Line
	6450 3400 6550 3300
Entry Wire Line
	6450 3300 6550 3200
Entry Wire Line
	6450 3200 6550 3100
Wire Wire Line
	6100 3300 6450 3300
Wire Wire Line
	6100 3400 6450 3400
Wire Wire Line
	6100 3500 6450 3500
Wire Wire Line
	6100 3600 6450 3600
Wire Wire Line
	6100 3700 6450 3700
Wire Wire Line
	6100 3800 6450 3800
Wire Wire Line
	5600 3200 5250 3200
Entry Wire Line
	5250 3800 5150 3700
Entry Wire Line
	5250 3700 5150 3600
Entry Wire Line
	5250 3600 5150 3500
Entry Wire Line
	5250 3500 5150 3400
Entry Wire Line
	5250 3400 5150 3300
Entry Wire Line
	5250 3300 5150 3200
Entry Wire Line
	5250 3200 5150 3100
Wire Wire Line
	5600 3300 5250 3300
Wire Wire Line
	5600 3400 5250 3400
Wire Wire Line
	5600 3500 5250 3500
Wire Wire Line
	5600 3600 5250 3600
Wire Wire Line
	5600 3700 5250 3700
Wire Wire Line
	5600 3800 5250 3800
Wire Bus Line
	4950 3000 6550 3000
Text Label 6200 3800 0    60   ~ 0
In14
Text Label 6200 3700 0    60   ~ 0
In12
Text Label 6200 3600 0    60   ~ 0
In10
Text Label 6200 3500 0    60   ~ 0
In8
Text Label 6200 3400 0    60   ~ 0
In6
Text Label 6200 3300 0    60   ~ 0
In4
Text Label 6200 3200 0    60   ~ 0
In2
Text Label 5500 3200 2    60   ~ 0
In1
Text Label 5500 3800 2    60   ~ 0
In13
Text Label 5500 3700 2    60   ~ 0
In11
Text Label 5500 3600 2    60   ~ 0
In9
Text Label 5500 3500 2    60   ~ 0
In7
Text Label 5500 3400 2    60   ~ 0
In5
Text Label 5500 3300 2    60   ~ 0
In3
Text HLabel 4950 3000 0    60   Input ~ 0
In[1..14]
Text HLabel 4950 3900 0    60   Input ~ 0
Enable
Wire Wire Line
	4950 3900 5600 3900
Wire Wire Line
	5600 4000 5500 4000
Wire Wire Line
	5500 4000 5500 4100
$Comp
L power:GND #PWR052
U 1 1 5AAA94F7
P 5500 4100
AR Path="/5AAB028D/5AAA94F7" Ref="#PWR052"  Part="1" 
AR Path="/5AAA9F80/5AAA94F7" Ref="#PWR055"  Part="1" 
AR Path="/5AAAA010/5AAA94F7" Ref="#PWR058"  Part="1" 
AR Path="/5AAAA0A0/5AAA94F7" Ref="#PWR061"  Part="1" 
F 0 "#PWR052" H 5500 3850 50  0001 C CNN
F 1 "GND" H 5500 3950 50  0000 C CNN
F 2 "" H 5500 4100 50  0001 C CNN
F 3 "" H 5500 4100 50  0001 C CNN
	1    5500 4100
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR053
U 1 1 5AAA954A
P 6450 4000
AR Path="/5AAB028D/5AAA954A" Ref="#PWR053"  Part="1" 
AR Path="/5AAA9F80/5AAA954A" Ref="#PWR056"  Part="1" 
AR Path="/5AAAA010/5AAA954A" Ref="#PWR059"  Part="1" 
AR Path="/5AAAA0A0/5AAA954A" Ref="#PWR062"  Part="1" 
F 0 "#PWR053" H 6450 3850 50  0001 C CNN
F 1 "+3V3" V 6450 4140 50  0000 L CNN
F 2 "" H 6450 4000 50  0001 C CNN
F 3 "" H 6450 4000 50  0001 C CNN
	1    6450 4000
	0    1    1    0   
$EndComp
$Comp
L power:+12V #PWR054
U 1 1 5AAA9573
P 6450 3900
AR Path="/5AAB028D/5AAA9573" Ref="#PWR054"  Part="1" 
AR Path="/5AAA9F80/5AAA9573" Ref="#PWR057"  Part="1" 
AR Path="/5AAAA010/5AAA9573" Ref="#PWR060"  Part="1" 
AR Path="/5AAAA0A0/5AAA9573" Ref="#PWR063"  Part="1" 
F 0 "#PWR054" H 6450 3750 50  0001 C CNN
F 1 "+12V" V 6450 4040 50  0000 L CNN
F 2 "" H 6450 3900 50  0001 C CNN
F 3 "" H 6450 3900 50  0001 C CNN
	1    6450 3900
	0    1    1    0   
$EndComp
Wire Wire Line
	6100 3900 6450 3900
Wire Wire Line
	6100 4000 6450 4000
Wire Bus Line
	6550 3000 6550 3700
Wire Bus Line
	5150 3000 5150 3700
$EndSCHEMATC
