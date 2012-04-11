filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" work with windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" tasklist de ambiguate
map <leader>td <Plug>TaskList

"gundo
map <leader>g :GundoToggle<CR>

" syntax stuff
syntax on                           " syntax highlighing
filetype on                          " try to detect filetypes
filetype plugin indent on    " enable loading indent file for filetype

let g:pyflakes_use_quickfix = 0

let g:pep8_map='<leader>8'


"" PYTHON
au FileType python set omnifunc=pythoncomplete#Complete

au FileType python set nosmartindent autoindent
au FileType python let &path = &path . "," . substitute($PYTHONPATH, ';', ',', 'g')



let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

"rope
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

" django
map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>

"pytest
" Execute the tests
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
" cycle through test errors
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>

" virtualenv
" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF


"" nerdtree
map <leader>n :NERDTreeToggle<CR>

" ack (fuzzy search)
nmap <leader>a <Esc>:Ack!

set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P


"" older stuff
set tabstop=4
set shiftwidth=4
set tw=72
set list
set smartindent
set expandtab

set nofoldenable

set hidden
set ruler
set title

set nocp

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
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.pyo,CMakeFiles,*.beam,.hg

if v:version >= 700 && has("gui_running")
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


if version >= 703
    set undofile
    set undodir=$HOME/.vim-undos/
endif

" Setting up omnicpp
" " Enable omni
" """"""""""""""""""""""
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

noremap <F5> :make<cr>

set shellslash

"" LATEX
let g:tex_flavor='latex'
let g:tex_indent_items = 1

let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf,dvi'

let g:Tex_CompileRule_dvi = 'latex --interaction=nonstopmode $*'
let g:Tex_CompileRule_ps = 'dvips -Pwww -o $*.ps $*.dvi'
let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 --interaction=nonstopmode $*'

let g:Tex_CompileRule_pspdf = 'ps2pdf $*.ps'
let g:Tex_CompileRule_dvipdf = 'dvipdfm $*.dvi'
if has('macunix')
    let g:Tex_ViewRule_dvi = 'texniscope'
    let g:Tex_ViewRule_ps = 'Preview'
    let g:Tex_ViewRule_pdf = 'Skim'
else

endif
let g:Tex_FormatDependency_pdf  = 'pdf'
let g:Tex_FormatDependency_ps  = 'dvi,ps'
let g:Tex_FormatDependency_pspdf = 'dvi,ps,pspdf'
let g:Tex_FormatDependency_dvipdf = 'dvi,dvipdf'

let g:Tex_BibtexFlavor = 'bibtex'


" let g:Tex_IgnoredWarnings ='
"       \"Underfull\n".
"       \"Overfull\n".
"       \"specifier changed to\n".
"       \"You have requested\n".
"       \"Missing number, treated as zero.\n".
"       \"There were undefined references\n".
"       \"Citation %.%# undefined\n".
"       \"\oval, \circle, or \line size unavailable\n"'

"" CLOJURE
let vimclojure#HighlightBuiltins = 1
"set statusline+=%(%{Tlist_Get_Tagname_By_Line()}%), " Function name
" set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}

" erlang
" " ERLANG STUFF
let g:erlangHighlightBif=1
let g:erlangManPath="/usr/local/Cellar/erlang/R14B03/share/man"

" Gist plugin
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

colorscheme desert


" let g:ShowTrailingWhitespace_FilterFunc = ''
" let g:ShowTrailingWhitespace_FilterFunc = function('MyFunc')

let g:DeleteTrailingWhitespace_Action = 'ask'
let g:DeleteTrailingWhitespace_ChoiceAffectsHighlighting = 0


highlight ShowTrailingWhitespace term=standout ctermbg=Red guibg=Red


"flag problematic whitespace (trailing and spaces before tabs)
"Note you get the same by doing let c_space_errors=1 but
"this rule really applys to everything.
" highlight RedundantSpaces term=standout ctermbg=red guibg=red
" match RedundantSpaces /\s\+$\| \+\ze\t/ "\ze sets end of match so only spaces highlighted
"use :set list! to toggle visible whitespace on/off
set listchars=tab:>-,trail:.,extends:>

if has("gui_running")
    set guifont=Consolas:h16,Menlo:h16,"DejaVu Sans Mono":h14
    set columns=80
    set lines=40
    set antialias
    set number
    set guioptions-=T
end
o
