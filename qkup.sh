#!/bin/bash


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
  if command -v apt-get; then
    value=1
    echo "Package apt is installed."
  else
    value=0
    echo "Package apt is not installed."
  fi
}


### Update Procedures

## Pacman | Yaourt
# Run using sudo
function pac_sudo {
  sudo pacman -Syu
}

# Run as root/admin
function pac_su {
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
function yum_sudo {
  sudo yum update
  sudo yum clean all
}

# Run as root/admin
function yum_su {
  yum update
  yum clean all
}


## Emerge



### Operation

# Run based on var's
function qkpg {
  if sudo_check=1 ;
    then
      
  elif
    
fi
}



### Excecution order

sudo_check
os_check
qpkg
