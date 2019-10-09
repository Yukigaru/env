set nocompatible              " be iMproved, required
filetype off                  " required
set laststatus=2

" tab -> 4 spaces
set tabstop=4 "show existing tab with 4 spaces width
set shiftwidth=1 "when indenting with > use 1 space
set expandtab "on pressing tab, insert 4 spaces

set number "add line numbers

set nowrap "don't wrap long lines

set hlsearch "highlight search results

" toggle auto-indentation on paste
set pastetoggle=<F4>

" mouse support
set mouse=a

" for Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin("~/.vim/bundle")
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " fs browser
Plugin 'easymotion/vim-easymotion'
Plugin 'morhetz/gruvbox' " color style
Plugin 'airblade/vim-gitgutter' " shows git diff along the lines
Plugin 'vim-airline/vim-airline' " bottom line
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sjl/gundo.vim' " undo tree
Plugin 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Go-lang support
" Plugin 'majutsushi/tagbar' " tags navigation
Plugin 'terryma/vim-multiple-cursors'
call vundle#end()
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

" Swap/reorder lines
:nnoremap <C-S-Up> <Up>"add"ap<Up>
:nnoremap <C-S-Down> "add"ap
