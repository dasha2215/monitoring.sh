#!/bin/bash

# architecture & kernel version

arch=$(uname -a)

# number of physical processors

physical_cpu=$(grep "physical id" /proc/cpuinfo | wc -l)

# number of virtual processors

virtual_cpu=$(grep "processor" /proc/cpuinfo | wc -l)

# current available and used RAM

ram_used=$(free -m | awk '$1 == "Mem:" {print $3}')
ram_total=$(free -m | awk '$1 == "Mem:" {print $2}')
ram_ratio=$(free -m | awk '$1 == "Mem:" {printf ("%.2f\n", $3/$2*100)}')

# current available and used disk memory

disk_used=$(df -m | grep "/dev/" | grep -v "/boot" | awk '{disk_used += $3} END {print disk_used}')
disk_total=$(df -m | grep "/dev/" | grep -v "/boot" | awk '{disk_total += $2} END {printf ("%.0f\n"), disk_total / 1024}')
disk_ratio=$(df -m | grep "/dev/" | grep -v "/boot" | awk '{disk_u += $3} {disk_t += $2} END {printf("%d\n", disk_u / disk_t * 100)}')

# current CPU load

cpu_idle=$(vmstat 1 3 | tail -n 1 | awk '{print $15}')
cpu_load=$(printf "%.1f" $(expr 100 - $cpu_idle))

# last reboot

system_boot=$(who -b | awk '$1 == "system" {print $3 " " $4}')

# LVM status

lvm_st=$(if [ $(lsblk | grep "lvm" | wc -l) -gt 0 ]; then echo yes; else echo no; fi)

# number of active connections

tcp_num=$(ss -ta | grep "ESTAB" | wc -l)

# number of users using the server

users_num=$(users | wc -w)

# server address

ip=$(hostname -I)
mac=$(ip link | grep "link/ether" | awk '{print $2}')

# number of executed sudo commands

sudo_coms=$(grep "COMMAND" "/var/log/sudo/sudo_logs.log"| wc -l)


wall "	#Architecture: $arch
	#CPU physical: $physical_cpu
	#vCPU: $virtual_cpu
	#Memory Usage: $ram_used/${ram_total}MB ($ram_ratio%)
	#Disk Usage: $disk_used/${disk_total}GB ($disk_ratio%)
	#CPU load: $cpu_load%
	#Last boot: $system_boot
	#LVM use: $lvm_st
	#Connections TCP: $tcp_num ESTABLISHED
	#User log: $users_num
	#Network: IP $ip ($mac)
	#Sudo: $sudo_coms cmd "
