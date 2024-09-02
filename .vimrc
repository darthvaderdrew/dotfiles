" Behavior
set nocompatible
set autoread
set backspace=indent,eol,start
set scrolloff=8
set mouse=a

" Tabbing
set tabstop=4
set softtabstop=4
set smarttab
set shiftwidth=4
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

" Autocommands
" autocmd VimEnter * silent !find ~/.vim/undo -type f -mtime +31 -delete
