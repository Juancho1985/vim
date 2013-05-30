set nocompatible
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
syntax on
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set number
set showmode
set spell
set cursorline
colorscheme gvimStyle
set guifont=Monaco
set smarttab
set noeb vb t_vb=

map <C-t> :tabnew<CR>
map <C-r> :tabonly<CR>
map <C-e> :tabclose<CR>
map <C-h> :%s<CR>

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

let g:syntastic_mode_map={  'mode': 'active',
                          \ 'active_filetypes': ['javascript'],
                          \ 'passive_filetypes': []}
                        
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_highlighting=1
let g:syntastic_loc_list_height=5
let g:syntastic_quiet_warnings=0
let g:syntastic_javascript_checker='jshint'

"Copy paste for Vim
vmap <C-c> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
nmap <C-v> :call setreg("\"", system("xclip -o -selection clipboard"))<CR>p

"SnipMate
let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['javascript'] = 'javascript'

set statusline+=set statusline=%<\ %n:%f\ %m%r%y%{SyntasticStatuslineFlag()}%=line:\ %l\ of\ %L,\ col:\ %c%V,\  

let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_highlighting=1
let g:syntastic_quiet_warnings=0
let g:syntastic_javascript_checker = 'jshint'
let g:syntastic_mode_map = { 'mode': 'active',
  \ 'active_filetypes': ['javascript','coffe','html','css'],
  \ 'passive_filetypes':[]}

"Autocomplete, TODO: i have to add smarter one
:imap <C-Space> <c-x><c-o>

run SyntasticEnable javascript

let g:CommandTCancelMap='<C-x>'

filetype plugin indent on
filetype on

