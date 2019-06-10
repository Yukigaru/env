set nocompatible              " be iMproved, required
filetype off                  " required
set laststatus=2

" tab -> 4 spaces
set tabstop=4 "show existing tab with 4 spaces width
set shiftwidth=4 "when indenting with > use 4 spaces
set expandtab "on pressing tab, insert 4 spaces

" toggle auto-indentation on paste
set pastetoggle=<F4>

" mouse support
set mouse=a

"
call plug#begin("~/.vim/plugged")
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " fs browser
Plug 'easymotion/vim-easymotion'
Plug 'morhetz/gruvbox' " color style
Plug 'airblade/vim-gitgutter' " shows git diff along the lines
Plug 'vim-airline/vim-airline' " bottom line
Plug 'vim-airline/vim-airline-themes'
Plug 'sjl/gundo.vim' " undo tree
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Go-lang support
Plug 'majutsushi/tagbar' " tags navigation
Plug 'terryma/vim-multiple-cursors'
call plug#end()
filetype plugin indent on

colorscheme gruvbox
set background=dark
set termguicolors

" Airline
let g:airline_theme='base16_monokai'

" Undo tree
nnoremap <F5> :GundoToggle<CR>

" Ctrl+N - toggle NerdTree
map <C-n> :NERDTreeToggle<CR>

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Custom shortcuts
inoremap <C-s> <esc>:w<cr>                 " save files
nnoremap <C-s> :w<cr>
inoremap <C-d> <esc>:wq!<cr>               " save and exit
nnoremap <C-d> :wq!<cr>
inoremap <C-q> <esc>:qa!<cr>               " quit discarding changes
nnoremap <C-q> :qa!<cr>
