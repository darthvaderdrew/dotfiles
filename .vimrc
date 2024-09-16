" Plugins
call plug#begin()

" List your plugins here
Plug 'tpope/vim-sensible'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'

call plug#end()

" Keymaps
let mapleader = "\<Space>"

nnoremap <leader>b :ls<CR>:b

" Behavior
set nocompatible
set autoread
set backspace=indent,eol,start
set scrolloff=8
set mouse=a

" Tabbing
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set expandtab
set autoindent
set smartindent

" Searching
set nohlsearch
set incsearch
set ignorecase
set smartcase

" Directories
set undofile
set undodir=~/.vim/undo/
set dir=~/.vim/swap/

" Appearance
colorscheme gruvbox
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'right': [['lineinfo'], ['percent'], ['filetype']],
      \ },
      \ }
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[3 q"
let &t_EI = "\<Esc>[2 q"
set termguicolors
set noshowmode
set showcmd
set ruler
" set cursorline
set noshowmatch
set number
set relativenumber
set wildmenu
set wildmode=list:longest
syntax on
highlight Normal guibg=NONE ctermbg=NONE
highlight SignColumn guibg=NONE ctermbg=NONE
highlight ExtraWhiteSpace ctermbg=red guibg=red
match ExtraWhiteSpace /\s\+$/

filetype plugin indent on
