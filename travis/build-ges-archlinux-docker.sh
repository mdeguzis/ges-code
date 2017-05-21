#!/bin/bash

# Instructions for docker w/ Travis CI build

sleep 2s

######################
# prepare
######################

pacman -Syy
# Make sure the keyring is up to date first
pacman -Sy archlinux-keyring
# Upgrade
pacman -Syu
# Install needed packages
pacman -S --noconfirm make cmake boost-libs boost git gcc glibc libstdc++5 expat gdbm sqlite zlib
git submodule init --recursive

######################
# build
######################

cat<<- EOF

-------------------------------------
Starting build for Arch Linux
-------------------------------------

EOF

cd ges-code
rm -rf build && mkdir build
cd build && cmake -DCMAKE_INSTALL_PREFIX=/usr ..
make VERBOSE=1 -j4
