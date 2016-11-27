#!/bin/bash

sudo apt-get update
# Get install.sh directory to be used later.
current="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

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


# i3
echo "Setting up i3"
cd $current
cp i3/config ~/.i3/config
sudo cp i3/i3status.conf /etc/i3status.conf
 

# xscreensaver
echo "Setting up xscreensaver"
sudo apt-get install --yes --force-yes xscreensaver xscreensaver-data-extra xscreensaver-gl-extra

# Bashrc
echo "Setting up bashrc"
cd $current
cp terminal/bashrc ~/.bashrc
