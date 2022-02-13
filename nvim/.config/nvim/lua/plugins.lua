local packer = require('packer')

packer.startup(function()
  -- use {
  --   'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile'
  -- }
  -- essentials
  use  'tpope/vim-surround'
  use  'tpope/vim-commentary'
  use  'easymotion/vim-easymotion'
  use  'tpope/vim-fugitive'
  use  'Raimondi/delimitMate'
  use  'tpope/vim-unimpaired'
  use  'mattn/emmet-vim'
  use  'SirVer/ultisnips'
  use  'honza/vim-snippets'

  -- file explorer
  use  'preservim/nerdtree'

  -- fzf
  use { 'junegunn/fzf', run = function() vim.fn['fzf#install()'](0) end }
  use  'junegunn/fzf.vim'

  -- debugging
  use  'puremourning/vimspector'

  use  'aklt/plantuml-syntax'
  use  'weirongxu/plantuml-previewer.vim'
  use  'tyru/open-browser.vim'

  -- colorscheme
  use  'morhetz/gruvbox'

  use {'nvim-treesitter/nvim-treesitter'}

  use {'nvim-orgmode/orgmode', config = function()
        require('orgmode').setup{}
    end
  }

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
  }

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
end)

