set nocompatible              " be iMproved, required
filetype off                  " required
set laststatus=2

" tab -> 4 spaces
set tabstop=4 "show existing tab with 4 spaces width
set softtabstop=4
set shiftwidth=2 "when indenting with > use 2 spaces
set expandtab "on pressing tab, insert 4 spaces

set scrolloff=5 "minimal number of screen lines to keep above and below the cursor.
set ttimeoutlen=50  "make Esc work faster
set autoread "reload unchanged buffers when file changed outside vim
set cursorline "higlight current line

set nocindent
set nosmartindent
set noautoindent "disable auto-indent

"set number "add line numbers
set nowrap "don't wrap long lines

set whichwrap+=<,>,h,l,[,] "left-right wraps the cursor

"backspace to always remove only 1 character, not more
imap <BS> <Left><Del>

set hlsearch "highlight search results

" using the system clipboard
function! ClipboardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('xclip -o -selection clipboard')
endfunction

"vnoremap <silent> y y:call ClipboardYank()<cr>
"vnoremap <silent> d d:call ClipboardYank()<cr>
"nnoremap <silent> p :call ClipboardPaste()<cr>p

set ttyfast " faster redrawing

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
Plugin 'ctrlpvim/ctrlp.vim' " fuzzy finder
Plugin 'neoclide/coc.nvim', {'branch': 'release'} " auto-completion, gd - go-to definition
Plugin 'rhysd/vim-clang-format'
Plugin 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Go-lang support
Plugin 'nestorsalceda/vim-strip-trailing-whitespaces'
"Plugin 'terryma/vim-multiple-cursors'
call vundle#end()
filetype plugin indent on

colorscheme gruvbox
set background=dark
set notermguicolors " termguicolors enables 24-bit RGB color, but it doesn't work in mosh

" Coc
" TextEdit might fail if hidden is not set.
set hidden

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

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

nnoremap <C-f> :ClangFormat<cr>

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

" Coc
" go to definition
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"note: <leader> is \ by default
nmap <leader>rn <Plug>(coc-rename)
"nmap <leader>cf <Plug>(coc-fix-current)

"" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
