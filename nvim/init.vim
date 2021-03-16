" Basic Configuration
set number			" Show line numbers
set linebreak			" Break lines at word (requires Wrap lines)
set showbreak=——— 		" Wrap-broken line prefix
set textwidth=100		" Line wrap (number of cols)
set showmatch			" Highlight matching brace

set smartcase			" Enable smart-case search
set ignorecase			" Always case-insensitive
set incsearch			" Searches for strings incrementally

set autoindent			" Auto-indent new lines
set expandtab			" Use spaces instead of tabs
set shiftwidth=4		" Number of auto-indent spaces
set smartindent			" Enable smart-indent
set smarttab			" Enable smart-tabs
set softtabstop=4		" Number of spaces per Tab

" Plugins
call plug#begin('~/.vim/nvim-plugs')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()