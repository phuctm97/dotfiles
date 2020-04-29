" Init vim-plug.
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'

" Apply vim-plug.
call plug#end()

" Configure vim.
set termguicolors
syntax on
set number
set relativenumber
set background=dark

" Configure theme.
let g:gruvbox_termcolors=16
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'
colorscheme gruvbox
