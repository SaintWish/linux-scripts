#!/bin/bash

##################
## Setup Script
##################
echo "Enable repos..."
sudo add-apt-repository universe

echo "Updating repositories..."
sudo apt-get update

echo "Creating directories..."
if [[ ! -d ~/Downloads ]] && mkdir ~/Downloads
if [[ ! -d ~/go ]] && mkdir ~/go

echo "Installing KDE Plasma Desktop..."
sudo apt-get install kubuntu-desktop

echo "Installing normal apps..."
sudo apt-get install -y snapd htop putty handbrake filezilla nmap openvpn chromium-browser

echo "Installing apps from snap..."
sudo snap install moonlight vlc

echo "Installing Graviton..."
wgen -O ~/Downloads/graviton.deb "https://github.com/Graviton-Code-Editor/Graviton-App/releases/download/1.2.0/Graviton-1.2.0-amd64-linux.deb"
sudo dpkg -i ~/Downloads/graviton.deb

echo "Installing Discord..."
wget -O ~/Downloads/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo dpkg -i ~/Downloads/discord.deb

echo "Installing Github Desktop..."
wget -O ~/Downloads/github-desktop.deb "https://github.com/shiftkey/desktop/releases/download/release-2.3.1-linux1/GitHubDesktop-linux-2.3.1-linux1.deb"
sudo dpkg -i ~/Downloads/github-desktop.deb

echo "Installing KeeWeb..."
wget -O ~/Downloads/keeweb.deb "https://github.com/keeweb/keeweb/releases/download/v1.12.3/KeeWeb-1.12.3.linux.x64.zip"
sudo dpkg -i ~/Downloads/keeweb.deb

echo "Installing Go 1.13.8..."
wget -O ~/Downloads/golang.tar.gz https://dl.google.com/go/go1.13.8.linux-amd64.tar.gz
sudo tar -xvf ~/Downloads/golang.tar.gz -C /usr/local
echo "export GOROOT=$HOME/go" >> ~/.profile
echo "export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin" >> ~/.profile

#Uninstall a few included apps I dislike.
sudo apt-get purge --auto-remove plasma-discover

##Do updates for everything, then we're ready for restart.
#sudo apt-get install -f -y #Incase some dependencies didn't get installed.
sudo apt-get update && sudo apt-get upgrade -y

echo $'\n'$"*** All done! Please reboot now. ***"
