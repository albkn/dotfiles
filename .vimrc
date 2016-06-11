"""""""""" VUNDLE
" initialize, set the runtime path to include Vundle and initialize
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
""" Vim plugins via Vundle
Plugin 'VundleVim/Vundle.vim' " required
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'easymotion/vim-easymotion'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
""" Vim themes via Vundle
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'whatyouhide/vim-gotham'
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plugin 'tomasr/molokai'
Plugin 'sickill/vim-monokai'
Plugin 'joshdick/onedark.vim'
Plugin 'jdkanani/vim-material-theme'
Plugin '29decibel/codeschool-vim-theme'
Plugin 'jpo/vim-railscasts-theme'
" end initialization
call vundle#end()             " required
filetype plugin indent on     " required
"filetype plugin on " use this instead to ignore plugin indent changes


"""""""""" PLUGIN SETTINGS
""" NERDTree
" Auto open NERDTree only if vim is open without arguments
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Remap NERDTreeToggle to CTRL+\
map <C-\> :NERDTreeToggle<CR>
""" Syntastic
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
""" CtrlP
" Set no max file limit
let g:ctrlp_max_files = 0
" Search from current dir, instead of project root
let g:ctrlp_working_path_mode = 0
" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
""" Fzf
" Respects .gitignore
let $FZF_DEFAULT_COMMAND = 'ag -g ""'


"""""""""" VIM SETTINGS
" Default utf8 and 256 colors 
set encoding=utf-8  " Set utf8
set t_Co=256        " Set 256 color

" Default syntax
syntax on
set background=dark
colors monokai

" General
set number          " Show line numbers
set ruler           " Show row and column ruler information
set cmdheight=2     " Command line height
set undolevels=500  " Number of undo levels
set updatetime=1000 " Lengths use by some plugins before triggering update

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

" Status line formatting
set statusline=[%n]\ %f
set statusline+=%=
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=\ 
set statusline+=%l:%c

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
   
