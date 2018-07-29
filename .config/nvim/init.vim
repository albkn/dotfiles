"""
 " PLUGIN INIT
 ""

call plug#begin('~/.vim/bundle')

""""" Functional plugins
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/echodoc.vim'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'kshenoy/vim-signature'
Plug 'easymotion/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/goyo.vim'
Plug 'prettier/vim-prettier', {
\   'do': 'npm install',
\   'for': ['javascript', 'typescript', 'json', 'css', 'scss']
\}
Plug 'Yggdroot/indentLine'
Plug 'gcmt/taboo.vim'
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'othree/es.next.syntax.vim'
Plug 'othree/jsdoc-syntax.vim'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'mhartington/nvim-typescript', {'do': 'sh install.sh'}

""""" Themes
Plug 'lifepillar/vim-solarized8'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'whatyouhide/vim-gotham'
Plug 'dracula/vim'
Plug 'sickill/vim-monokai'
Plug 'joshdick/onedark.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'mhartington/oceanic-next'
Plug 'liuchengxu/space-vim-dark'
Plug 'danilo-augusto/vim-afterglow'
Plug 'herrbischoff/cobalt2.vim'

""""" End init
call plug#end()


"""
 " PLUGIN SETTINGS
 ""

""""" NERDTree
" Auto open NERDTree only if vim is open without arguments
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Show hidden files by default
let g:NERDTreeShowHidden = 1
" Remap NERDTreeToggle to CTRL+\
map <C-\> :NERDTreeToggle<CR>

""""" Ale
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {
\   'typescript': ['tslint', 'tsserver', 'typecheck'],
\   'php': ['phpcs', 'phpmd', 'php -l'],
\}
let g:ale_php_phpcs_standard = 'PSR2'

""""" Deoplete
let g:deoplete#enable_at_startup = 1

""""" Echodoc
let g:echodoc_enable_at_startup = 1

""""" CtrlP
" Set no max file limit
let g:ctrlp_max_files = 0
" Search from current dir, instead of project root
let g:ctrlp_working_path_mode = 0
" Ignore files in .gitignore
"let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" Use Ag for faster search
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

""""" Fzf
" Respects .gitignore
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
" Action triggers when picking a file, `enter` and `ctrl-t` are swapped
let g:fzf_action = {
\   'enter': 'tab split',
\   'ctrl-t': 'edit',
\   'ctrl-x': 'split',
\   'ctrl-v': 'vsplit',
\}

""""" Prettier
" Don't autoformat files
let g:prettier#autoformat = 0
" Run in async mode
let g:prettier#exec_cmd_async = 1
" Don't open quickfix on parsing error
let g:prettier#quickfix_enabled = 0
" Don't autofocus to quickfix on parsing error
let g:prettier#quickfix_auto_focus = 0

""""" vim-jsx
let g:jsx_ext_required = 0

""""" vim-json
let g:vim_json_syntax_conceal = 0

""""" indentLine
let g:indentLine_color_term = 237
let g:indentLine_color_gui = '#3c3d37'
let g:indentLine_color_tty_light = 7
let g:indentLine_color_dark = 1

""""" Taboo
let g:taboo_tab_format = ' [%N] %f%m '


"""
 " FILE EXTENSIONS
 ""

""""" Javascript
autocmd BufNewFile,BufRead *.es6 set filetype=javascript


"""
 " EDITOR SETTINGS
 ""

" Default utf8 and 256 colors
set encoding=utf-8  " Set utf8
set t_Co=256        " Set 256 color

" Default syntax
syntax on
set background=dark
colors afterglow

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
hi ColorColumn ctermbg=237 guibg=#3c3d37

" Tab line settings
set guioptions-=e " Use TERM style tabline even for GUI editor
hi TabLineFill  cterm=None ctermbg=0243 ctermfg=0243 gui=None guibg=#767676 guifg=#767676
hi TabLine      cterm=None ctermbg=0243 ctermfg=0015 gui=None guibg=#767676 guifg=#f8f8f2
hi TabLineSel   cterm=None ctermbg=0235 ctermfg=0015 gui=None guibg=#262626 guifg=#f8f8f2
hi Title        cterm=None ctermbg=None ctermfg=0015 gui=None guibg=#262626 guifg=#f8f8f2

" Status line settings
set laststatus=2    " Always on
set statusline=[%n]\ %f
set statusline+=%=
set statusline+=\ %p%%
set statusline+=\ \ Ln%l,Col%c
set statusline+=\ \ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ %y

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

" Autocomplete options
set completeopt+=menuone
set completeopt-=preview

" Allow project-specific config
set exrc

" Disable unsafe commands
set secure

" Turn backup off
set nobackup
set nowb
set noswapfile
