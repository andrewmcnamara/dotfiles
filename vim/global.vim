set nocompatible
" Enable syntax highlighting
syntax enable
filetype plugin indent on

set path+=**
set wildmenu
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
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise
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
set vb
set background=dark
set hidden              " enable multiple modified buffers
set history=1000
" Indent
set ai
set si
set clipboard=unnamed " Use mac clipboard
set mouse=a " Use mouse 
set showmode
set foldlevel=1


let g:ackprg = 'ag --vimgrep'
"set tags+=tags,.tags
"Use za to open folds
"
"{{{ Unused
"set relativenumber
"set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
"set cursorline
"set splitbelow
"set splitright

"let g:conoline_auto_enable = 0
"let g:conoline_use_colorscheme_default_insert=1
"let g:conoline_color_normal_dark = 'guibg=#333333 guifg=#dddddd gui=None '
"                           \. 'ctermbg=grey ctermfg=white'
"autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
"}}}
" Colours {{{
"colorscheme slateblue
colorscheme wombat
"colorscheme smyck

"colorscheme spacegray
"highlight CursorLine ctermbg=235
"ighlight ColorColumn ctermbg=235
"}}}
" Key Mappings {{{
map <C-n> :Lex<CR>
"map <C-n> :NERDTreeToggle<CR>
"map <C-e> :NERDTreeTabsToggle<CR>
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>
nmap     <C-F>l <Plug>CtrlSFQuickfixPrompt
vmap     <C-F>l <Plug>CtrlSFQuickfixVwordPath
vmap     <C-F>L <Plug>CtrlSFQuickfixVwordExec

map <leader>fi :setlocal foldmethod=indent<cr>
map <leader>fs :setlocal foldmethod=syntax<cr>

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" }}}
"{{{ NEtrw 
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_winsize = 30
let g:netrw_preview=1           " open previews vertically

" open files from netrw in a previous window, unless we're opening the current dir
if argv(0) ==# '.'
    let g:netrw_browse_split = 0
else
    let g:netrw_browse_split = 4
endif
"}}}
"{{{ Ctrlp Settings
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
end
"}}}
" Syntastic config {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_exec = '~/.rbenv/shims/ruby'
"}}}
" {{{ Custom Functions
"
command! MakeTags !ctags

augroup number
    autocmd!
    au InsertEnter * set rnu
    au InsertLeave * set nornu
    " LineNr ctermfg=11 guifg=black  
    " autocmd InsertEnter * highlight LineNr ctermfg=bg guifg=bg
    ".autocmd InsertLeave * highlight LineNr ctermfg=11 guifg=black
augroup end
"}}}
"{{{ Seeing Is Believing =====
" Assumes you have a Ruby with SiB available in the PATH
" If it doesn't work, you may need to `gem install seeing_is_believing -v 3.0.0.beta.6`
" ...yeah, current release is a beta, which won't auto-install

" Annotate every line
  nmap <leader>b :%!seeing_is_believing --timeout 12 --line-length 500 --number-of-captures 300 --alignment-strategy chunk<CR>;
" Annotate marked lines
  nmap <leader>n :%.!seeing_is_believing --timeout 12 --line-length 500 --number-of-captures 300 --alignment-strategy chunk --xmpfilter-style<CR>;
" Remove annotations
  nmap <leader>c :%.!seeing_is_believing --clean<CR>;
" Mark the current line for annotation
  nmap <leader>m A # => <Esc>
" Mark the highlighted lines for annotation
  vmap <leader>m :norm A # => <Esc>
"}}}

"" Enable folding based on syntax rules
"set foldmethod=syntax

"" Adjust the highlighting
"highlight Folded guibg=grey guifg=blue


iab rsd require "spec_helper.rb"<CR>RSpec.describedo<CR>end<esc>k12li
nnoremap <leader>wtf oputs "#" * 90<c-m>puts caller<c-m>puts "#" * 90<esc>
" vim:foldmethod=marker:foldlevel=0
