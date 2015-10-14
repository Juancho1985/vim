set nocompatible
syntax on
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set number
set showmode
"set spell
set cursorline
colorscheme gvimStyle
set guifont=Monaco
set smarttab
set noeb vb t_vb=

map <C-t> :tabnew<CR>
map <C-k> :tabonly<CR>
map <C-e> :tabclose<CR>


nnoremap <S-q> 1gt
nnoremap <S-w> 2gt
nnoremap <S-e> 3gt
nnoremap <S-r> 4gt
nnoremap <S-t> 5gt
nnoremap <S-y> 6gt
nnoremap <S-u> 7gt
nnoremap <S-i> 8gt
nnoremap <S-o> 9gt
nnoremap <S-p> 10gt
nnoremap <S-h> gT
nnoremap <S-l> gt

nnoremap <F4> :CommandT<CR>
nnoremap <F6> :NERDTree<CR>
nnoremap <F7> :NERDTreeClose<CR>
nnoremap <F5> :SyntasticCheck<CR>
nnoremap <F8> :Bookmark

setlocal makeprg=jslint\ %
setlocal errorformat=%-P%f,
                     \%-G/*jslint\ %.%#*/,
                     \%*[\ ]%n\ %l\\,%c:\ %m,
                     \%-G\ \ \ \ %.%#,
                     \%-GNo\ errors\ found.,
                     \%-Q

if has('statusline')
  set laststatus=2
  " Broken down into easily includeable segments
  set statusline=%<%f\ "Filename
  set statusline+=%w%h%m%r " Options
  set statusline+=%{fugitive#statusline()} " Git Hotness
  set statusline+=\ [%{&ff}/%Y/%{&encoding}] " fileformat, filetype and  encoding
  set statusline+=\ [%{getcwd()}] " current dir
  set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
  set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info
endif

"Copy paste for Vim
vmap <C-c> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
nmap <C-v> :call setreg("\"", system("xclip -o -selection clipboard"))<CR>p

"Search and replace
vmap <F9> :s/foo/bar/g<CR>

"SnipMate
let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['javascript'] = 'javascript'

set statusline+=set statusline=%<\ %n:%f\ %m%r%y%{SyntasticStatuslineFlag()}%=line:\ %l\ of\ %L,\ col:\ %c%V,\  

let g:syntastic_enable_signs=1
let g:syntastic_loc_list_height=5
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_highlighting=1
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_mode_map = { 'mode': 'active',
  \ 'active_filetypes': ['javascript','coffe','html','css'],
  \ 'passive_filetypes':[]}

let g:vim_json_syntax_conceal=0

"Autocomplete, TODO: i have to add smarter one
:imap <C-Space> <c-x><c-o>

run SyntasticEnable javascript

let g:CommandTCancelMap='<C-x>'

filetype plugin indent on
filetype on


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install bundles
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" The following are examples of different formats supported.
" Keep bundle commands between here and filetype plugin indent on.
" scripts on GitHub repos
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-rails.git'
Bundle 'groenewege/vim-less'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" scripts from http://vim-scripts.org/vim/scripts.html
Bundle 'L9'
Bundle 'FuzzyFinder'
" scripts not on GitHub
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'https://github.com/digitaltoad/vim-jade.git'
Bundle 'https://github.com/yegappan/grep'

" third party plugins downloaded
" git YMC you complete me
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'godlygeek/tabular'
Bundle 'elzr/vim-json'
filetype plugin indent on
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.

"See templates hbs, handlebars as html

au BufRead *.hbs set ft=html 
au! BufRead,BufNewFile *.json set ft=json

augroup json_autocmd
    autocmd!
    autocmd FileType json set autoindent
    autocmd FileType json set formatoptions=tcq2l
    autocmd FileType json set textwidth=78 shiftwidth=2
    autocmd FileType json set softtabstop=2 tabstop=8
    autocmd FileType json set expandtab
"    autocmd FileType json set foldmethod=syntax
augroup END
