set nocompatible
set guifont=Fira\ Code:h14
if filereadable(expand("~/.vim/plugins.vim"))
  source ~/.vim/plugins.vim
endif
if filereadable(expand("~/.vim/global.vim"))
  source ~/.vim/global.vim
endif
if filereadable(expand("~/.vim/coc.vim"))
  source ~/.vim/coc.vim
endif
