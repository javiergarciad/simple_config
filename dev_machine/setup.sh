#!/bin/bash

# Exit on any error
# set -e

# Update the system
echo "Updating the system..."
sudo apt update && sudo apt upgrade -y
sudo apt autoremove -y

# Install Python 3 and essential packages
echo "Installing Python 3 and essential packages..."
sudo apt install -y python3 python3-pip python3-venv curl zsh git

# Git Config
echo "Setting up Git..."
git config --global user.name "javier Garcia"
git config --global user.email "javier.garcia.d@gmail.com"

# Install and configure Poetry
echo "Installing Poetry..."
curl -sSL https://install.python-poetry.org | python3 -


# Install NodeJS
echo "Installing NodeJS..."
sudo apt-get install -y ca-certificates curl gnupg
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
sudo apt-get update
sudo apt-get install nodejs -y

# install docker
echo "Installing Docker..."
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
# check if group docker exists
sudo usermod -aG docker $USER
newgrp docker
sudo systemctl enable docker.service
sudo systemctl enable containerd.service


# Install oh-my-zsh
echo "Installing Oh-My-Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s $(which zsh)

# Install ZSH plugins
echo "Installing ZSH plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


# Replace .zshrc
echo "Replacing .zshrc..."
cp .zshrc ~/.zshrc




# configure poetry
poetry config virtualenvs.in-project true
poetry config virtualenvs.create true




# create some folders at home
echo "Creating some folders at home..."
mkdir -p ~/downloads
mkdir -p ~/dev


echo "All installations are complete."
