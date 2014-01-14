set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'nvie/vim-flake8'
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

" autocmd FileType python set commentstring=#\ %s
let g:khuno_builtins="_,apply"
let $PATH .= ':/anaconda/bin/'
"let g:solarized_termcolors=256
filetype on
filetype plugin indent on
let mapleader=","
set background=dark
set backspace=indent,eol,start
set expandtab
set smarttab
set softtabstop=4
set tabstop=4
set shiftwidth=4
set autoindent
set nosmartindent
set copyindent
set relativenumber
set nowrap
set lazyredraw
set colorcolumn=79
set fileencodings=utf-8,ucs-bom,default,latin1
set guifont=Monaco:h16
set guitablabel=%M%t
set termencoding=utf-8
set ruler
set number "line numbers on the side
set cursorline
set scrolloff=5 "provide some context when scrolling
set showcmd
set tildeop
set hidden
set list
set listchars=trail:.,extends:>,precedes:<,tab:▸\ ,eol:¬
set hlsearch
set incsearch
set ignorecase
set smartcase
set laststatus=2
set history=1000
set undolevels=1000
set wildmenu
set wildcharm=<TAB>
set wildmode=list:longest
set wildignore+=.git,.hg,_darcs,.svn
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest
set wildignore+=*.swp,*.bak,*.class
set wildignore+=*.pyc,*.pyo
set wildignore+=*.hi
set wildignore+=*.luac
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.spl
set wildignore+=*.sw?
set wildignore+=*.DS_Store?
set wildignore+=*.mo
set wildignore+=node_modules
set wildignore+=env
set viminfo='128,/32,:32,<64,@32,s10,h,n$HOME/.vim/viminfo
set sessionoptions=blank,buffers,curdir,slash,tabpages,unix
set cryptmethod=blowfish
set splitright
set splitbelow
set fillchars=""  " Get rid of the silly characters in window separators
set title
set visualbell
set noerrorbells
set nobackup
set nowritebackup
set noswapfile
set backupdir=~/tmp
set shell=bash
syntax on

set statusline=%f[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
hi StatusLine guifg=#839496 guibg=#073642

set guioptions-=r "no right scrollbar
set guioptions-=L "no left scrollbar
set guioptions-=T "no toolbar

nmap <silent> <leader>cf <ESC>/\v^[<=>]{7}( .*\|$)<CR>
nmap <silent> <C-N> :silent noh<CR>
" Center screen on search match
nnoremap n nzzzv
nnoremap N Nzzz
" Select just pasted text
nnoremap <leader>v V`]

nnoremap <silent> <Leader>t :CtrlP<CR>
nnoremap <silent> <Leader>b :CtrlPBuffer<CR>
nnoremap <silent> <Leader>r :CtrlPClearAllCaches<CR>
let g:ctrlp_working_path_mode=2

nmap <silent><Leader>k <Esc>:Khuno show<CR>

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

nnoremap <silent> <F5> :call <SID>Preserve('%s/\s\+$//e')<CR>
" autocmd BufWritePre *.py,*.js :call <SID>Preserve('%s/\s\+$//e')<CR>

nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
vnoremap C "_C
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

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>rv :source $MYVIMRC<cr>

command! -bar Invert :let &background = (&background == "light" ? "dark" : "light")

function! EatChar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunction

function! MakeSpacelessIabbrev(from, to)
    execute "iabbrev <silent> ".a:from." ".a:to."<C-R>=EatChar('\\s')<CR>"
endfunction

call MakeSpacelessIabbrev('***', '*args, **kwargs')
call MakeSpacelessIabbrev('ipdb', 'import ipdb; ipdb.set_trace()')

map <F10> :set paste<CR>
map <F9> :set nopaste<CR>

" Switch to alternate file
map <C-Tab> :bnext<cr>
map <C-S-Tab> :bprevious<cr>

map <CR> o<ESC>k
map <Space> O<ESC>j

colorscheme tomorrownightbright
