# Nikolai's Nvim Config

![Nikolai Config](./util/images/title.png)

## Motivation

My NeoVim setup that is meant to improve some quality of life functionality while still
retaining the overall sleekness the NeoVim offers.

This process helped me learn more about various aspects of this program such as defining shortcuts
and control remapping. Another powerful feature was defining `TAB` completion of the
snippets and paths.

### NOTE:

This configuration is by no means perfect and will continue to be updated as my work-flow
evolves.

## A fancy one-liner

```sh
bash <(curl -s https://raw.githubusercontent.com/OkelleyDevelopment/Nvim-Config/master/util/install.sh)
```

## Prerequisites

You will need the following installed:

- NeoVim
  ```sh
      sudo apt install neovim
  ```
- NPM
  ```sh
  sudo apt install npm
  ```
- PIP

```sh
sudo apt install python3-pip
```

- Python and Node Support

```sh
pip install pynvim

npm i -g neovim
```

- VimPlug

```sh
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

- Clang

## Setting the Config

Inside `~/.config/`, run the commands:

```sh
mkdir nvim

git clone https://github.com/OkelleyDevelopment/Nvim-Configs.git

mv ~/.config/Nvim-Configs/* ~/.config/nvim/
```

Ensure the `.git` folder moved over too and you will have the needed assets.

### Enable Plugins

Inside `/.config/nvim/`, open `./vim-plug/plugins.vim` and run

```sh
:PlugInstall
```

Upon neovim restart the plugins will be enabled.

## Syntax Support

To enable the proper syntax support,

```sh
:CocInstall <plugin name here>
```

Followed by any/all the following

- coc-yaml
- coc-tsserver
- coc-tslint
- coc-sh
- coc-rls
- coc-python
- coc-java
- coc-html
- coc-explorer
- coc-css
- coc-clnagd
- coc-prettier
- coc-snippets

NOTE: If you wish to see what CoC extensions exist run this:

```
:CocInstall coc-marketplace

:CocList marketplace
```

## Adding Plugins

1. Locate your chosen plugin's plug command
2. Add it to the file in `./vim-plug/plugins.vim`
3. Save and quit
4. Make any plugin specific configurations in `./plug-config/` and source in
   `./init.vim`
5. Then run the command `:PlugInstall`
   - Note: My file has an autoload function when opening Nvim, so
     you may not have to run that command explicitly

## Adding Themes

1. Locate the `Plug` command for the theme
2. Add it to the file in `./vim-plug/plugins.vim`
3. Save and quit
4. Make any plugin specifc configurations in ` ./themes/``<name of theme>.vim ` and source in
   `./init.vim`

## Key Mappings

All the key mappings are sourced through `init.vim` and can be easily remapped
in the
`./keys/`
directory.

For help learning how to map keys check out this [article](https://medium.com/vim-drops/understand-vim-mappings-and-create-your-own-shortcuts-f52ee4a6b8ed).

## Custom Snippets

This is easily one of the coolest parts of this setup. Coc-snippets allows the user
to have access to a wide range of code snippets (common operations/setups in various languages).

Check [this](https://github.com/neoclide/coc-snippets) link to learn more.

If you want to create your own snippets, add a file in the `./snips/` directory
with the following naming scheme:

```
<language name goes here>.snippets
```

Then adding the snippet is a matter of following the instructions on the coc-snippets
GitHub.
