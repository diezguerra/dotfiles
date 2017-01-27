set nocompatible
filetype off
set shell=bash
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'gmarik/vundle'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'alfredodeza/khuno.vim'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-surround'
NeoBundle 'sjl/badwolf'
NeoBundle 'vim-scripts/indentpython.vim--nianyang'
NeoBundle 'vim-scripts/camelcasemotion'
NeoBundle 'vim-scripts/vim-es6'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'bling/vim-airline'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
NeoBundle 'altercation/solarized', {'rtp': 'vim-colors-solarized/'}
NeoBundle 'tomasr/molokai'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'nvie/vim-flake8'
NeoBundle 'elixir-lang/vim-elixir'

call neobundle#end()

" autocmd FileType python set commentstring=#\ %s
let g:khuno_builtins="_,apply"
let $PATH .= ':/anaconda/bin/'
"let g:solarized_termcolors=256
filetype on
filetype plugin indent on
let mapleader="\<Space>"
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
set guifont=Fira\ Mono:h14
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
set paste
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
nnoremap <silent> <Leader>o :CtrlPClearAllCaches<CR>
let g:ctrlp_working_path_mode=2

" Uses git or silver searcher to build project index
let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif

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

" Copy & paste to system clipboard with <leader>p and <leader>y
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Automatically jump to end of text you pasted
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nnoremap <left> <C-w>h
nnoremap <right> <C-w>l
nnoremap <up> <C-w>k
nnoremap <down> <C-w>j

" Enter visual line mode with <Space><Space>:
nmap <Leader><Leader> V

" Expanding areas
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

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
nnoremap <leader>ev :tabedit $MYVIMRC<cr>
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

map <F10> :set paste<CR>
map <F9> :set nopaste<CR>

" Switch to alternate file
map <C-Tab> :bnext<cr>
map <C-S-Tab> :bprevious<cr>

map <C-CR> o<ESC>k
map <C-S-CR> O<ESC>j

nnoremap <CR> G
nnoremap <BS> gg

" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

" Easier write
nnoremap <Leader>w :w<CR>

" Stop that stupid window from popping up
map q: :q

" Many ways to leave
ino jj <esc>
cno jj <c-c>
inoremap jj <ESC>
inoremap jk <ESC>
inoremap kj <ESC>
vno v <esc>

let g:airline_theme='powerlineish'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_z=''

" Helps .editorconfig play nice with fugitive plugin
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" flake8 config
let g:flake8_show_in_gutter=1
let g:flake8_show_in_file=1
let g:flake8_show_quickfix=1
autocmd BufWritePost *.py call Flake8()

"colorscheme Tomorrow-Night-Bright
"colorscheme solarized
colorscheme molokai
"colorscheme wombat256mod
"highlight ColorColumn ctermbg=7
"highlight ColorColumn guibg=Black
"colorscheme base16-default
 highlight ColorColumn ctermbg=7
" highlight ColorColumn guibg=Grey

NeoBundleCheck
