local fn = vim.fn
local execute = vim.api.nvim_command

-- Auto install packer.nvim if not exists
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end

vim.cmd [[packadd packer.nvim]]

-- Auto compile when there are changes in plugins.lua
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' 

return require('packer').startup(function()

    -- Packer to maintain itself
    use {'wbthomason/packer.nvim', opt = true}



    -- Themes 
    use({ 'rose-pine/neovim', as = 'rose-pine'})

end)
