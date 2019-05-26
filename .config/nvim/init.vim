set nocompatible              " be iMproved, required
filetype off                  " required
set laststatus=2

" tab -> 4 spaces
set tabstop=4 "show existing tab with 4 spaces width
set shiftwidth=4 "when indenting with > use 4 spaces
set expandtab "on pressing tab, insert 4 spaces

" toggle auto-indentation on paste
set pastetoggle=<F4>

"
call plug#begin("~/.vim/plugged")
Plug 'itchyny/lightline.vim' " bottom line
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " fs browser
Plug 'pboettch/vim-cmake-syntax'
Plug 'easymotion/vim-easymotion'
Plug 'morhetz/gruvbox' " color style
call plug#end()
filetype plugin indent on

colorscheme gruvbox
set background=dark
set termguicolors

" Ctrl+N - toggle NerdTree
map <C-n> :NERDTreeToggle<CR>

