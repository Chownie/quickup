#!/bin/bash

# This script is mean to provide a painless way of updating any distribution that uses apt, yum, pacman, and emerge with little input from the user. The advantage provided is that you can push the same command to multiple systems to begin the update process, or just remember one command to update them all!
#
# If you would like additonal information, please consult the man pages for your package manager and it's associated manual pages.
#
# Note: This script is currently not posix compliant, and may not run on all types of systems



### Specifying conditions

# Check for 'sudo' package, else run using su
function sudo_check {
  if command -v sudo; then
    value=1
    echo "Package sudo is installed."
  else
    value=0
    echo "Package sudo is not installed."
  fi
}

# Check current package manager
function pkg_check {
  co
}



### 

## Archlinux-based (using pacman)
# Run using sudo
function arch_sudo {
  sudo pacman -Syu
}

# Run as root/admin
function arch_su {
  pacman -Syu
}



## APT
# Run using sudo
function apt_sudo {
  sudo apt-get update
  sudo apt-get autoclean 
  sudo apt-get upgrade
  sudo apt-get autoremove
  sudo apt-get clean
}
# Run as root/admin
function apt_su {
  apt-get update
  apt-get autoclean
  apt-get upgrade
  apt-get autoremove
  apt-get clean
}

## YUM
# Run using sudo
#function yum_sudo {
#  
#}
# Run as root/admin
#function yum_su {
#  
#}

# Run for current system
#function operate {
#  if sudo_check=1 ;
#    then
#      
#  elif
#    echo "Sudo not found, requesting login via su"
#fi
#}


### Excecution order

sudo_check
os_check
qpkg
