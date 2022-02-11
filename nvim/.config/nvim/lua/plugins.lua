local packer = require('packer')

packer.startup(function()
  use {
    'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile'
  }
  use  'easymotion/vim-easymotion'
  use  'preservim/nerdtree'
  use { 'junegunn/fzf', run = function() vim.fn['fzf#install()'](0) end }
  use  'junegunn/fzf.vim'
  use  'morhetz/gruvbox'
  use  'tpope/vim-surround'
  use  'tpope/vim-commentary'
  use  'tpope/vim-fugitive'
  use  'Raimondi/delimitMate'
  use  'tpope/vim-unimpaired'
  use  'mattn/emmet-vim'
  use  'SirVer/ultisnips'
  use  'honza/vim-snippets'
  use  'puremourning/vimspector'
  use  'aklt/plantuml-syntax'
  use  'tyru/open-browser.vim'
  use  'weirongxu/plantuml-previewer.vim'

  use {'nvim-treesitter/nvim-treesitter'}
  use {'nvim-orgmode/orgmode', config = function()
        require('orgmode').setup{}
    end
  }
end)

