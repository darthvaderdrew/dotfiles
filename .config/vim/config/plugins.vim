" Gruvbox
colorscheme gruvbox

" Lightline
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'tabline': {
      \   'left': [['buffers']],
      \   'right': []
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ }
      \ }

" Undotree
let g:undotree_SetFocusWhenToggle = 1

nnoremap <silent> <leader>u :UndotreeToggle<CR>
