" config/vim/init.vim

" ~/APPDATA/Local/nvim/init.vim
" Or: stdpath('config') . '/init.vim'

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'

" call plug#begin('~/.vim/plugged')
call plug#begin(stdpath('data') . '/plugged')

" Make sure you use single quotes

" https://github.com/tpope/vim-sensible
Plug 'tpope/vim-sensible'

" https://github.com/scrooloose/nerdtree
Plug 'scrooloose/nerdtree'

" Initialize plugin system
call plug#end()

" Open a NERDTree automatically when vim starts up
autocmd vimenter * NERDTree

" Open a NERDTree automatically when vim starts up if no files were specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Note: Now start vim with plain vim, not vim .

" EOF
