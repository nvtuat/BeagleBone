#!/bin/bash

#trap 'echo 0 > /sys/class/gpio/gpio67/value' SIGINT

DIR="/sys/class/gpio/gpio67/"

if [ ! -d $DIR ]; then
	echo 67 > /sys/class/gpio/export
fi

echo "out" > $DIR/direction

while true
do
	echo "Press [CTRL-C] to break..."
	echo 1 > $DIR/value
	sleep 1
	echo 0 > $DIR/value
	sleep 1 
done
