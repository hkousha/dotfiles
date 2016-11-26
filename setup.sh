#!/bin/bash

sudo apt-get update
current=`pwd`

# oh-my-zsh
echo "Setting up zsh"
sudo apt-get install --yes --force-yes zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
## oh-my-zsh fasd
cd ~/.oh-my-zsh/plugins/fasd/
git clone https://github.com/clvv/fasd
cd fasd
sudo make install
## copy .zshrc and .oh-my-zsh and profile
cd $current
cp zsh/zshrc ~/.zshrc
cp zsh/dallas.zsh-theme ~/.oh-my-zsh/themes/dallas.zsh-theme


# xscreensaver
echo "Setting up xscreensaver"
sudo apt-get install --yes --force-yes xscreensaver xscreensaver-data-extra xscreensaver-gl-extra

# Bashrc
echo "Setting up bashrc"
cp terminal/bashrc ~/.bashrc
