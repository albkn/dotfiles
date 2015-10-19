"" Load pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

"" General
set encoding=utf-8

set number          " Show line numbers
set linebreak       " Break lines at word (requires Wrap lines)
set showbreak=+++   " Wrap-broken line prefix
set textwidth=80    " Line wrap (number of cols)
set showmatch       " Highlight matching brace
set visualbell      " Use visual bell (no beeping)
 
set hlsearch        " Highlight all search results
set smartcase       " Enable smart-case search
set gdefault        " Always substitute all matches in a line
set incsearch       " Searches for strings incrementally
  
set autoindent      " Auto-indent new lines
set expandtab       " Use spaces instead of tabs
set shiftwidth=2    " Number of auto-indent spaces
set smartindent     " Enable smart-indent
set smarttab        " Enable smart-tabs
set softtabstop=2   " Number of spaces per Tab
   
"" Advanced
set ruler           " Show row and column ruler information
set cmdheight=2     " Command line height

set undolevels=500 " Number of undo levels
set backspace=indent,eol,start  " Backspace behaviour

" Default syntax
syntax on
set background=dark
colors solarized

" NERDTree
" Auto open NERDTree only if vim is open without arguments
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Remap NERDTreeToggle to CTRL+\
map <C-\> :NERDTreeToggle<CR>
