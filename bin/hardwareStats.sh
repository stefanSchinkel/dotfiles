#!/bin/bash

# Make sure root runs script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

vcgencmd measure_temp
vcgencmd measure_volts
vcgencmd measure_clock arm
