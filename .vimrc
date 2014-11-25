set nocompatible
filetype off
set shell=bash
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'alfredodeza/khuno.vim'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-surround'
Bundle 'sjl/badwolf'
Bundle 'vim-scripts/indentpython.vim--nianyang'
Bundle 'vim-scripts/camelcasemotion'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
Bundle 'scrooloose/nerdtree'
Bundle 'bling/vim-airline'
Bundle 'Shougo/unite.vim'
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Bundle 'altercation/solarized', {'rtp': 'vim-colors-solarized/'}
Bundle 'tomasr/molokai'
Bundle 'terryma/vim-multiple-cursors'

" autocmd FileType python set commentstring=#\ %s
let g:khuno_builtins="_,apply"
let $PATH .= ':/anaconda/bin/'
"let g:solarized_termcolors=256
filetype on
filetype plugin indent on
let mapleader=","
set autoindent
set background=dark
set backspace=indent,eol,start
set backupdir=~/tmp
set colorcolumn=79
set copyindent
set cryptmethod=blowfish
set cursorline
set expandtab
set fileencodings=utf-8,ucs-bom,default,latin1
set fillchars=""  " Get rid of the silly characters in window separators
set guifont=Inconsolata:h18
set guitablabel=%M%t
set hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set list
set listchars=trail:.,extends:>,precedes:<,tab:▸\ ,eol:¬
set nobackup
set noerrorbells
set nosmartindent
set noswapfile
set nowrap
set nowritebackup
set number "line numbers on the side
set relativenumber
set ruler
set scrolloff=5 "provide some context when scrolling
set sessionoptions=blank,buffers,curdir,slash,tabpages,unix
set shiftwidth=4
set showcmd
set smartcase
set smarttab
set softtabstop=4
set splitbelow
set splitright
set tabstop=4
set termencoding=utf-8
set tildeop
set title
set undolevels=1000
set viminfo='128,/32,:32,<64,@32,s10,h,n$HOME/.vim/viminfo
set visualbell
set wildcharm=<TAB>
set wildignore+=*.DS_Store?
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.hi
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.luac
set wildignore+=*.mo
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest
set wildignore+=*.pyc,*.pyo
set wildignore+=*.spl
set wildignore+=*.sw?
set wildignore+=*.swp,*.bak,*.class
set wildignore+=.git,.hg,_darcs,.svn
set wildignore+=env
set wildignore+=node_modules
set wildmenu
set wildmode=list:longest
syntax on

"set statusline=%f[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
"hi StatusLine guifg=#839496 guibg=#073642

set guioptions-=r "no right scrollbar
set guioptions-=L "no left scrollbar
set guioptions-=T "no toolbar

nmap <silent> <leader>cf <ESC>/\v^[<=>]{7}( .*\|$)<CR> " finds git conflicts

" Center screen on search match
nnoremap n nzzzv
nnoremap N Nzzz

" stops search hilighting
nmap <silent> m :silent noh<cr>

" select just pasted text
nnoremap <leader>v v`]

" CtrlP.vim bindings
nnoremap <silent> <Leader>t :CtrlP<CR>
nnoremap <silent> <Leader>b :CtrlPBuffer<CR>
nnoremap <silent> <Leader>r :CtrlPClearAllCaches<CR>
let g:ctrlp_working_path_mode=2

" Khuno binding
nmap <silent><Leader>k <Esc>:Khuno show<CR>


" Mouse and GUI settings
if has('mouse')
    set mouse=a
    set mousehide
endif

if has("gui_running")
    highlight SpellBad term=underline gui=undercurl guisp=Orange
    set mouse=a
    set mousemodel=popup

    set guioptions-=T  " No toolbar
    set guioptions-=l  " No scrollbars
    set guioptions-=r
    set guioptions-=L
    set guioptions-=R
    set guioptions-=m  " No menu

    set guicursor=n-v-c:block-Cursor-blinkon0
    set guicursor+=ve:ver35-Cursor
    set guicursor+=o:hor50-Cursor
    set guicursor+=i-ci:ver25-Cursor
    set guicursor+=r-cr:hor20-Cursor
    set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon17
endif

" Preserves cursor position after command, good for cleanup tasks
function! <SID>Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
  echo "Cleaned file of whitespace and the like"
endfunction

" Cleanup whitespace
nnoremap <silent> <F5> :call <SID>Preserve('%s/\s\+$//e')<CR>

" Auto cleanup whitespace on save of python and js
" autocmd BufWritePre *.py,*.js :call <SID>Preserve('%s/\s\+$//e')<CR>

" No buffer when copying
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
vnoremap C "_C

" Many ways to leave
ino jj <esc>
cno jj <c-c>
inoremap jj <ESC>
inoremap jk <ESC>
inoremap kj <ESC>
vno v <esc>

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nnoremap <left> <C-w>h
nnoremap <right> <C-w>l
nnoremap <up> <C-w>k
nnoremap <down> <C-w>j

set noesckeys
set timeout timeoutlen=1000 ttimeoutlen=100
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is#'W')?('w'):('W'))
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is#'Q')?('q'):('Q'))
nnoremap <tab> %
vnoremap <tab> %
nnoremap ; :

" Write as sudo
cnoremap w!! w !sudo tee % >/dev/null

" Highlight all instances of the current word under the cursor
nnoremap <silent> <leader>hh :setl hls<CR>:let @/="\\<<C-r><C-w>\\>"<CR>

" Edit and load this file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>rv :source $MYVIMRC<cr>

" Easy colorscheme inverting
command! -bar Invert :let &background = (&background == "light" ? "dark" : "light")

" Helper for MakeSpacelessIabbrev
function! EatChar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunction

function! MakeSpacelessIabbrev(from, to)
    execute "iabbrev <silent> ".a:from." ".a:to."<C-R>=EatChar('\\s')<CR>"
endfunction

call MakeSpacelessIabbrev('***', '*args, **kwargs')
call MakeSpacelessIabbrev('ipdb', 'import ipdb; ipdb.set_trace()')

map <leader>n :NERDTreeToggle<CR>

map <F10> :set paste<CR>
map <F9> :set nopaste<CR>

" Switch to alternate file
map <C-Tab> :bnext<cr>
map <C-S-Tab> :bprevious<cr>

map <CR> o<ESC>k
map <Space> O<ESC>j

"colorscheme Tomorrow-Night-Bright
"colorscheme solarized
colorscheme molokai
