#!/bin/bash

set -euxo pipefail

sudo apt install -y \
    zsh terminator \
    curl build-essential git vim \
    openjdk-11-jdk \
    xclip

mkdir -p tmp

download_and_run() {
    curl -fsSL -o tmp/$1 $2
    sudo bash tmp/$1 
}

# VS Code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > tmp/packages.microsoft.gpg
sudo install -o root -g root -m 644 tmp/packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt install -y apt-transport-https
sudo apt update -y
sudo apt install -y code

# Oh My Zsh
CHSH=no RUNZSH=no download_and_run oh-my-zsh.sh https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh
chsh "$USER" -s /bin/zsh

# NVM and Node
download_and_run nvm.sh https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh
nvm install v12

python scripts/copy-dotfiles.py

# Cleanup
sudo apt upgrade -y
sudo apt autoremove -y
