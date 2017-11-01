#!/bin/bash

LED3_PATH=/sys/class/leds/beaglebone:green:usr3

function removeTrigger
{
	echo "none" >> "$LED3_PATH/trigger"
}

echo "Starting the LED Bash Script"

if [ $# != 1 ]; then
	echo "There is an incorrect number of arguments. Usage is:"
	echo -e " bashLED Command \n where command is one of "
	echo -e " on, off, flash or status \n e.g. bashLED on "
	exit 2
fi

echo "The LED Command that was passed is: $1"

if [ "$1" == "on" ]; then
	echo "Turning the LED on"
	removeTrigger
	echo "1" >> "$LED3_PATH/brightness"
elif [ "$1" == "off" ]; then
	echo "Turning the LED off"
	removeTrigger
	echo "0" >> "$LED3_PATH/brightness"
elif [ "$1" == "flash" ]; then
	echo "Flashing the LED"
	removeTrigger
	echo "timer" >> "$LED3_PATH/trigger"
	echo "50" >> "$LED3_PATH/delay_on"
	echo "50" >> "$LED3_PATH/delay_off"
elif [ "$1" == "status" ]; then
	cat "$LED3_PATH/trigger";
fi

echo "End of the LED Bash Script"
