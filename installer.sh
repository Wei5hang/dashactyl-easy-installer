#!/bin/bash

set -e
#############################################################################
#                                                                           #
# Github Project 'dashactyl-installer'                                      #
# By Dannni#0058                                                        #
#                                                                           #
#############################################################################
   clear

    echo "Dashactyl Install Script"
    echo "-------------------------------------------------------"
    echo "Made by Dannni#0058"
    echo "-------------------------------------------------------"

    echo "Please note that installing it on a non-fresh OS may cause problems."
    echo "-------------------------------------------------------"

    if [ "$lsb_dist" =  "ubuntu" ]; then
    echo "This script is only available for Ubuntu OS."
    echo "-------------------------------------------------------"
    fi

    sleep 6

    echo "------------------------------------------------------"
    echo "Starting NodeJS install."
    echo "------------------------------------------------------"
    sudo apt update -y && sudo apt upgrade -y
    sudo apt -y install curl dirmngr apt-transport-https lsb-release ca-certificates
    curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
    sudo apt -y install nodejs
    sudo apt -y  install gcc g++ make
    echo "------------------------------------------------------"
    echo "Starting Dependercy install."
    echo "------------------------------------------------------"
    sudo apt install git -y
    echo "-------------------------------------------------------"
    echo "Dependercy Install Completed!"
    echo "-------------------------------------------------------"

    echo "-------------------------------------------------------"
    echo "Starting File install."
    echo "-------------------------------------------------------"
    git clone https://github.com/real2two/dashactyl.git
    cd dashactyl
    sudo npm install
    echo "-------------------------------------------------------"
    echo "Dashactyl File Install Completed!"
    echo "-------------------------------------------------------"
