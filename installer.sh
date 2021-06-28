#!/bin/bash

set -e
#############################################################################
#                                                                           #
# By Dannni#0058                                                            #
#                                                                           #
#############################################################################

   clear

    echo "Dashactyl Install Script"
    echo "-------------------------------------------------------"
    echo "Made by Dannni#0058"
    echo "-------------------------------------------------------"
    echo "Please note that installing it on a non-fresh OS may cause problems."
    echo "-------------------------------------------------------"
    echo "This script is only available for Ubuntu OS."
    echo "-------------------------------------------------------"

    sleep 6

    echo "------------------------------------------------------"
    echo "Starting NodeJS install."
    echo "------------------------------------------------------"
    sudo apt update -y && sudo apt upgrade -y
    sudo apt -y install curl dirmngr apt-transport-https lsb-release ca-certificates
    curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
    sudo apt -y install nodejs
    sudo apt -y  install gcc g++ make
    echo "-------------------------------------------------------"
    echo "NodeJS Install Completed!"
    echo "-------------------------------------------------------"

    sleep 1

    echo "------------------------------------------------------"
    echo "Starting Dependercy install."
    echo "------------------------------------------------------"
    sudo apt install git -y
    echo "-------------------------------------------------------"
    echo "Dependercy Install Completed!"
    echo "-------------------------------------------------------"

    sleep 1

    echo "-------------------------------------------------------"
    echo "Starting Dashactyl install."
    echo "-------------------------------------------------------"
    git clone https://github.com/real2two/dashactyl.git
    cd dashactyl
    sudo npm install
    echo "-------------------------------------------------------"
    echo "Dashactyl Install Completed!"
    echo "-------------------------------------------------------"

    sleep 1

    echo "-------------------------------------------------------"
    echo "Starting Settings Configuration."
    echo "Read the Docs for further infomration."
    echo "https://cutt.ly/omyptWe"
    echo "-------------------------------------------------------"

    sleep 1

    cd dashactyl
    file=settings.json

    echo "What is the web port? [80] (The port Dashactyl will run on)"
    read WEBPORT
    echo "What is the pterodactyl URL? (https://panel.domain.com)"
    read PTERODACTYL_DOMAIN
    echo "What is the pterodactyl API key? (Perms: https://cutt.ly/dmypP54)"
    read PTERODACTYL_KEY
    echo "What is the Discord Oauth2 ID?"
    read DOAUTH_ID
    echo "What is the Discord Oauth2 Secret?"
    read DOAUTH_SECRET
    echo "What is the Discord Oauth2 Link?"
    read DOAUTH_LINK
    echo "What is the Callback path? [callback]" 
    read DOAUTH_CALLBACKPATH

    sed -i 
    -e 's/"port":.*/"port": '$WEBPORT',/' 
    -e 's/"domain":.*/"domain": "'$PTERODACTYL_DOMAIN'",/' 
    -e 's/"key":.*/"key": "'$PTERODACTYL_KEY'"/' 
    -e 's/"id":.*/"id": "'$DOAUTH_ID'",/' 
    -e 's/"link":.*/"link": "'$DOAUTH_LINK'",/' 
    -e 's/"path":.*/"path": "'$DOAUTH_CALLBACKPATH'",/' 
    -e '0,/"secret":.*/! {0,/"secret":.*/ s/"secret":.*/"secret": "'$DOAUTH_SECRET'",/}' 
    $file

    echo "-------------------------------------------------------"
    echo "Dashactyl installation Completed!"
    echo "-------------------------------------------------------"
