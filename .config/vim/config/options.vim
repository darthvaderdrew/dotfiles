" Editing
set confirm
set hidden
set scrolloff=4
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Search
set ignorecase
set smartcase
set nohlsearch
set wildmenu
set wildmode=list:longest

" Display
set termguicolors
set background=dark
set number
set relativenumber
set cursorline
set cursorlineopt=number
set wrap
set linebreak
set noshowmode
set showtabline=2

" Persistence
let s:state = expand('~/.local/state/vim')
call mkdir(s:state . '/undo', 'p')
call mkdir(s:state . '/swap', 'p')

set undofile
let &undodir = s:state . '/undo//'
let &directory = s:state . '/swap//'
let &viminfofile = s:state . '/viminfo'
let g:netrw_dirhistmax = 0

" Windows
set splitright
set splitbelow
