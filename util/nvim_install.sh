#!/bin/bash

promptPipInstall() { \
    echo "pip not found"
    echo "Please install pip3 before continuing..."
    exit
} 

installplugs() { \
  mv $HOME/.config/nvim/init.vim $HOME/.config/nvim/init.vim.tmp
  mv $HOME/.config/nvim/utils/init.vim $HOME/.config/nvim/init.vim
  echo "Installing plugins..."
  nvim --headless +PlugInstall +qall > /dev/null 2>&1
  mv $HOME/.config/nvim/init.vim $HOME/.config/nvim/utils/init.vim
  mv $HOME/.config/nvim/init.vim.tmp $HOME/.config/nvim/init.vim
}

promptNodeInstall() { \
    echo "node not found"
    echo -n "Would you like to install node now "
    read answer
    [ "$answer" != "${answer#[Yy]}" ] && installNode && installcocextensions

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
  sudo npm install coc-explorer coc-snippets coc-json coc-actions --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
}

cloneNvimConfig() { \

    echo "Cloning Nikolai's Nvim Configuration"
    git clone https://github.com/OkelleyDevelopment/Nvim-Configs ../configTest/
}

# Welcome to the Grid
echo "Installing Nikolai's Nvim Configuration"

# install pip
which pip3 > /dev/null && echo "Pip3 installed, moving on..." || promptPipInstall

# install node and veovim support
which node > /dev/null && echo "NodeJS installed, moving on..." || promptNodeInstall

pip3 list | grep pynvim > /dev/null && echo "Pynvim installed, moving on..." || installpynvim

# move old nvim directory if it exists
[ -d "$HOME/.config/nvim" ] && moveOldNvim

# Clone the repo down
cloneNvimConfig

# Install plugins
which nvim > /dev/null && installplugs

# installs the plugin extensions
installcocextensions

# Extensions
# echo "I recommend enabling the following CoC extensions:"

# check health
echo "Recommend running :checkHealth inside nvim to make sure everything is working"

# Closing remark
echo "The installation has finished, thank you."
