set nocompatible              " be iMproved, required
filetype off                  " required
set laststatus=2

" tab -> 4 spaces
set tabstop=4 "show existing tab with 4 spaces width
set softtabstop=4
set shiftwidth=4 "when indenting with > use 1 space
set expandtab "on pressing tab, insert 4 spaces

set scrolloff=5 "minimal number of screen lines to keep above and below the cursor.
set ttimeoutlen=50  "make Esc work faster
set autoread "reload unchanged buffers when file changed outside vim
set cursorline "higlight current line

set nocindent
set nosmartindent
set noautoindent "disable auto-indent

set number "add line numbers
set nowrap "don't wrap long lines

set hlsearch "highlight search results

set clipboard+=unnamedplus

" toggle auto-indentation on paste
set pastetoggle=<F4>

" mouse support
set mouse=a

" disable autocomment when adding a new line after a comment
set formatoptions-=cro

" for Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin("~/.vim/bundle")
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " fs browser
Plugin 'preservim/nerdcommenter'
" Plugin 'easymotion/vim-easymotion'
Plugin 'morhetz/gruvbox' " color style
Plugin 'airblade/vim-gitgutter' " shows git diff along the lines
Plugin 'vim-airline/vim-airline' " bottom line
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sjl/gundo.vim' " undo tree
Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Go-lang support
"Plugin 'majutsushi/tagbar' " tags navigation
"Plugin 'terryma/vim-multiple-cursors'
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

" Open the project tree and expose current file in the nerdtree with Ctrl-\
nnoremap <silent> <C-\> :NERDTreeFind<CR>

" Jump to next split
nnoremap <Leader>w <C-w>w

"\c<space> - toggle comment
"\cc - comment
"Ctrl+v - block selection

" Tagbar
"nmap <F8> :TagbarToggle<CR>

" Custom shortcuts
inoremap <C-s> <esc>:w<cr>                 " save files
nnoremap <C-s> :w<cr>
inoremap <C-d> <esc>:wq!<cr>               " save and exit
nnoremap <C-d> :wq!<cr>
inoremap <C-q> <esc>:qa!<cr>               " quit discarding changes
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

