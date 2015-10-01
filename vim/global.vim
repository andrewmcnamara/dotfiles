set nocompatible
syntax on
filetype plugin indent on

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
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set ruler               " line and column number of the cursor position
set laststatus=2        " always show the status line
set noswapfile
set nobackup
set nowb
set title
set pastetoggle=<F2>
set hidden
set vb
"set cursorline
set background=dark
set hidden              " enable multiple modified buffers
set history=1000

let g:conoline_auto_enable = 1
"let g:conoline_use_colorscheme_default_insert=1
let g:conoline_color_normal_dark = 'guibg=#333333 guifg=#dddddd gui=None '
                           \. 'ctermbg=grey ctermfg=white'
colorscheme slateblue

" Enable syntax highlighting
syntax enable

"Key Mappings
map <C-e> :NERDTreeTabsToggle<CR>
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>
