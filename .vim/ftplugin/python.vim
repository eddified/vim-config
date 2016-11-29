
" for a certain python plugin
let python_highlight_space_errors = 0


" syntastic option
let g:syntastic_python_checkers = ['pep8', 'pylint', 'python']

set expandtab shiftwidth=4 ts=4 softtabstop=4 autoindent

" when 'gq' is used to format text, this is how wide it will be formatted to
set textwidth=0 " zero here means don't auto-wrap text
set formatoptions=tcqr
" set colorcolumn=80 " only works with vim 7.3, use it to keep text under 80 chars


command! Pyflakes :call Pyflakes()
function! Pyflakes()
    setlocal makeprg=pyflakes
    setlocal efm="%f:%l"
    make "%"
    cwindow
endfunction

command! MyPylint :call MyPylint()
function! MyPylint()
    setlocal makeprg=pylint
    " setlocal makeprg=(echo\ '[%]';\ pylint\ %)
    "setlocal efm="%f:%l"
    setlocal efm=%+P[%f],%t:\ %#%l:%m,%Z,%+IYour\ code%m,%Z,%-G%.%#
    make "%"
    cwindow
endfunction

command! Pep8 :call Pep8()
function! Pep8()
    setlocal makeprg=pep8
    setlocal efm="%f:%l:%c"
    make "%"
    cwindow
endfunction


" highlight lines over 79 chars long
highlight OverLength ctermbg=darkblue guibg=#592929
match OverLength /\%80v.\+/ " first window
" autocmd WinEnter match OverLength /\%80v.\+/ " subsequent windows " can't get this to work



let g:pylint_show_rate = 0 " Displaying code rate calculated by Pylint can be avoided by setting
let g:pylint_cwindow = 0 " Openning of QuickFix window can be disabled with
let g:pylint_onwrite = 0 " To disable calling Pylint every time a buffer is saved
