#!/bin/bash

sudo apt-get update

# Installation 
sudo apt install -y \
	stow

# Neovim installation
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version
# Expose nvim
sudo rm -r /squashfs-root
sudo mv -f squashfs-root /
sudo ln -fs /squashfs-root/AppRun /usr/bin/nvim_exe
rm nvim.appimage

# Neovim configuration
sudo mv -f /usr/bin/nvim /usr/bin/nvim_exe
sudo cp -f ./nvim /usr/bin/
sudo chmod +x /usr/bin/nvim
