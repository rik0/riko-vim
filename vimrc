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

