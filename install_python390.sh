#!/bin/sh -e
set -x #echo on

cd ~
yum install -y zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel libffi-devel; yum clean all -y
wget https://www.python.org/ftp/python/3.9.0/Python-3.9.0.tar.xz
tar xf Python-3.9.0.tar.xz
cd Python-3.9.0
./configure --prefix=/usr/local
make install -j$(nproc)
cd ~
rm -rf Python-*

pip3 install -U pip setuptools
