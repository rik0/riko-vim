call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/syntastic' " http://vimawesome.com/plugin/syntastic
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'scrooloose/nerdcommenter'
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle' }
Plug 'godlygeek/tabular'
" Plug 'ervandew/supertab'
Plug 'airblade/vim-gitgutter' " http://vimawesome.com/plugin/vim-gitgutter
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'kien/ctrlp.vim' " http://vimawesome.com/plugin/ctrlp-vim-state-of-grace
"Plug 'Valloric/YouCompleteMe' "http://vimawesome.com/plugin/youcompleteme
" Plug 'Shougo/neocomplcache.vim' " http://vimawesome.com/plugin/neocomplcache
Plug 'othree/html5.vim', { 'for': 'html' }
"http://vimawesome.com/plugin/neocomplete-vim
Plug 'fatih/vim-go' "http://vimawesome.com/plugin/vim-go-all-too-well
Plug 'mattn/gist-vim' "http://vimawesome.com/plugin/gist-vim
Plug 'plasticboy/vim-markdown', { 'for': 'mkd' } " http://vimawesome.com/plugin/markdown-syntax
" Not necessary: YCM should already take care of jedi
Plug 'davidhalter/jedi-vim', { 'for': 'python' } " http://vimawesome.com/plugin/jedi-vim
Plug 'nvie/vim-flake8', { 'for': 'python' } " http://vimawesome.com/plugin/vim-flake8
Plug 'klen/python-mode' " http://vimawesome.com/plugin/python-mode
Plug 'alfredodeza/coveragepy.vim'
Plug 'Bling/vim-airline' " http://vimawesome.com/plugin/vim-airline
Plug 'ntpeters/vim-better-whitespace' " github.com/ntpeters/vim-better-whitespace
Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }
Plug 'awk-support.vim'
Plug 'bash-support.vim'
Plug 'majutsushi/tagbar'
Plug 'vim-ruby/vim-ruby'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
" Java...
Plug 'SirVer/ultisnips'
Plug 'Yggdroot/indentLine'
Plug 'ervandew/eclim' ", {'for': 'java'}


call plug#end()


syntax on
filetype plugin indent on
filetype plugin on

set number

set tabstop=4
set shiftwidth=4
set softtabstop=4
set wrap
set textwidth=79
set formatoptions=lv
set colorcolumn=80
set smartindent
set expandtab
set mouse=ar

set pastetoggle=<F2>
set ignorecase

let g:is_posix = 1

" Misc stuff
set nofoldenable

" NerdTree stuff
"autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if (argc() == 0 && !exists("s:std_in")) | NERDTree| endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


" ctrl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc     " MacOSX/Linux

" markdown
let g:vim_markdown_folding_disabled=1

" tagbar
nmap <leader>T :TagbarToggle<CR>

" markdown
let vim_markdown_preview_github=1
let vim_markdown_preview_toggle=2


" Go
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType go nmap <Leader>cv <Plug>(go-coverage)

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)

let g:go_fmt_command = "goimports"

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

"let g:go_list_type = "quickfix"


" Rust
set hidden
let g:racer_cmd = "/Users/enrico/.cargo/bin/racer"
let g:racer_experimental_completer = 1

au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

" Airline
let g:airline#extensions#tabline#enabled = 1

" Python JEDI
au FileType python nmap <Leader>cv :Coveragepy refresh<CR>
let g:pymode_virtualenv=1
let g:pymode_rope=0

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:syntastic_aggregate_errors = 1

"pymode + rope
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_completion = 1


" Tagbar
nmap <Leader>T :TagbarToggle<CR>

" better whitespace
autocmd FileType python,java,json,xml,html,c,cpp,go,perl,sh autocmd BufWritePre <buffer> StripWhitespace
autocmd FileType python setlocal nosmartindent
autocmd FileType go autocmd BufWritePre,BufRead  <buffer> SyntasticCheck

" shell
au BufRead,BufNewFile *bash* let g:is_bash=1
au BufRead,BufNewFile *bash* setf sh
" use to override: # vim:let g:is_bash=1:set filetype=sh:
nmap <silent> <leader>b :let g:is_bash=1<cr> :setf sh<cr> 

"Ultisnips
"" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" IndentLine
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'

" Eclim
let g:airline#extensions#eclim#enabled = 1

" Misc stuff
" easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

" buffer stuff
noremap <C-b>l :bn<CR>
noremap <C-b>j :bn<CR>
noremap <C-b>k :bp<CR>
noremap <C-b>h :bp<CR>

" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
" It's useful to show the buffer number in the status line.
"set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P


" allow toggling between local and default mode
function! TabToggle()
  if &expandtab
    set shiftwidth=8
    set softtabstop=0
    set noexpandtab
  else
    set shiftwidth=4
    set softtabstop=4
    set expandtab
  endif
endfunction
"nmap <F9> mz:execute TabToggle()<CR>'z
