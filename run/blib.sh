#/bin/bash

# To install requirements and do SGX plundervolt

# install support libraries
sudo add-apt-repository universe
sudo add-apt-repository multiverse

sudo apt update
sudo apt install -y git build-essential libncurses5-dev libncursesw5-dev curl
sudo modprobe msr

# make a ramdisk
sudo mkdir ./ramdisk
sudo mount -t tmpfs -o rw,size=3G tmpfs ./ramdisk
cd ramdisk

# clone the repo
git clone https://github.com/KitMurdock/plundervolt.git
# clone sgx-step repo
cd ./plundervolt/
git clone https://github.com/jovanbulck/sgx-step.git

# build sgx-step
cd sgx-step/
git submodule init
git submodule update
sudo ./install_SGX_driver.sh
sudo ./install_SGX_SDK.sh

export PATH=$PATH:/opt/intel/sgxsdk/bin/x64
#source /opt/intel/sgxsdk/environment

# load sgx kernel module
cd kernel 
sudo make clean load

# compile sgx rsa 
cd ../../sgx_crt_rsa
make


#cd ./plundervolt/faulting_multiplications
#make
#sudo ./operation -i 1000000000 -s -175 -X 500 -1 0xae0000 -2 0x18

