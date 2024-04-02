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
git config --global user.name "Javier Garcia"
git config --global user.email "javier.garcia.d@gmail.com"

# Install and configure Poetry
echo "Installing Poetry..."
curl -sSL https://install.python-poetry.org | python3 -


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
cp .aliases ~/.aliases


# configure poetry
poetry config virtualenvs.in-project true
poetry config virtualenvs.create true




# create some folders at home
echo "Creating some folders at home..."
mkdir -p ~/downloads
mkdir -p ~/dev


echo "All installations are complete."
