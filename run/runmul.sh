#!/bin/bash
f=3Ghz
sudo cpupower -c all frequency-set -u $f
sudo cpupower -c all frequency-set -d $f

echo "Sleeping to take effect.."
sleep 1
echo "Checking frequency..."
grep "cpu MHz" /proc/cpuinfo

grep "microco" /proc/cpuinfo

# run multiply
cd ~/ramdisk/plundervolt/faulting_multiplications/

sudo ./operation -i 1000000000 -s -100 -X 500 -1 0xae0000 -2 0x18

