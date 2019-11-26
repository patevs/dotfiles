" -------------------- "
" config/nvim/init.vim "
" -------------------- "

" NeoVim configuration file location:
"   ~/APPDATA/Local/nvim/init.vim
"   Or: stdpath('config') . '/init.vim'

" Resources:
"   https://devhints.io/vim
"   https://devhints.io/vimscript

" ----------------------------------------------------------------------- "

" No need to set explicitly as Neovim always uses UTF-8 as the default encoding.
" set encoding=UTF-8

" Set location to python executables
" let g:python_host_prog  = '/path/to/python'
" let g:python3_host_prog  = '/path/to/python3'

" Enable/disable python support
" let g:loaded_python_provider = 0
" let g:loaded_python3_provider = 0

" ----------------------------------------------------------------------- "

" Ensure vim-plug is installed
"   https://github.com/junegunn/vim-plug
"   https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation

" AutoInstall vim-plug
" if empty(glob('~\AppData\Local\nvim\autoload\plug.vim'))
"   silent !curl -fLo ~\AppData\Local\nvim\autoload\plug.vim --create-dirs
"     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

if empty(glob('~\AppData\Local\nvim\autoload\plug.vim'))
    silent !curl -fLo C:\Users\Patrick\AppData\Local\nvim\autoload\plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ----------------------------------------------------------------------- "

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'

call plug#begin(stdpath('data') . '/plugged')
" Make sure you use single quotes

" Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'jistr/vim-nerdtree-tabs'
" Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

Plug 'sheerun/vim-polyglot'
" Plug 'editorconfig/editorconfig-vim'
" Plug 'othree/html5.vim'

" (`as` will install the plugin in a directory called 'dracula' instead of just 'vim')
Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" let g:airline_theme='simple'
" let g:airline_theme='dracula.vim'
Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
" Remember to run :PlugInstall
call plug#end()

" filetype plugin on

" NERDTree
" Open a NERDTree automatically when neovim starts up
" autocmd vimenter * NERDTree

" Open a NERDTree automatically when neovim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Note: Now start neovim with plain nvim, not nvim .

" ----------------------------------------------------------------------- "

" echo "Hello Pat!"
" let name = "John"
" echo "Hello, " . name


" EOF "
