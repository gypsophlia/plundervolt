#!/bin/bash
f=3Ghz
sudo cpupower -c all frequency-set -u $f
sudo cpupower -c all frequency-set -d $f

echo "Sleeping to take effect.."
sleep 1
echo "Checking frequency..."
grep "cpu MHz" /proc/cpuinfo

grep "microco" /proc/cpuinfo

cd ~/ramdisk/plundervolt/sgx_crt_rsa/

for i in {100..300}
do
    echo undervolt: $1
    sleep 1
    sudo ./app 1000000000 $1
done
