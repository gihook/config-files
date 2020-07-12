set nocompatible              " be iMproved, required
filetype off                  " required
set laststatus=2
set statusline=%{FugitiveStatusline()}
set statusline+=\ \%t,\ \%l/%L\ %P

set rtp+=~/.vim/bundle/Vundle.vim
set splitbelow
set splitright

set shiftwidth=4
set expandtab

call vundle#begin()

Plugin 'dense-analysis/ale'
Plugin 'elixir-editors/vim-elixir'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'mattn/emmet-vim'
Plugin 'mhartington/nvim-typescript'
Plugin 'Raimondi/delimitMate'
Plugin 'sainnhe/edge'
Plugin 'scrooloose/nerdtree'
Plugin 'sheerun/vim-polyglot'
Plugin 'Shougo/deoplete.nvim'
Plugin 'slashmili/alchemist.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'VundleVim/Vundle.vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'

call vundle#end()            " required
filetype plugin indent on    " required

if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <M-[> <Esc>
endif

nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>

nnoremap <M-h> :tabprev<cr>
nnoremap <M-l> :tabnext<cr>

nnoremap <leader>f :FZF<CR>
nnoremap <leader>d :ALEGoToDefinition<CR>
nnoremap <leader>h :ALEHover<CR>
nnoremap <leader>r :ALEFindReferences<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <C-n> :NERDTreeToggle<CR>

vnoremap <leader>j !python -m json.tool<CR>
vnoremap <leader>x !xmllint --format -<CR>

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

let g:ale_elixir_elixir_ls_release = '/home/nikola/git/elixir-ls/rel'


let g:ale_linters = {
\   'xml': ['xmllint'],
\   'elixir': ['elixir-ls'],
\   'typescript': ['tslint', 'prettier', 'tsserver'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'xml': ['xmllint'],
\   'typescript': ['tslint', 'prettier'],
\   'html': ['prettier'],
\   'elixir': ['mix_format'],
\}

call deoplete#custom#option('sources', {
\ '_': ['ale'],
\})

let g:ale_fix_on_save = 1
let g:ale_set_balloons = 1
let g:ale_completion_tsserver_autoimport = 1

set omnifunc=ale#completion#OmniFunc

let g:deoplete#enable_at_startup = 1
