""" vim-plug.

" Init.
call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nicwest/vim-http'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'

" Apply.
call plug#end()

" ---

""" Configure vim.

" Enable true color and syntax highlighting.
set termguicolors
syntax on

" Enable relative number.
set number
set relativenumber

" Use system's clipboard by default.
set clipboard=unnamedplus

" ---

""" Configure theme.
set background=dark
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'
silent! colorscheme gruvbox
