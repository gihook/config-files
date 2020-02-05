set nocompatible              " be iMproved, required
filetype off                  " required
set laststatus=2
set statusline=%{FugitiveStatusline()}
set statusline+=\ \%t,\ \%l/%L\ %P

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

set splitbelow
set splitright

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'elixir-editors/vim-elixir'
Plugin 'scrooloose/nerdtree'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'dense-analysis/ale'
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'
Plugin 'sainnhe/edge'
Plugin 'sheerun/vim-polyglot'
Plugin 'Xuyuanp/nerdtree-git-plugin'

call vundle#end()            " required
filetype plugin indent on    " required

map <c-h> :tabprev<cr>
map <c-l> :tabnext<cr>
map <leader>f :FZF<CR>
map <leader>d :ALEGoToDefinition<CR>
map <leader>h :ALEHover<CR>
map <leader>r :ALEFindReferences<CR>
map <C-n> :NERDTreeToggle<CR>

let g:NERDTreeUseSimpleIndicator = 1

" important!!
set termguicolors

" for dark version
set background=dark

" the configuration options should be placed before `colorscheme edge`
let g:edge_style = 'neon'
let g:edge_disable_italic_comment = 1
let g:airline_theme = 'edge'

colorscheme edge

set number
set rnu

let g:ale_linters = {
\   'elixir': ['elixir-ls'],
\   'xml': ['xmllint'],
\   'typescript': ['tslint', 'prettier', 'tsserver'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'xml': ['xmllint'],
\   'typescript': ['tslint', 'prettier'],
\   'html': ['prettier'],
\   'elixir': ['mix_format'],
\}

let g:ale_fix_on_save = 1
let g:ale_elixir_elixir_ls_release = '/home/nikola/git/elixir-ls/rel/'
let g:ale_completion_enabled = 1
let g:ale_set_balloons = 1
let g:ale_completion_tsserver_autoimport = 1

set omnifunc=ale#completion#OmniFunc
