#!/usr/bin/bash

MACADDR="A8:B6:67:50:5A:5B"

bluetoothctl info $MACADDR | grep -q "Connected: yes" && echo -e "disconnect $MACADDR\nquit" | bluetoothctl && notify-send "Bluetooth" "Disconnected from device" && exit

notify-send "Bluetooth" "Connecting to device..."

{
	echo "remove $MACADDR"
	echo "scan on"
	sleep 2
	echo "connect $MACADDR"
	sleep 5
	echo "exit"
} | bluetoothctl || notify-send "Bluetooth" "Failed to connect to device"
