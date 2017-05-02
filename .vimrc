""" Initialize Vim-plug for dependencies
call plug#begin('~/.vim/bundle')
""" Specify plugins
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'kshenoy/vim-signature'
Plug 'easymotion/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'othree/es.next.syntax.vim'
Plug 'othree/jsdoc-syntax.vim'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
""" Specify themes
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'whatyouhide/vim-gotham'
Plug 'dracula/vim'
Plug 'sickill/vim-monokai'
Plug 'joshdick/onedark.vim'
Plug 'jdkanani/vim-material-theme'
" end initialization
call plug#end()


"""""""""" PLUGIN SETTINGS
""" NERDTree
" Auto open NERDTree only if vim is open without arguments
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Show hidden files by default
let g:NERDTreeShowHidden = 1
" Remap NERDTreeToggle to CTRL+\
map <C-\> :NERDTreeToggle<CR>
""" Syntastic
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['tslint']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_php_checkers = ['phpmd']
let g:syntastic_php_phpmd_post_args = "$HOME/.config/phpmd/rules.xml"
""" CtrlP
" Set no max file limit
let g:ctrlp_max_files = 0
" Search from current dir, instead of project root
let g:ctrlp_working_path_mode = 0
" Ignore files in .gitignore
"let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" Use Ag for faster search
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
""" Fzf
" Respects .gitignore
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
""" vim-jsx
let g:jsx_ext_required = 0


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
set cursorline      " Show horizontal line on current line
set wildmenu        " Show visual autocomplete for command menu
set lazyredraw      " Redraw screen only when need to
set updatetime=1000 " Lengths use by some plugins before triggering update
set undolevels=500  " Number of undo levels

" Indentations 
set smarttab        " Enable smart-tabs
set expandtab       " Use spaces instead of tabs
set autoindent      " Auto-indent new lines
set smartindent     " Enable smart-indent
set tabstop=4       " Number of virtual spaces per tab
set softtabstop=4   " Number of spaces per Tab
set shiftwidth=4    " Number of auto-indent spaces

" Wraps and line breaks
set wrap            " Wrap lines
set linebreak       " Break lines at word (requires Wrap lines)
set showbreak=\ \   " Wrap-broken line prefix

" Folding
set foldenable        " Enable folding
set foldmethod=indent " Fold based on indentation level
set foldlevelstart=1  " Start with fold level 3 on new buffer

" Margin guide - 80 characters
set colorcolumn=80  " Put a line-length marker
hi ColorColumn ctermbg=237 guibg=#3a3a3a

" Tab line settings
hi TabLineFill  cterm=None ctermbg=0243 ctermfg=0243 guibg=#767676 guifg=#767676
hi TabLine      cterm=None ctermbg=0243 ctermfg=0015 guibg=#767676 guifg=#f8f8f2
hi TabLineSel   cterm=None ctermbg=0235 ctermfg=0015 guibg=#262626 guifg=#f8f8f2
hi Title        cterm=None ctermbg=None ctermfg=0015 guibg=#262626 guifg=#f8f8f2

" Status line settings
set laststatus=2    " Always on
set statusline=[%n]\ %f
set statusline+=%=
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=\ 
set statusline+=%l:%c

" Command line settings
set showcmd         " Show command in bottom bar
set cmdheight=2     " Command line height

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

" Allow project-specific config
set exrc
   
" Disable unsafe commands
set secure
