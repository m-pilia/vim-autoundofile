" max_len (int)             Maximum length of the undo file name.
" blacklist (list[string])  List of file name patterns for which undofile is disabled.
" verbose (bool)            If true, echo a message when undofile is disabled.
function! autoundofile#Setlocal(max_len, blacklist, verbose) abort
    let l:file_name = expand('%:p')
    let l:undo_file_name = fnamemodify(undofile(expand('%')), ':t')

    " Check for file name length
    let l:no_undofile = strlen(l:undo_file_name) > a:max_len

    " Check for patterns in blacklist
    if !l:no_undofile
        for l:pattern in a:blacklist
            if match(l:file_name, l:pattern) != -1
                let l:no_undofile = 1
                break
            endif
        endfor
    endif

    if l:no_undofile
        setlocal noundofile
        if a:verbose
            echom 'Warning: undo file not in use'
        endif
    else
        setlocal undofile
    endif
endfunction
