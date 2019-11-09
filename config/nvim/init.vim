" -------------------- "
" config/nvim/init.vim "
" -------------------- "

" NeoVim configuration file location:
"   ~/APPDATA/Local/nvim/init.vim
"   Or: stdpath('config') . '/init.vim'

" ----------------------------------------------------------------------- "

" Set location to python executables
" let g:python_host_prog  = '/path/to/python'
" let g:python3_host_prog  = '/path/to/python3'

" Enable/disable python support
" let g:loaded_python_provider = 1
let g:loaded_python3_provider = 0

" ----------------------------------------------------------------------- "

" Ensure vim-plug is install
"   https://github.com/junegunn/vim-plug
"   https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation

" AutoInstall vim-plug
if empty(glob('~\AppData\Local\nvim\autoload\plug.vim'))
  silent !curl -fLo C:\Users\Patrick\AppData\Local\nvim\autoload\plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  " autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ----------------------------------------------------------------------- "

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'

call plug#begin(stdpath('data') . '/plugged')
" Make sure you use single quotes
" Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'

" Initialize plugin system
call plug#end()

" NERDTree
" Open a NERDTree automatically when vim starts up
" autocmd vimenter * NERDTree

" Open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Note: Now start vim with plain vim, not vim .


" EOF "
