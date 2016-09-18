call plug#begin('~/.vim/plugged')

" Support for user-defined text objects
Plug 'kana/vim-textobj-user'
" replacement for the repeat mapping (.) to support plugins
Plug 'tpope/vim-repeat'
" hide .gitignore-d files from vim
"Plug 'vitaly/vim-gitignore'
" repeat motion with <Space>
Plug 'scrooloose/vim-space'
" Github's gist support
Plug 'mattn/gist-vim'
" web APIs support
Plug 'mattn/webapi-vim'

Plug 'rstacruz/sparkup'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jistr/vim-nerdtree-tabs'
Plug 'skalnik/vim-vroom'
"Plug 'rking/ag.vim'
Plug 'bling/vim-airline'
" commenting
Plug 'scrooloose/nerdcommenter'
" fuzzy file open
Plug 'kien/ctrlp.vim'
" popup completion menu
Plug 'AutoComplPop'
Plug 'tpope/vim-surround'
" vertical alignment tool
Plug 'tsaleh/vim-align'
Plug 'dyng/ctrlsf.vim'

" Ruby/Rails
" rails support
Plug 'tpope/vim-rails'
" bundler integration (e.g. :Bopen)
Plug 'tpope/vim-bundler'
" rake integration
Plug 'tpope/vim-rake'
" A custom text object for selecting ruby blocks (ar/ir)
Plug 'nelstrom/vim-textobj-rubyblock'
" ruby refactoring
Plug 'ecomba/vim-ruby-refactoring'
" apidock.com docs integration
Plug 'apidock.vim'
" toggle ruby blocks style
Plug 'vim-scripts/blockle.vim'
" lightweight Rspec runner for Vim
Plug 'josemarluedke/vim-rspec'
" i18n extraction plugin
Plug 'stefanoverna/vim-i18n'

" syntax support
"Plug 'vim-ruby/vim-ruby'
Plug 'tsaleh/vim-tmux'
Plug 'Puppet-Syntax-Highlighting'
Plug 'JSON.vim'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-markdown'
Plug 'vim-scripts/jade.vim'
Plug 'wavded/vim-stylus'
Plug 'slim-template/vim-slim'
Plug 'elixir-lang/vim-elixir'
Plug 'Blackrush/vim-gocode'
Plug 'ekalinin/Dockerfile.vim'
Plug 'groenewege/vim-less'
Plug 'mustache/vim-mustache-handlebars'
Plug 'mtscout6/vim-cjsx'
"Plug 'rust-lang/rust', {'rtp': 'src/etc/vim/'}
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

Plug 'miyakogi/conoline.vim'
Plug 'miyakogi/slateblue.vim'

" Add plugins to &runtimepath
call plug#end()
