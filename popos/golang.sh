#!/bin/bash

function installGolang {
	echo "Downloading Go 1.13.8..."
	wget -O ~/Downloads/golang.tar.gz https://dl.google.com/go/go1.13.8.linux-amd64.tar.gz

	echo "Extracting archive..."
	sudo tar -xvf ~/Downloads/golang.tar.gz -C /usr/local

	echo "Setting enviroment variables..."
	echo "export GOROOT=$HOME/go" >> ~/.profile
	echo "export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin" >> ~/.profile

	echo "Creating projects directory..."
	if [[ ! -d ~/go ]] && mkdir ~/go
}

installGolang
