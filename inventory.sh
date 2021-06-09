#!/bin/bash


##Modified by: linkmunirih@gmail.com
##Date: 09-06-2021
##Description: This script is created to do a full inventory check based on what the user requires.

os_ver=`cat /etc/*release`
echo "the OS version is ${os_ver}"
sleep 2

echo "the total number of CPU in this system is `nproc`"
sleep 2

echo "the harddrive size is `lsblk`"
sleep 2

scpu=`cat /proc/cpuinfo |awk '/cpu MHz/ {print $4}'`
echo "The CPU speed is ${scpu}"
sleep 2

echo "The kernel version is `uname -r`"
sleep 2

sys_bits=`getconf LONG_BIT`
echo "The system bits is ${sys_bits}"
sleep 2

echo "the system hostname is ${HOSTNAME} "
sleep 2

ipadd=`ifconfig |grep inet |awk 'NR==1 {print $2}'`
echo "This system's IP address is ${ipadd}"

p=`firewall-cmd --list-ports`
echo -e "the list of this  system's opened ports \n ${p}"
sleep 2

manu=`dmidecode -t system| grep -i manufacturer |awk '{print $2, $3}'`
echo "The system's manufacturer is ${manu}"
sleep 2

if [ ${manu} == innotek Gmbh ] || [ ${manu} == GEMU ]
then
echo "This system is a virtual."
else
echo "This system is physical."
fi
sleep 2
macadd=`cat /sys/class/net/*/address | awk 'NR== 1 {print}'`
echo "The system's mac address is ${macadd}"
sleep 2
echo "end of system inventory check"


