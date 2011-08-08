"try
"  source $REAL_HOME/.vimrc
"catch /E484/
"endtry
syntax on
set tabstop=4
set shiftwidth=4
set listchars=tab:.\ ,trail:_
set list
set smartindent
set expandtab

set nofoldenable



set hidden
set ruler
set title

set nocp
filetype plugin on
map <C-L> :!/usr/local/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>

set tags=~/.vim/stdtags,tags,.tags,../tags

autocmd InsertLeave * if pumvisible() == 0|pclose|endif

if has("autocmd")
" When editing a file, always jump to the last cursor position
"   autocmd BufReadPost *
"     \ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal g'\"" |
\ endif
endif
"This is necessary to allow pasting from outside vim. It turns off
"auto stuff.
""You can tell you are in paste mode when the ruler is not visible
set pastetoggle=<F2>
"Usually annoys me
"set nowrap
""Usually I don't care about case when searching
set ignorecase
"Only ignore case when we type lower case when searching
"set smartcase
""I hate noise. The t_vb bit removes any delay also
set visualbell t_vb=
"Show menu with possible tab completions
"set wildmenu
""Ignore these files when completing names and in Explorer
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.pyo,CMakeFiles

if v:version >= 700 && has("gui_running")
    "The following are a bit slow
    "for me to enable by default
    set cursorline   "highlight current line
    "set cursorcolumn "highlight current column
endif

"Syntax highlighting if appropriate
if &t_Co > 2 || has("gui_running")
    syntax on
    set nohlsearch
    set incsearch "For fast terminals can highlight search string as you type
endif

if &diff
    "I'm only interested in diff colours
    syntax off
endif

"syntax highlight shell scripts as per POSIX,
"not the original Bourne shell which very few use
let g:is_posix = 1

"flag problematic whitespace (trailing and spaces before tabs)
"Note you get the same by doing let c_space_errors=1 but
"this rule really applys to everything.
highlight RedundantSpaces term=standout ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/ "\ze sets end of match so only spaces highlighted
"use :set list! to toggle visible whitespace on/off
set listchars=tab:>-,trail:.,extends:>

augroup Python
    "See $VIMRUNTIME/ftplugin/python.vim
    au!
    "smart indent really only for C like languages
    "See $VIMRUNTIME/indent/python.vim
    au FileType python set nosmartindent autoindent
    " Allow gf command to open files in $PYTHONPATH
    au FileType python let &path = &path . "," . substitute($PYTHONPATH, ';', ',', 'g')
    if v:version >= 700
        "See $VIMRUNTIME/autoload/pythoncomplete.vim
        "<C-x><C-o> to autocomplete
        au FileType python set omnifunc=pythoncomplete#Complete
        "Don't show docs in preview window
        au FileType python set completeopt-=preview
    endif
augroup END

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
let g:tex_indent_items = 1
let g:Tex_ViewRule_pdf = 'Skim'


let clj_highlight_builtins = 1

"set statusline+=%(%{Tlist_Get_Tagname_By_Line()}%), " Function name
"
"
"
set ofu=syntaxcomplete#Complete

map <C-t> :TlistToggle<CR>
