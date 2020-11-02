#!/bin/bash
#author luoxf
#time 20201030
#Display the host basic information

#Defined variable

hostname=`hostnamectl | awk -F [:] 'NR==1 {print $2}'`
vmp=`hostnamectl | awk -F [:] 'NR==6 {print $2}'`
os=`hostnamectl | awk -F [:] 'NR==7 {print $2}'`
kernel=`hostnamectl | awk -F [:] 'NR==9 {print $2}'`
arch=`hostnamectl | awk -F [:] 'NR==10 {print $2}'`
bsip=`ip a | grep -v "inet6" | grep inet | awk 'NR==2 {print $2}'`
mgtip=`ip a | grep -v "inet6" | grep inet | awk 'NR==3 {print $2}'`
phymem=`free -h | awk 'NR==2 {print $2}'`
avimem=`free -h | awk 'NR==2 {print $NF}'`
swapt=`free -h | awk 'NR==3 {print $2}'`
swapu=`free -h | awk 'NR==3 {print $3}'`
diskt=`df -h | grep '/$'| awk '{print $2}'`
diskuse=`df -h | grep '/$'| awk '{print $(NF-1)}'`

#Dislplay result

echo "The host hostname: $hostname"
echo "The host Virtualization: $vmp"
echo "The host operation: $os"
echo "The host kernel version: $kernel"
echo "The host Architecture: $arch"
echo "The host bussiness ip: $bsip"
echo "Ths host management ip: $mgtip"
echo "The host physical memeory: $phymem"
echo "The host aviable memory: $avimem"
echo "The host swap has: $swapt"
echo "The host swap use: $swapu"
echo "The host os disk has: $diskt"
echo "The host os disk use: $diskuse"