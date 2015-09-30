set nocompatible
if filereadable(expand("~/.vim/plugins.vim"))
  source ~/.vim/plugins.vim
endif

set autoread
let mapleader=","
set nowrap        " don't wrap lines
set softtabstop=2
set expandtab " Make tabs insert spaces
set tabstop=2     " a tab is four spaces
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=2  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set noswapfile
set nobackup
set nowb
set title
set pastetoggle=<F2>
set hidden
set vb
set cursorline
set background=dark

" Enable syntax highlighting
syntax enable

"Key Mappings
map <C-e> :NERDTreeTabsToggle<CR>
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>
