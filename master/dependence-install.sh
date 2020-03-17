#! /bin/bash

sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list

apt clean

apt update

apt install -y wget
apt install -y openjdk-8-jdk
apt install -y net-tools
apt install -y openssh-server
ln -s /usr/bin/python3.6 /usr/bin/python
rm -rf /var/lib/apt/list/*
