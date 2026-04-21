set nocompatible
filetype off

" tab -> 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=2
set expandtab

set scrolloff=5
set ttimeoutlen=50
set autoread
set cursorline

set nocindent
set nosmartindent
set noautoindent

set nowrap
set whichwrap+=<,>,h,l,[,]

"backspace to always remove only 1 character, not more
imap <BS> <Left><Del>

set hlsearch
set ttyfast
set mouse=a
set hidden
set updatetime=300
set shortmess+=c
set signcolumn=yes

" disable autocomment when adding a new line after a comment
set formatoptions-=cro

" use nvim's built-in clipboard (OSC 52 over SSH in nvim 0.10+, or system on desktop)
set clipboard=unnamedplus

" for Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin("~/.vim/bundle")
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'preservim/nerdcommenter'
Plugin 'morhetz/gruvbox'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sjl/gundo.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plugin 'nestorsalceda/vim-strip-trailing-whitespaces'
call vundle#end()
filetype plugin indent on

colorscheme gruvbox
set background=dark
set notermguicolors

" Airline
let g:airline_theme='base16_monokai'

" Undo tree
nnoremap <F5> :GundoToggle<CR>

" Ctrl+N - toggle NerdTree
map <C-n> :NERDTreeToggle<CR>

" Open the project tree and expose current file in the nerdtree with Ctrl-\
nnoremap <silent> <C-\> :NERDTreeFind<CR>

" Jump to next split
nnoremap <Leader>w <C-w>w

"\c<space> - toggle comment
"\cc - comment
"Ctrl+v - block selection

" Custom shortcuts
inoremap <C-s> <esc>:w<cr>
nnoremap <C-s> :w<cr>
inoremap <C-d> <esc>:wq!<cr>
nnoremap <C-d> :wq!<cr>
inoremap <C-q> <esc>:qa!<cr>
nnoremap <C-q> :qa!<cr>

" Swap/reorder lines
nnoremap <C-S-Up> <Up>"add"ap<Up>
nnoremap <C-S-Down> "add"ap

" Comfortable Page Up/Down behavior (go until start/end of file)
nnoremap <silent> <PageUp> <C-U><C-U>
vnoremap <silent> <PageUp> <C-U><C-U>
inoremap <silent> <PageUp> <C-\><C-O><C-U><C-\><C-O><C-U>

nnoremap <silent> <PageDown> <C-D><C-D>
vnoremap <silent> <PageDown> <C-D><C-D>
inoremap <silent> <PageDown> <C-\><C-O><C-D><C-\><C-O><C-D>
