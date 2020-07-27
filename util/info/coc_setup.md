# Enabling the plugins

Inside the `/.config/nvim/` directory, open the file `./vim-plug/plugins.vim` and then run the command:

```vim
:PlugInstall
```

Once done, this will allow the plugins to begin working on reload. A few require coc installs and will be listsed below.

## CocInstall

To enable all (or some) of the syntax support click [here](./util/info/coc_setup.md) for instructions.

Run the command inside Neovim:

```
:CocInstall
```

followed by any/all the following

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
```

then run:

```
:CocList marketplace
```
