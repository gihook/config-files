local packer = require('packer')

packer.startup(function()
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  use 'easymotion/vim-easymotion'
  use 'marko-cerovac/material.nvim'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'glepnir/lspsaga.nvim'
  use 'hrsh7th/nvim-cmp'

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    config = function() require'nvim-tree'.setup {} end
  }
end)

