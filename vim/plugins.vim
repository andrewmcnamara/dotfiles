call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'

Plug 'sheerun/vim-polyglot'
Plug 'janko/vim-test'
"Plug 'maxmellon/vim-jsx-pretty'

"Plug 'tpope/vim-dispatch'
"Plug 'tpope/vim-dispatch'
Plug 'skywind3000/asyncrun.vim'

Plug 'flazz/vim-colorschemes'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-sensible'

Plug 'SirVer/ultisnips'

Plug 'sudar/vim-arduino-syntax'
Plug 'sudar/vim-arduino-snippets'

"Plug 'ludovicchabant/vim-gutentags'

" Check that copy and paste from clipboard still work
Plug 'w0rp/ale'

Plug 'junegunn/fzf.vim'
Plug 'francoiscabrol/ranger.vim'

"Plug 'zxqfl/tabnine-vim'

Plug 'metakirby5/codi.vim'

Plug 'dracula/vim', { 'as': 'dracula' }

" Use release branch (Recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Dev icons
"Plug 'ryanoasis/vim-devicons'

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mbbill/undotree'

" Add plugins to &runtimepath
call plug#end()

