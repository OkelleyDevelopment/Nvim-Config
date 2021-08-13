local utils = require('utils')
local cmd = vim.cmd

-- Set leader key
vim.g.mapleader = " "  -- Map leader key

-------------------------- General Settings ---------------------------

cmd 'syntax enable'
cmd 'filetype plugin indent on'

utils.opt('o', 'hidden', true)
utils.opt('o', 'encoding', 'utf-8')
utils.opt('o', 'fileencoding', 'utf-8')
utils.opt('o', 'cmdheight', 2)
utils.opt('o', 'ruler', true)
utils.opt('o', 'mouse', 'a')
utils.opt('o', 'splitbelow', true)
utils.opt('o', 'splitright', true)
utils.opt('b', 'tabstop', 4)
utils.opt('b', 'shiftwidth', 4)
utils.opt('o', 'smarttab', true)
utils.opt('b', 'expandtab', true)
utils.opt('b', 'smartindent', true)
utils.opt('b', 'autoindent', true)
utils.opt('w', 'number', true)
utils.opt('w', 'relativenumber', true)
utils.opt('o', 'background', 'dark')
utils.opt('o', 'showmode', false)
utils.opt('o', 'updatetime', 300)
utils.opt('o', 'timeoutlen', 500)
utils.opt('o', 'clipboard','unnamed,unnamedplus')
utils.opt('w', 'colorcolumn', '80')
utils.opt('o', 'scrolloff', 4)

-------------------------- Status Line ---------------------------
local statusline = '%#CursorLineNr#'
statusline = statusline .. ' %y' 
statusline = statusline .. ' %M' 
statusline = statusline .. ' %r'
statusline = statusline .. ' %f' 
statusline = statusline .. '%='
statusline = statusline .. '%#CursorLineNr#' 
statusline = statusline .. ' %l/%L' 
statusline = statusline .. ' %p%%' 
statusline = statusline .. ' [%n]'
utils.opt('o', 'statusline', statusline)



