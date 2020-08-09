" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on

set nocompatible

set number
set ruler
syntax on

" Set encoding
set encoding=utf-8

" Whitespace stuff
set nowrap
set tabstop=4
set shiftwidth=4
"set softtabstop=4
set expandtab
set list listchars=tab:\ \ ,trail:·

" Set leader
" let leader = "<Space>"

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Status bar
set laststatus=2

" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" ZoomWin configuration
map <Leader><Leader> :ZoomWin<CR>

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

function s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

function s:setupMarkup()
  call s:setupWrapping()
  map <buffer> <Leader>p :Hammer<CR>
endfunction

" make uses real tabs
au FileType make set noexpandtab

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

au BufRead,BufNewFile *.txt call s:setupWrapping()

" make Python follow PEP8, sort of ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=150
let g:pymode_lint_checkers=['pyflakes', 'mccabe']
let g:pymode_rope_autoimport = 0
let g:pymode_rope = 0

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv


" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_enable_balloons=1
let g:syntastic_quiet_warnings=1

" Use modeline overrides
set modeline
set modelines=10

" Default color scheme
color desert

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Turn off jslint errors by default
let g:JSLintHighlightErrorLine = 0

" enable ruby folding, default to unfolded
let ruby_fold=1
set foldlevelstart=99

" Show (partial) command in the status line
set showcmd

map <C-TAB> :tabnext<CR>
map <C-S-TAB> :tabprev<CR>

autocmd bufread,bufnewfile *.scons set expandtab
autocmd bufread,bufnewfile *.scons set tabstop=4
autocmd bufread,bufnewfile *.scons set shiftwidth=4
"autocmd bufread,bufnewfile SConstruct set expandtab
"autocmd bufread,bufnewfile SConstruct set tabstop=4
"autocmd bufread,bufnewfile SConstruct set shiftwidth=4

autocmd bufread,bufnewfile Snakefile set syntax=snakemake
autocmd bufread,bufnewfile Smakefile set syntax=python
autocmd bufread,bufnewfile *.smk set syntax=snakemake
autocmd bufread,bufnewfile Snakefile.* set syntax=snakemake
autocmd bufread,bufnewfile,bufenter SConstruct.* setlocal filetype=python
autocmd bufread,bufnewfile,bufenter SConstruct setlocal filetype=python
autocmd bufread,bufnewfile,bufenter *.scala setlocal filetype=scala
autocmd bufread,bufnewfile,bufenter *.hcl setlocal filetype=tf

noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
    set virtualedit=all
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
  endif
endfunction

" Addtionnal config
inoremap jk <ESC>

set mouse=a
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end
"map <ScrollWheelUp> <C-Y>
"map <ScrollWheelDown> <C-E>
map <ScrollWheelUp> <Up>
map <ScrollWheelDown> <Down>
