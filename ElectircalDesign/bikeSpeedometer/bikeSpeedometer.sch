EESchema Schematic File Version 2
LIBS:power
LIBS:device
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
LIBS:MCU_Module
LIBS:Sensor_Magnetic
LIBS:ssd1306_breakout
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Bike Speedometer"
Date "2020-04-18"
Rev "1.0"
Comp "Thomas Snyder"
Comment1 "A bike speedometer using interrupt driven sensing."
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Arduino_Nano_v2.x A1
U 1 1 5E9B5169
P 5900 3750
F 0 "A1" H 5500 4675 50  0000 L BNN
F 1 "Arduino_Nano_v2.x" H 6100 2800 50  0000 L TNN
F 2 "Module:Arduino_Nano" H 5900 3750 50  0001 C CIN
F 3 "" H 5900 3750 50  0001 C CNN
	1    5900 3750
	1    0    0    -1  
$EndComp
$Comp
L A1302KUA-T U1
U 1 1 5E9B51F4
P 4150 3800
F 0 "U1" H 4150 4250 50  0000 L CNN
F 1 "A1302KUA-T" H 4150 4150 50  0000 L CNN
F 2 "" H 4150 3450 50  0001 L CIN
F 3 "" H 4050 3800 50  0001 C CNN
	1    4150 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 2750 6100 2400
$Comp
L SSD1306_breakout U2
U 1 1 5E9B576B
P 7950 4150
F 0 "U2" H 7950 3900 60  0000 C CNN
F 1 "SSD1306_breakout" H 7950 4000 60  0000 C CNN
F 2 "" H 7950 4150 60  0001 C CNN
F 3 "" H 7950 4150 60  0001 C CNN
	1    7950 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 3650 8250 3250
Wire Wire Line
	8050 2800 8050 3650
Wire Wire Line
	7850 3650 7850 3250
Wire Wire Line
	7650 3650 7650 3250
Wire Wire Line
	4450 3800 4600 3800
Wire Wire Line
	4050 3400 4050 3150
Wire Wire Line
	4050 4200 4050 4450
$Comp
L GND #PWR01
U 1 1 5E9B593D
P 4050 4450
F 0 "#PWR01" H 4050 4200 50  0001 C CNN
F 1 "GND" H 4050 4300 50  0000 C CNN
F 2 "" H 4050 4450 50  0001 C CNN
F 3 "" H 4050 4450 50  0001 C CNN
	1    4050 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 3350 5150 3350
Wire Wire Line
	6400 4150 6650 4150
Wire Wire Line
	6400 4250 6650 4250
Text GLabel 6650 4150 2    60   Input ~ 0
SDA
Text GLabel 6650 4250 2    60   Input ~ 0
SCL
Text GLabel 7850 3250 1    60   Input ~ 0
SDA
Text GLabel 7650 3250 1    60   Input ~ 0
SCL
Text GLabel 8250 3250 1    60   Input ~ 0
5V
Text GLabel 6100 2400 1    60   Input ~ 0
5V
Text GLabel 4050 3150 1    60   Input ~ 0
5V
Text GLabel 4600 3800 2    60   Input ~ 0
INT1
Text GLabel 5150 3350 0    60   Input ~ 0
INT1
$Comp
L GND #PWR02
U 1 1 5E9B59FF
P 8250 2800
F 0 "#PWR02" H 8250 2550 50  0001 C CNN
F 1 "GND" H 8250 2650 50  0000 C CNN
F 2 "" H 8250 2800 50  0001 C CNN
F 3 "" H 8250 2800 50  0001 C CNN
	1    8250 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 2800 8050 2800
NoConn ~ 6400 3150
NoConn ~ 6400 3250
NoConn ~ 6400 3550
NoConn ~ 6400 3750
NoConn ~ 6400 3850
NoConn ~ 6400 3950
NoConn ~ 6400 4050
NoConn ~ 6400 4350
NoConn ~ 6400 4450
NoConn ~ 5400 4450
NoConn ~ 5400 4350
NoConn ~ 5400 4250
NoConn ~ 5400 4150
NoConn ~ 5400 4050
NoConn ~ 5400 3950
NoConn ~ 5400 3850
NoConn ~ 5400 3750
NoConn ~ 5400 3650
NoConn ~ 5400 3550
NoConn ~ 5400 3450
NoConn ~ 5400 3250
NoConn ~ 5400 3150
NoConn ~ 5800 2750
NoConn ~ 6000 2750
$Comp
L GND #PWR03
U 1 1 5E9B5C91
P 6000 4750
F 0 "#PWR03" H 6000 4500 50  0001 C CNN
F 1 "GND" H 6000 4600 50  0000 C CNN
F 2 "" H 6000 4750 50  0001 C CNN
F 3 "" H 6000 4750 50  0001 C CNN
	1    6000 4750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 5E9B5CAB
P 5900 4750
F 0 "#PWR04" H 5900 4500 50  0001 C CNN
F 1 "GND" H 5900 4600 50  0000 C CNN
F 2 "" H 5900 4750 50  0001 C CNN
F 3 "" H 5900 4750 50  0001 C CNN
	1    5900 4750
	1    0    0    -1  
$EndComp
$EndSCHEMATC
