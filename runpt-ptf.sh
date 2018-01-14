#!/bin/bash
# Author:  Xlemon
# Contact me: Telegram @xlemons
export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
clear
printf "
#############################################################################################
#     PT Runtime environment setup for Alpharacks Debian 7&8 Mayby Support Ubunt 14-16      #
#                 For more information please concact me via Telegram                       #
#############################################################################################
"
# Check if user is root
[ $(id -u) != "0" ] && { echo "${CFAILURE}Error: You must be root to run this script${CEND}"; exit 1; }
#update system
apt-get update
apt-get install curl build-essential default-jdk software-properties-common unzip -y
curl -sL https://deb.nodesource.com/setup_6.x -o nodesource_setup.sh
bash nodesource_setup.sh
apt-get install nodejs
apt-get update
apt-get install oracle-java8-installer
ln -s /usr/bin/nodejs /usr/bin/node
apt-get install npm
npm install pm2@latest -g


#PTF
curl https://packages.microsoft.com/keys/microsoft.asc | gpg —dearmor > microsoft.gpg
mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-xenial-prod xenial main" > /etc/apt/sources.list.d/dotnetdev.list'
apt-get install -y apt-transport-https
apt-get update
apt-get install -y dotnet-sdk-2.1.3curl https://packages.microsoft.com/keys/microsoft.asc | gpg —dearmor > microsoft.gpg
mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-xenial-prod xenial main" > /etc/apt/sources.list.d/dotnetdev.list'
apt-get install apt-transport-https
apt-get update
apt-get install -y dotnet-sdk-2.1.3


# Print java version
#javac -version
# Clean files
rm -rf nodesource_setup.sh


