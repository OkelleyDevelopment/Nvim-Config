#!/bin/bash

# Author: Nicholas O'Kelley
# A bash script to set up my neovim config
# Date: August 2, 2020
# Modified: August 29, 2020

installpiponubuntu() { \
  sudo apt install python3-pip -y > /dev/null
}

installpiponarch() { \
  pacman -S python-pip
}

promptPipInstall() { \
    echo "pip not found. Installing now..."
    [  -n "$(uname -a | grep Ubuntu)" ] && installpiponubuntu
    [ -f "/etc/arch-release" ] && installpiponarch
    
} 

installplugs() { \
  mv $HOME/.config/nvim/init.vim $HOME/.config/nvim/init.vim.tmp
  mv $HOME/.config/nvim/util/init.vim $HOME/.config/nvim/init.vim
  echo "Installing plugins..."
  nvim --headless +PlugInstall +qall > /dev/null 2>&1
  mv $HOME/.config/nvim/init.vim $HOME/.config/nvim/util/init.vim
  mv $HOME/.config/nvim/init.vim.tmp $HOME/.config/nvim/init.vim
}

promptNodeInstall() { \
    echo "NodeJS not found, installing now..."
    installNode && installcocextensions

}

installnodeubuntu(){ \
    sudo apt install nodejs -y
    sudo apt install npm -y
    sudo npm i -g neovim   
}

installnodearch(){ \
    sudo pacman -S nodejs
    sudo pacman -S npm
}

installNode() { \
    echo "Installing nodejs..."
    [  -n "$(uname -a | grep Ubuntu)" ] && installnodeubuntu
    [ -f "/etc/arch-release" ] && installnodearch
}

installpynvim(){ \
    echo "Installing pynvim..."
    pip3 install pynvim
}

moveOldConfig(){ \
    echo "Moving the old config to nvim.old"
    mv $HOME/.config/nvim $HOME/.config/nvim.old
}

installcocextensions() { \
  # Install extensions
  mkdir -p ~/.config/coc/extensions
  cd ~/.config/coc/extensions
  [ ! -f package.json ] && echo '{"dependencies":{}}'> package.json
  # Change extension names to the extensions you need
  # sudo npm install coc-explorer coc-snippets coc-json coc-actions --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
  sudo npm install coc-prettier coc-html coc-rust-analyzer coc-sh coc-tslint coc-python coc-css coc-yaml coc-tsserver coc-explorer coc-snippets coc-json coc-marketplace coc-java coc-clangd --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
}

cloneNvimConfig() { \
    echo "Cloning Nikolai's Nvim Configuration"
    #touch ~/.config/nvim
    mkdir ~/.config/nvim/
    git clone https://github.com/OkelleyDevelopment/Nvim-Configs ~/.config/nvim/
    mv ~/.config/nvim/Nvim-configs/* ~/.config/nvim/.
}

# Clear the screen
clear
# Welcome to the Grid
echo "Installing Nikolai's Nvim Configuration"

# install pip
which pip3 > /dev/null && echo "Pip3 installed, moving on..." || promptPipInstall

# install node and veovim support
which node > /dev/null && echo "NodeJS installed, moving on..." || promptNodeInstall

pip3 list | grep pynvim > /dev/null && echo "Pynvim installed, moving on..." || installpynvim

# move old nvim directory if it exists
[ -d "$HOME/.config/nvim" ] && moveOldConfig

clear

# Clone the repo down
cloneNvimConfig

# Install plugins
which nvim > /dev/null && installplugs

# installs the plugin extensions
installcocextensions

# check health
echo "Recommend running :checkHealth inside nvim to make sure everything is working"

# Closing remark
echo "This installation has finished"
