#!/bin/bash

# download tools
wget https://launchpad.net/gcc-arm-embedded/5.0/5-2016-q1-update/+download/gcc-arm-none-eabi-5_3-2016q1-20160330-linux.tar.bz2
wget http://releases.llvm.org/4.0.0/clang+llvm-4.0.0-x86_64-linux-gnu-ubuntu-16.10.tar.xz 

# unpack compilers
mkdir tools/gcc
tar -xvjf gcc*.bz2 -C tools/gcc 
mkdir tools/gcc/clang-arm-fropi
tar -xf clang*.xz -C tools/gcc/clang-arm-fropi --strip-components 1

# init SDK and samples from git repo
git submodule init

# check for ledgerblue && pyusb
hasLedgerblue="$(pip show ledgerblue | wc -l)"
hasPyUSB="$(pip show pyusb | wc -l)"
if [ $hasLedgerblue -eq 0 ]; then
sudo pip install ledgerblue
fi
if [ $hasLedgerblue -eq 0 ]; then
sudo pip install hasPyUSB
fi

# clean downloads
rm clang+llvm-4.0.0-x86_64-linux-gnu-ubuntu-16.10.tar.xz
rm gcc-arm-none-eabi-5_3-2016q1-20160330-linux.tar.bz2