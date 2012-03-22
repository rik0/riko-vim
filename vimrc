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

