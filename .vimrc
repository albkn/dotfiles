""" Load Vundle
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
""" Vim plugins via Vundle
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'easymotion/vim-easymotion'
" themes
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'whatyouhide/vim-gotham'
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}
""" End Vundle
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on


" Default utf8 and 256 colors 
set encoding=utf-8  " Set utf8
set t_Co=256        " Set 256 color

" Default syntax
syntax on
set background=dark
colors solarized

" General
set number          " Show line numbers
set ruler           " Show row and column ruler information
set cmdheight=2     " Command line height
set undolevels=500  " Number of undo levels

" Indentations 
set autoindent      " Auto-indent new lines
set smartindent     " Enable smart-indent
set expandtab       " Use spaces instead of tabs
set smarttab        " Enable smart-tabs
set shiftwidth=2    " Number of auto-indent spaces
set softtabstop=2   " Number of spaces per Tab

" Wraps and line breaks
set wrap            " Wrap lines
set linebreak       " Break lines at word (requires Wrap lines)
set showbreak=\ \   " Wrap-broken line prefix

" Margin guide - 80 characters
set colorcolumn=80  " Put a line-length marker
hi ColorColumn ctermbg=gray guibg=gray

" Backspace options
set backspace=indent,eol,start  " Backspace behaviour
set whichwrap+=<,>,h,l

" Highlight matching brackets
set showmatch       " Highlight matching brace
set mat=5           " How many tenths of a second to blink matching brackets

" Visual bell
set errorbells      " Beep or flash screen or errors
set visualbell      " Use visual bell (no beeping)

" Search options
set hlsearch        " Highlight all search results
set smartcase       " Enable smart-case search
set gdefault        " Always substitute all matches in a line
set incsearch       " Searches for strings incrementally

" Turn backup off
set nobackup
set nowb
set noswapfile
   
""" NERDTree
" Auto open NERDTree only if vim is open without arguments
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Remap NERDTreeToggle to CTRL+\
map <C-\> :NERDTreeToggle<CR>

""" CtrlP
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
