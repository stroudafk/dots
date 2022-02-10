set termguicolors
syntax on
set tabstop=2
set shiftwidth=0
set expandtab
set number
set title
set statusline=%f%m%r%h%w\ [%Y]\ [0x%02.2B]%<\ %F%4v,%4l\ %3p%%\ of\ %L\ lines
set laststatus=2

"integrated terminal config
" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
"NERDTree keybindings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeShowHidden =1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''

call plug#begin('~/.vim/plugged')
Plug 'sonph/onehalf', { 'rtp': 'vim'}
Plug 'morhetz/gruvbox'
Plug 'HerringtonDarkholme/yats.vim' "TS Syntax
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'jacoborus/tender.vim'
call plug#end()

set hidden

colorscheme gruvbox
let g:airline_theme='gruvbox'
