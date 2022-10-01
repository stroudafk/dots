" .vimrc 
" mostly for purposes of school linux server
set nu
set ts=2 sw=2
set cursorline
set expandtab
set statusline=%f%m%r%h%w\ [%Y]\ [0x%02.2B]%<\ %F%4v,%4l\ %3p%%\ of\ %L\ lines
syntax on

call plug#begin()

Plug 'https://github.com/preservim/nerdtree', { 'on': 'NERDTreeToggle' }
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'

call plug#end()

colorscheme gruvbox
set bg=dark
" let g:airline_theme='gruvbox'
