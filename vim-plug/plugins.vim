" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif


call plug#begin('~/.config/nvim/autoload/plugged')

    "--------- Syntax Support ------------
    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Closetags
    Plug 'alvan/vim-closetag'
    " Plugin to deal with URL Highlight URLs inside vim
    Plug 'itchyny/vim-highlighturl'
    "Displays a preview of colors with CSS
    Plug 'ap/vim-css-color'

    "-------- Tools ---------
      " Intellisense
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Which-key
    Plug 'liuchengxu/vim-which-key'
    " Status Line
    "Plug 'vim-airline/vim-airline'
    "Plug 'vim-airline/vim-airline-themes'
    " Shows signs for files in a git repo
    Plug 'airblade/vim-gitgutter'
    " making stuff
    Plug 'neomake/neomake'
     
    "--------- Color-schemes -----------
    " Themes 
    Plug 'joshdick/onedark.vim'
    "Add some color
    Plug 'junegunn/rainbow_parentheses.vim'
  
call plug#end()


" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif