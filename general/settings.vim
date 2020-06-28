" Set leader key
let g:mapleader = "\<Space>"

"---------------------- General Settings -----------------------------------

syntax enable                           " Enables syntax highlighing=
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              			        " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that you can see `` in markdown files
set tabstop=4                           " Insert 4 spaces for a tab
set shiftwidth=4                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=2                        " Always display the status line
set number                              " Line numbers
set relativenumber                      " Relative Numbers
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else
set colorcolumn=80                      " Sets the 80 char limit line
"set autochdir                          " Your working directory will always be the same as your working directory

" -------------- Color Issues -------------------

" This function sets the highlight of the
" current line to a nice white color and 
" text to a blue
function s:SetCursorLine()
    set cursorline
    hi cursorline cterm=none ctermbg=darkblue ctermfg=white
endfunction
autocmd VimEnter * call s:SetCursorLine()

" ------------------ Status Line -------------------------------
set statusline=
"set statusline=%#PmenuSel#             " A nice blue color depends on theme
"set statusline=%#IncSearch#            " Sets the grey status line
set statusline=%#CursorLineNr#          " Sets the status line transparent
set statusline+=\ %y                    " Shows the file type
set statusline+=\ %M                    " Shows wether the file has been written
set statusline+=\ %r                    " Displays if the file is Read Only
set statusline+=\ %f                    " Shows the file name
set statusline+=%=                      " Right side settings
set statusline+=%#CursorLineNr#         " Sets the line num area to a black color
set statusline+=\ %l/%L                 " Display the current line / total lines
set statusline+=\ %p%%                  " Display percentage down the page
set statusline+=\ [%n]                  " Shows the buffer ID

" ------------------ Auto source this file ----------------------
au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

" You can't stop me
cmap w!! w !sudo tee %
