" =============================================================================
" { Plugin Management

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
" power line replacement
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'honza/vim-snippets'
Plug 'sirver/ultisnips'
Plug 'Valloric/YouCompleteMe'
" fzf is a two parter!
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'rking/ag.vim'
Plug 'vim-scripts/a.vim'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'chriskempson/base16-vim'
Plug 'majutsushi/tagbar'
Plug 'morhetz/gruvbox'
Plug 'peterhoeg/vim-qml'

" Add plugins to &runtimepath
call plug#end()

" } End Plugin Management
" =============================================================================

" Setup colorscheme
let g:gruvbox_contrast_dark="hard"
set background=dark
colorscheme gruvbox

" special commands begin with ,
let mapleader=","

" Never get stuck in Ex mode again!
nnoremap Q <nop>

" toggle paste mode for easier right click pasting
set pastetoggle=<F2>

" filetypes to ignore
set wildignore+=*.o,_ocm,*.annot,*.cmi,*.cmo,*.a,*.pyc

" don't show pyc files in lists
let g:netrw_list_hide= '.*\.pyc$'

" i hate swp files
set nobackup
set noswapfile

" make backspace work like it should
set backspace=indent,eol,start

" Get syntax highlighting for scons
au BufNewFile,BufRead SCons* set filetype=scons

" Always display status bar
set laststatus=2

" be like Vim not vi
set nocompatible

" syntax highlighting and filetype specific features on
syntax on
filetype on
filetype plugin on
filetype indent on

" tabs are four spaces, smart tabbing for convenience
set tabstop=4
set expandtab
set smarttab

" smart and auto indenting for easier coding
set autoindent
set smartindent

" Show matching bracets when text indicator is over them
set showmatch 

" wrap long lines
set wrap

" line numbering"
set nu

" case insensitive search "
set ic

"When 'ignorecase' and 'smartcase' are both on, if a pattern contains an
"uppercase letter, it is case sensitive, otherwise, it is not. For example,
"/The would find only The, while /the would find the or The etc.
set smartcase

" highlight search
set hls

" Make search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros
set lazyredraw 

" allows pattern matching with special characters
set magic 

" show the cursor position all the time
set ruler   

" 80 character per line
set textwidth=80

" for clearing search
nmap <silent> ,/ :nohlsearch<CR>

" enable mouse support if we have it
if has('mouse')
  set mouse=a
endif

"set wildmenu" enables a menu at the bottom of the vim/gvim window.
"The meaning of "list:longest,full" is so that when you do completion in the
"command line via tab, these events will happen:
"1. (on the first tab) a list of completions will be shown and the command
"will be completed to the longest common command.
"2. (on second tab) the wildmenu will show up with all the completions that
"were listed before.
"To test it out, type ":spe" and then hit tab once to see 1 and hit tab 
"again to see 2.
set wildmenu
set wildmode=list:longest,full

" cpp
autocmd FileType cpp set tabstop=4
autocmd FileType cpp set shiftwidth=4
autocmd FileType cpp set softtabstop=4
autocmd FileType cpp set expandtab
autocmd FileType cpp set equalprg=astyle

" qml
autocmd FileType qml set tabstop=4
autocmd FileType qml set shiftwidth=4
autocmd FileType qml set softtabstop=4
autocmd FileType qml set expandtab

" c
autocmd FileType c set tabstop=4
autocmd FileType c set shiftwidth=4
autocmd FileType c set softtabstop=4
autocmd FileType c set expandtab
autocmd FileType c set equalprg=astyle

" python
autocmd FileType py set autoindent nosmartindent    " auto/smart indent
autocmd FileType py set smarttab
autocmd FileType py set expandtab                   " expand tabs to spaces
autocmd FileType py set shiftwidth=4
autocmd FileType py set softtabstop=4
autocmd FileType py set tabstop=4

" =============================================================================
" Plugin Config
" =============================================================================

" ===============================================
" YouCompleteMe
let g:ycm_always_populate_location_list = 1
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
" Apply YCM FixIt
map <leader>f :YcmCompleter FixIt<CR>

" ===============================================
" NerdTree
" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>
" Quit vim even if NERDTree is still open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ===============================================
" a.vim shortcut - switch to header/code file
map <leader>a :A<CR>

" ===============================================
" Trigger configuration. Do not use <tab> if you use YouCompleteMe.
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

" ===============================================
" Fzf Configuration
" Trigger configuration.
nnoremap <leader>t :FZF<cr>
nnoremap <leader>k :Tags<cr>
nnoremap <leader>b :Buffers<cr>

" ===============================================
" doxygen
let g:load_doxygen_syntax=1

" ===============================================
" airline
let g:airline_theme='tomorrow'

" ===============================================
" nerd commentor
let g:NERDSpaceDelims = 1

" ===============================================
" ag.vim 
noremap <leader>g :Ag -U <C-r>=expand('<cword>')<CR><CR>

" tagbar
nmap <leader>l :TagbarToggle<CR>
