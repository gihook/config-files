local packer = require('packer')

packer.startup(function()
  use {
    'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile'
  }
  use  'easymotion/vim-easymotion'
  use  'preservim/nerdtree'
  use { 
    'junegunn/fzf', run = 'fzf#install()'
  }
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
  use  'weirongxu/plantuml-previewer.vim'
end)

