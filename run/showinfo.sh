#!/bin/bash

sudo add-apt-repository universe
sudo add-apt-repository multiverse
sudo apt update
sudo apt install -y linux-tools-common lm-sensors i2c-tools

echo "Checking frequency..."
grep "cpu MHz" /proc/cpuinfo

echo "Checking microcode..."
grep "microco" /proc/cpuinfo

echo "Checking temperature..."
sensors

echo "Checking i2c bus..."
sudo modprobe i2c_i801
sudo i2cdetect -l
sudo i2cdetect -y `sudo i2cdetect -l | grep "SMBus" | grep -oE "^i2c-[0-9]" | cut -c 5-`
