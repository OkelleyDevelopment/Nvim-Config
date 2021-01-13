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
    " LaTeX Support
    Plug 'lervag/vimtex'
    "Plug 'Harenome/vim-mipssyntax'
    "-------- Tools ---------
    " Intellisense
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Vim Snippets
    Plug 'honza/vim-snippets'
    " Shows edits in files that are added to GIT 
    Plug 'airblade/vim-gitgutter'
    " A Vim Plugin for Lively Previewing LaTeX PDF Output
    Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
    " Making stuff
    Plug 'neomake/neomake'
    
    " Status Line
    "Plug 'vim-airline/vim-airline'
    "Plug 'vim-airline/vim-airline-themes'
    
    " --------- Color-schemes ----------- "
    "Plug 'joshdick/onedark.vim'
    Plug 'arcticicestudio/nord-vim'
    "Plug 'ghifarit53/tokyonight-vim'
    "Plug 'ulwlu/elly.vim'
    "Plug 'sainnhe/forest-night'
    "Plug 'ayu-theme/ayu-vim' 
    "Plug 'doums/darcula'
    
call plug#end()


" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
