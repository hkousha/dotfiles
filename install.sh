#!/bin/bash

current="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

package(){
    sudo apt-get update
    # Get install.sh directory to be used later.
    # Install deps:
    sudo apt-get install --yes --force-yes curl vim i3 git python-pip
}


# oh-my-zsh
zsh(){
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
}


# i3
i3(){
    echo "Setting up i3"
    cd $current
    mkdir ~/.i3/
    cp i3/config ~/.i3/config
    sudo cp i3/i3status.conf /etc/i3status.conf
}


# xscreensaver
xscreen(){
    echo "Setting up xscreensaver"
    sudo apt-get install --yes --force-yes xscreensaver xscreensaver-data-extra xscreensaver-gl-extra
}

# Bashrc
bash(){
    echo "Setting up bashrc"
    cd $current
    cp terminal/bashrc ~/.bashrc
}


# vim
vim(){
    echo "Start configuring vim"
    cd $current
    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
        curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    cp vim/.vimrc ~/
    cat vim/vimbundles | while read plugin
    do
        cd ~/.vim/bundle && git clone $plugin
    done
    # Installing molokai color:
    mkdir ~/.vim/colors
    cat vim/vimcolors | while read colors
    do
        wget -q $colors -P ~/.vim/colors/
    done
}

OPTION=$1
if [ -z $OPTION ]; then
    package
    zsh
    i3
    xscreen
    bash
    vim
else
    $($OPTION)
fi
