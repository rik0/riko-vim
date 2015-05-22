call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
" Plug 'scrooloose/syntastic' " http://vimawesome.com/plugin/syntastic
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'godlygeek/tabular'
" Plug 'ervandew/supertab'
Plug 'airblade/vim-gitgutter' " http://vimawesome.com/plugin/vim-gitgutter
Plug 'kien/ctrlp.vim' " http://vimawesome.com/plugin/ctrlp-vim-state-of-grace
Plug 'Valloric/YouCompleteMe' "http://vimawesome.com/plugin/youcompleteme
" Plug 'Shougo/neocomplcache.vim' " http://vimawesome.com/plugin/neocomplcache
Plug 'othree/html5.vim'
Plug 'plasticboy/vim-markdown' " http://vimawesome.com/plugin/markdown-syntax
"http://vimawesome.com/plugin/neocomplete-vim
Plug 'fatih/vim-go' "http://vimawesome.com/plugin/vim-go-all-too-well
Plug 'mattn/gist-vim' "http://vimawesome.com/plugin/gist-vim
Plug 'plasticboy/vim-markdown', { 'for': 'mkd' }


call plug#end()

syntax on
filetype plugin on

" Misc stuff
set nofoldenable

" NerdTree stuff
"autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


" ctrl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc     " MacOSX/Linux

" markdown
let g:vim_markdown_folding_disabled=1


" Go
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

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

" Misc stuff
" easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

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

