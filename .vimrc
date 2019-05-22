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
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'pboettch/vim-cmake-syntax'
Plugin 'easymotion/vim-easymotion'

call vundle#end()
filetype plugin indent on

" Ctrl+N - toggle NerdTree
map <C-n> :NERDTreeToggle<CR>

