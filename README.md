# monitoring.sh

## Overview

The `monitoring.sh` script is designed to provide real-time monitoring information about your Debian-based virtual machine.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Example Output](#example-output)
- [Compatibility](#compatibility)
- [License](#license)

## Introduction

The `monitoring.sh` script is a bash script developed to monitor various aspects of your server. It provides critical information such as CPU usage, memory usage, disk usage, and network statistics. This script is particularly useful for managing virtual machines set up for the Born2beRoot project.

## Features

- Displays system architecture and kernel version
- Monitors physical and virtual CPU count
- Reports available RAM and usage percentage
- Reports available disk space and usage percentage
- Displays CPU load as a percentage
- Shows the date and time of the last system reboot
- Checks if LVM is active
- Displays the number of active connections
- Reports the number of users currently logged in
- Provides the server's IPv4 and MAC address
- Counts the number of commands executed with sudo

## Example Output

The script will display the following information:

```
#Architecture: Linux wil 4.19.0-16-amd64 #1 SMP Debian 4.19.181-1 (2021-03-19) x86_64 GNU/Linux
#CPU physical: 1
#vCPU: 1
#Memory Usage: 74/987MB (7.50%)
#Disk Usage: 1009/2Gb (49%)
#CPU load: 6.7%
#Last boot: 2021-04-25 14:45
#LVM use: yes
#Connections TCP: 1 ESTABLISHED
#User log: 1
#Network: IP 10.0.2.15 (08:00:27:51:9b
)
#Sudo: 42 cmd
```

## Compatibility

This script is designed to work on Linux, specifically Debian-based systems. It relies on Linux-specific commands and file paths that may not be available or behave differently on other operating systems such as macOS or Windows.
