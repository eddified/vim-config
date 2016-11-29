" http://rtlechow.com/2008/12/15/256-colors-in-vim-inside-screen-in-an-iterm-on-os-x-leopard/
" "apparently “set t_Co=256” must appear before any syntax and color settings"
set t_Co=256

" An example for a vimrc file.
"
" Maintainer:   Bram Moolenaar <Bram@vim.org>
" Last change:  2002 Sep 19
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"         for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"       for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"if has("vms")
"  set nobackup     " do not keep a backup file, use versions instead
"else
"  set nobackup     " keep a backup file
"endif

set showcmd     " display incomplete commands




" eddie manually added

" whether to ignore case in searches, qualified by smartcase setting
set noignorecase
" whether to ignore case in searches if entire search pattern is lowercase,
" don't ignore case otherwise.
set nosmartcase


" set colorscheme to default
colorscheme default

:syn on
"highlight Comment ctermfg=blue " default is darkblue, but it's too hard to see

" fix search highlight
hi Search cterm=reverse term=NONE ctermfg=11 ctermbg=NONE

" use pathogen plugin ( https://github.com/tpope/vim-pathogen )
" which is requird for syntastic and jedi-vim
" https://github.com/scrooloose/syntastic )
execute pathogen#infect()

" Tab settings
set shiftwidth=4 ts=4 softtabstop=4 autoindent noexpandtab

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

set history=200     " keep this many lines of command line history
set ruler       " show the cursor position all the time
set list
set incsearch
set hlsearch
set wildmode=longest,list
set laststatus=2
set number
"set scrolloff=2

" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" purpose: to write a file that i don't have perms to write
" to use-- :SudoW
command! -bar -nargs=0 SudoW :silent exe "write !sudo tee % >/dev/null" | silent edit!

" Allow you to switch between splits much more smoothly --
" just press <C-J>  to open and maximize the split below the current one and
" <C-K> to open and maximize the split above the current one.
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

" Allows splits to reduce their size to a single line (which includes the filename and position)
set winminheight=0
set noequalalways " :help equalalways

" Pressing F2 turns off line number, list and foldcolumn for easy copying. press again to toggle them back on (save foldcolumn, which stays off)
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>:set list!<CR>

" Press F3 to toggle paste mode
nnoremap <F3> :set paste!<CR>:set paste?<CR>

" highlight lines over 79 chars long
"highlight OverLength ctermbg=darkblue guibg=#592929
"match OverLength /\%80v.\+/ " first window
" autocmd WinEnter match OverLength /\%80v.\+/ " subsequent windows " can't get this to work
"
" autocmd FileType python compiler pylint -- make pylint the default 'compiler' for python (compile via make)

" remap ` to ' and vice versa
nnoremap ' `
nnoremap ` '

" CTRL+\ for viewing tags in new window
"map <C-\> :sp<CR><C-]><C-w>_



" fix meta-keys which generate <Esc>a .. <Esc>z " doesn't work well
"let c='a'
"while c <= 'z'
"  exec "set <M-".toupper(c).">=\e".c
"  exec "imap \e".c." <M-".toupper(c).">"
"  let c = nr2char(1+char2nr(c))
"endw

" allow CTRL+H to insert a carriage return after end of line
"nnoremap <C-H> A<CR><Esc>k$

" press CTRL+H for prev tab, CTRL+L for next tab
map <C-H> :tabp<cr>
nnoremap <C-H> A<CR><Esc>k$

"set statusline=[%n]\ %f\ %(\(%MMODIFIED%M%R%H)%)\ Pos=<l=%l\,c=%c%V,b=%o>\ %P\ ASCII=%b\ HEX=%B

" fold xml files by syntax .. to use folding column, :set fdc=1
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax


" enable vim to load filetype-specific plugins
filetype plugin on
filetype indent on

" use ctags file TAGS
set tags=TAGS


" syntastic options
let g:syntastic_aggregate_errors = 1 " when 1, all checkers that apply are run in turn, and all errors found are aggregated in a single list
let g:syntastic_check_on_wq = 0 " when 0, don't run checkers on file write - doesn't seem to work

let g:syntastic_mode_map = { "mode": "passive" }
let g:syntastic_always_populate_loc_list = 1 " Enable this option to tell syntastic to always stick any detected errors into the location-list
let g:syntastic_auto_loc_list = 1 " When set to 1 the error window will be automatically opened when errors are detected, and closed when none are detected


set mouse=n " enable mouse
set ttymouse=xterm2 " needed for full mouse capability when inside tmux
