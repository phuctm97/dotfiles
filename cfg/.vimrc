" Init vim-plug.
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'

" Apply vim-plug.
call plug#end()

" Configure vim.
set number
set relativenumber

" Configure theme.
syntax on
let g:onedark_termcolors=256
let g:airline_theme='onedark'
colorscheme onedark
