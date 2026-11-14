" Highlight trailing whitespace
function! s:SetWhitespaceHighlight() abort
    highlight TrailingWhitespace ctermbg=red guibg=#cc241d
endfunction

function! s:HighlightTrailingWhitespace() abort
    if &buftype !=# ''
        return
    endif

    for l:match in getmatches()
        if l:match.group ==# 'TrailingWhitespace'
            return
        endif
    endfor

    call matchadd('TrailingWhitespace', '\s\+$')
endfunction

call s:SetWhitespaceHighlight()

augroup UserConfig
    autocmd!
    autocmd ColorScheme * call <SID>SetWhitespaceHighlight()
    autocmd BufWinEnter,WinEnter * call <SID>HighlightTrailingWhitespace()
    autocmd FileType * setlocal formatoptions-=r formatoptions-=o
augroup END

" Remove trailing whitespace
function! s:TrimWhitespace() abort
    let l:view = winsaveview()
    keeppatterns keepjumps %s/\s\+$//e
    call winrestview(l:view)
endfunction

command! TrimWhitespace call s:TrimWhitespace()
