#!/bin/bash


### Specifying conditions

# Check for 'sudo' package, else run using su
function sudo_check {
  if command -v sudo; then
    sudo_status=1
    echo "Package 'sudo' is installed, continuing using 'sudo'"
  else
    sudo_status=0
    echo "Package 'sudo' is not installed, using 'su' instead."
  fi
}


### Update Procedures

## Pacman
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


### Operation

# Check current package manager, then run
function pkg_check {
  if command -v apt-get
   then
    echo "Using APT to continue"
      if sudo_status=1; then
        apt_sudo
      else
        apt_su
      fi
    exit
  elif command -v pacman
   then
    echo "Using pacman to continue"
      if sudo_status=1; then
        pac_sudo
      else
        pac_su
      fi
    exit
  elif command -v yum
   then
    echo "Using yum to continue"
      if sudo_status=1; then
        yum_sudo
      else
        yum_su
      fi
    exit
  else
    echo "No compatible package manager found"
    exit
  fi
}


### Excecution order

sudo_check
pkg_check
