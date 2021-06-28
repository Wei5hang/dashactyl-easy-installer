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
    echo "Select your installation option:"
    echo "[1] - Full Fresh Dashactyl Install (Dependercies, Files)"
    echo "[2] - Install the Dependercies."
    echo "[3] - Install the Files."
    echo "-------------------------------------------------------"
    read choice
    case $choice in
        1 ) installoption=1
            dependercy_install
            file_install
            ;;
        2 ) installoption=2
            dependercy_install
            ;;
        3 ) installoption=3
            file_install
            ;;
        * ) output "You did not enter a valid selection."
            install_options
    esac
}

dependercy_install() {
    echo "------------------------------------------------------"
    echo "Starting Dependercy install."
    echo "------------------------------------------------------"
    sudo apt update -y && sudo apt upgrade -y
    sudo apt install git -y
    sudo apt -y install curl dirmngr apt-transport-https lsb-release ca-certificates
    curl -fsSL https://deb.nodesource.com/setup_12.x | sudo bash -
    apt install nodejs -y
    apt install npm -y
    apt install nginx -y
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
install_options

