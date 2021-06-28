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

install_options(){
    echo "Are you sure to install Dashactyl? (y/n)"
    echo "-------------------------------------------------------"
    read choice
    case $choice in
        y ) installoption=y
            dependercy_install
            file_install
            ;;
        n ) exit
            ;;
        * ) output "You did not enter a valid selection."
            install_options
    esac
}

dependercy_install() {
    echo "------------------------------------------------------"
    echo "Starting Dependercy install."
    echo "------------------------------------------------------"
    sudo apt update && sudo apt upgrade
    sudo apt install git
    curl -fsSL https://rpm.nodesource.com/setup_12.x | sudo bash -
    apt install nodejs
    apt install npm
    apt install nginx
    echo "-------------------------------------------------------"
    echo "Dependercy Install Completed!"
    echo "-------------------------------------------------------"
}
file_install() {
    echo "-------------------------------------------------------"
    echo "Starting File install."
    echo "-------------------------------------------------------"
    git clone https://github.com/real2two/dashactyl.git
    cd dashactyl
    sudo npm install
    echo "-------------------------------------------------------"
    echo "Dashactyl File Install Completed!"
    echo "-------------------------------------------------------"
}
}
install_options

