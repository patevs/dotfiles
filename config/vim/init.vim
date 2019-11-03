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
" https://github.com/Xuyuanp/nerdtree-git-plugin
Plug 'Xuyuanp/nerdtree-git-plugin'
" https://github.com/jistr/vim-nerdtree-tabs
" Plug 'jistr/vim-nerdtree-tabs'

" https://github.com/iamcco/markdown-preview.nvim
" If you don't have nodejs and yarn
" use pre build
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
" If you have nodejs and yarn
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" https://github.com/SirVer/ultisnips
" Plug 'SirVer/ultisnips'
" https://github.com/honza/vim-snippets
" Plug 'honza/vim-snippets'

" https://github.com/vim-airline/vim-airline
" Plug 'vim-airline/vim-airline'
" https://github.com/vim-airline/vim-airline-themes
" Plug 'vim-airline/vim-airline-themes'

" Initialize plugin system
call plug#end()

" NERDTree
" Open a NERDTree automatically when vim starts up
" autocmd vimenter * NERDTree

" Open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Note: Now start vim with plain vim, not vim .

" MarkdownPreview
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 1

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1


" EOF
