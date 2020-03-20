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
set visualbell
set background=dark
set hidden              " enable multiple modified buffers
set history=1000
set encoding=UTF-8
" Indent
set ai
set si
set clipboard=unnamed,unnamedplus " Use mac clipboard
set go+=a "  autocopy selection
"set mouse=a " Use mouse
set showmode
set foldlevel=1

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes
set updatetime=300
set shortmess+=c


let g:vim_jsx_pretty_colorful_config = 1 " default 0

set grepprg=rg\ --vimgrep
"set tags+=tags,.tags
"Use za to open folds

" Colours {{{
"colorscheme slateblue
"colorscheme badwolf
"colorscheme jellybeans
colorscheme dracula
"colorscheme smyck

" Key Mappings {{{
map <C-n> :Lex<CR>
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>

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
nnoremap <C-P> :Files<CR>

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
"let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'
let g:fzf_tags_command = 'ctags -R'
" map key to command
map <leader>f :Find<space>

if executable('fzf')
  " FZF {{{
  " <C-p> or <C-t> to search files
  nnoremap <silent> <C-t> :FZF -m<cr>
  nnoremap <silent> <C-p> :FZF -m<cr>

  " <M-p> for open buffers
  nnoremap <silent> <M-p> :Buffers<cr>

  " <M-S-p> for MRU
  nnoremap <silent> <M-S-p> :History<cr>

  " Use fuzzy completion relative filepaths across directory
  imap <expr> <c-x><c-f> fzf#vim#complete#path('git ls-files $(git rev-parse --show-toplevel)')

  " Better command history with q:
  command! CmdHist call fzf#vim#command_history({'right': '40'})
  nnoremap q: :CmdHist<CR>

  " Better search history
  command! QHist call fzf#vim#search_history({'right': '40'})
  nnoremap q/ :QHist<CR>
  "let g:fzf_layout = { 'window': 'enew' }
  command! -bang -nargs=* Ack call fzf#vim#ag(<q-args>, {'down': '40%', 'options': --no-color'})
  " }}}
else
  " CtrlP fallback
end

set wildignore+=**/node_modules/*,_build/*,deps*
nnoremap <leader>d :call fzf#vim#tags(expand('<cword>'), {'options': '--exact --select-1 --exit-0'})<CR>


" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)



autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %
autocmd BufWritePost *.rb AsyncRun -post=checktime rubocop -a %


command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
