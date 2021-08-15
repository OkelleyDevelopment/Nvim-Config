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

    -- File browser
    use "kyazdani42/nvim-web-devicons"
    use {'tamago324/lir.nvim', 
           requires = {
               {'kyazdani42/nvim-web-devicons'},
               {'tamago324/lir-git-status.nvim'},
               {'nvim-lua/plenary.nvim'},
           },
           config = function()
               require('plugins.nv_lir')
           end,
           disabled = false
        }

    -- Git integration
    use {'nvim-lua/plenary.nvim'}
    use {
          'lewis6991/gitsigns.nvim',
          requires = {
            'nvim-lua/plenary.nvim'
          },
          config = function()
            require('gitsigns').setup()
          end
        }


    -- LSP and completion
    use { 'neovim/nvim-lspconfig' }
    use { 'nvim-lua/completion-nvim' }

    ----- Themes -----
    -- Rose-pine
    use({ 'rose-pine/neovim', as = 'rose-pine'})
    -- Nord
    use 'shaunsingh/nord.nvim'

end)