set nocompatible              " be iMproved, required
filetype off                  " required
set laststatus=2

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'pboettch/vim-cmake-syntax'

call vundle#end()
filetype plugin indent on

" Ctrl+N - toggle NerdTree
map <C-n> :NERDTreeToggle<CR>

