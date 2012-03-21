
" for a certain python plugin
let python_highlight_space_errors = 0


set expandtab shiftwidth=4 ts=4 softtabstop=4 autoindent

" when 'gq' is used to format text, this is how wide it will be formatted to
set textwidth=130 " beyond settings
set formatoptions=tcqr


command! Pyflakes :call Pyflakes()
function! Pyflakes()
    setlocal makeprg=pyflakes
    setlocal efm="%f:%l"
    make "%"
    cwindow
endfunction

command! Pylint :call Pylint()
function! Pylint()
    setlocal makeprg=(echo\ '[%]';\ pylint\ %)
    setlocal efm=%+P[%f],%t:\ %#%l:%m
    make
    cwindow
endfunction

command! Pep8 :call Pep8()
function! Pep8()
    setlocal makeprg=../../externals/pep8.py
    setlocal efm="%f:%l:%c"
    make "%"
    cwindow
endfunction
