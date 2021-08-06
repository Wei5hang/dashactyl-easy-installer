    cd ~
    sudo apt update -y && sudo apt upgrade -y
    sudo apt -y install curl dirmngr apt-transport-https lsb-release ca-certificates
    curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
    sudo apt -y install nodejs
    sudo apt -y  install gcc g++ make
    sudo apt install git -y

    sleep 1

    git clone https://github.com/real2two/dashactyl.git
    cd dashactyl
    sudo npm install

