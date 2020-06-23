" ------------- "
" nvim/init.vim "
" ------------- "
"
"
"                         ███████████████████████████
"                         ███████▀▀▀░░░░░░░▀▀▀███████
"                         ████▀░░░░░░░░░░░░░░░░░▀████
"                         ███│░░░░░░░░░░░░░░░░░░░│███
"                         ██▌│░░░░░░░░░░░░░░░░░░░│▐██
"                         ██░└┐░░░░░░░░░░░░░░░░░┌┘░██
"                         ██░░└┐░░░░░░░░░░░░░░░┌┘░░██
"                         ██░░┌┘▄▄▄▄▄░░░░░▄▄▄▄▄└┐░░██
"                         ██▌░│██████▌░░░▐██████│░▐██
"                         ███░│▐███▀▀░░▄░░▀▀███▌│░███
"                         ██▀─┘░░░░░░░▐█▌░░░░░░░└─▀██
"                         ██▄░░░▄▄▄▓░░▀█▀░░▓▄▄▄░░░▄██
"                         ████▄─┘██▌░░░░░░░▐██└─▄████
"                         █████░░▐█─┬┬┬┬┬┬┬─█▌░░█████
"                         ████▌░░░▀┬┼┼┼┼┼┼┼┬▀░░░▐████
"                         █████▄░░░└┴┴┴┴┴┴┴┘░░░▄█████
"                         ███████▄░░░░░░░░░░░▄███████
"                         ██████████▄▄▄▄▄▄▄██████████
"                         ███████████████████████████
"
"                ╔══════════════════════════════════════════╗
"                ║           ⎋ HERE BE DRAGONS ⎋            ║
"                ╚══════════════════════════════════════════╝
"
" Default NeoVim configuration file location:
"   stdpath('config') . '/init.vim'
"
" Resources:
"   https://devhints.io/vim
"   https://devhints.io/vimscript
"
" ------------------- "
" Basic Configuration "
" ------------------- "

" No need to set this explicitly as Neovim always uses UTF-8 as the default encoding.
set encoding=UTF-8

" You want Vim, not vi. When Vim finds a vimrc, 'nocompatible' is set anyway.
" We set it explicitely to make our position clear!
set nocompatible

set autoread " detect when a file is changed

set history=1000 " change history to 1000
set textwidth=120

" filetype plugin on
filetype plugin indent on  " Load plugins according to detected filetype.
syntax on                  " Enable syntax highlighting.

" set autoindent             " Indent according to previous line.
" set expandtab              " Use spaces instead of tabs.
" set softtabstop =4         " Tab key indents by 4 spaces.
" set shiftwidth  =4         " >> indents by 4 spaces.
" set shiftround             " >> indents to next multiple of 'shiftwidth'.
" set hidden                 " Switch between buffers without having to save first.

set backspace=indent,eol,start " make backspace behave in a sane manner
set clipboard=unnamed

if has('mouse')
  set mouse=a
endif

" display settings

" set laststatus  =2         " Always show statusline.
" set display     =lastline  " Show as much as possible of the last line.

" set showmode               " Show current mode in command-line.
" set showcmd                " Show already typed keys when more are expected.

" set incsearch              " Highlight while searching with / or ?.
" set hlsearch               " Keep matches highlighted.

set ttyfast                " Faster redrawing.
set lazyredraw             " Only redraw when necessary.

" set splitbelow             " Open new windows below the current window.
" set splitright             " Open new windows right of the current window.

" Disable cursor styling
"   See `:help 'guicursor'` for more details.
:set guicursor=
" Workaround some broken plugins which set guicursor indiscriminately.
:autocmd OptionSet guicursor noautocmd set guicursor=

" set cursorline             " Find the current line quickly.
" set wrapscan               " Searches wrap around end-of-file.
" set report      =0         " Always report changed lines.
" set synmaxcol   =200       " Only highlight the first 200 columns.

" set list
" set modeline
" set modelines     =1
" set nostartofline
" set numberwidth   =1
" set ruler
" set shortmess     =aoOTI
" set showmatch

" The fish shell is not very compatible to other shells and unexpectedly
" breaks things that use 'shell'.
" if &shell =~# 'fish$'
"   set shell=/bin/bash
" endif

" ----------------------------------------------------------------------- "

" OS Specific Configuration

" let s:is_win = has('win32')
" let $v = $HOME.(s:is_win ? '\vimfiles' : '/.vim')

" if s:is_win
"   set shell=cmd.exe
"   set shellcmdflag=/c
"   set encoding=utf-8
" endif

" ----------------------------------------------------------------------- "

" Neovim Specific Configuration

" if has('nvim')
"   let $GIT_EDITOR = 'nvr -cc split --remote-wait'
"   let $ELIXIR_EDITOR = 'nvr -l +__LINE__ __FILE__'
"   if v:progpath =~# 'build/bin/nvim$'
    " for build/runtime/syntax/vim/generated.vim
"     let &runtimepath .= ','.$VIM.'/build/runtime'
"   endif
" else
"   filetype plugin indent on
"   syntax on
"   packadd! matchit
" endif

" ----------------------------------------------------------------------- "

" TODO: Check has('python2') & has('python3')

" Set location to python executables
" let g:python_host_prog  = 'C:\tools\python2\python.exe'
" let g:python3_host_prog  = 'C:\tools\python3\python.exe'
" Enable/disable python support
" let g:loaded_python_provider = 0
" let g:loaded_python3_provider = 0

" ----------------------------------------------------------------------- "

" ------- "
" Plugins "
" ------- "

" Ensure vim-plug is installed
"   https://github.com/junegunn/vim-plug
"   https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'

call plug#begin(stdpath('data') . '/plugged')
" Make sure you use single quotes

" Plug 'tpope/vim-sensible'
" Plug 'mhinz/vim-startify'
" Plug 'jceb/vim-orgmode'
" Plug 'chrisbra/unicode.vim', {'on': ['UnicodeName', 'UnicodeTable']}

" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" Plug 'jiangmiao/auto-pairs'

" Plug 'scrooloose/nerdcommenter
" Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-surround'

Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'
Plug 'othree/html5.vim'
" 'mzlogin/vim-markdown-toc'

" Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'jistr/vim-nerdtree-tabs'
" Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/vim-gitbranch'

" (`as` will install the plugin in a directory called 'dracula' instead of just 'vim')
Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" let g:airline_theme='simple'
" let g:airline_theme='dracula.vim'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'

" Plug 'KabbAmine/zeavim.vim'

" Plug 'ThePrimeagen/vim-be-good'
" execute `:UpdateRemotePlugins` to install vim-be-good

" Plug 'voldikss/vim-floaterm'

" Initialize plugin system
" Remember to run :PlugInstall
call plug#end()

" ----------------------------------------------------------------------- "

" -------------------- "
" Plugin Configuration "
" -------------------- "

" Enable deplete plugin
" let g:deoplete#enable_at_startup = 1

" NERDTree
" Open NERDTree automatically when neovim starts up
" autocmd vimenter * NERDTree

" Open NERDTree automatically when neovim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Note: Now start neovim with plain nvim, not nvim .

" Open NERDTree automatically when neovim starts up on opening a directory
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" Note: Executing vim ~/some-directory will open NERDTree and a new edit window. exe 'cd '.argv()[0] sets the pwd of the new edit window to ~/some-directory

" Open NERDTree with Ctrl+b:
map <C-b> :NERDTreeToggle<CR>

" Close neovim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Change default arrows
" let g:NERDTreeDirArrowExpandable = '▸'
" let g:NERDTreeDirArrowCollapsible = '▾'

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" ----------------------------------------------------------------------- "

" nerdtree-git-plugin
" Set custom symbols
" let g:NERDTreeIndicatorMapCustom = {
"     \ "Modified"  : "✹",
"     \ "Staged"    : "✚",
"     \ "Untracked" : "✭",
"     \ "Renamed"   : "➜",
"     \ "Unmerged"  : "═",
"     \ "Deleted"   : "✖",
"     \ "Dirty"     : "✗",
"     \ "Clean"     : "✔︎",
"     \ 'Ignored'   : '☒',
"     \ "Unknown"   : "?"
"     \ }

" Show ignored status (a heavy feature may cost much more time)
" let g:NERDTreeShowIgnoredStatus = 1

" ----------------------------------------------------------------------- "

" ------------------------ "
" Status Bar Configuration "
" ------------------------ "

" Set lightline configuration
let g:lightline = {
  \ 'colorscheme': 'powerline',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'gitbranch#name'
  \ },
  \ }

" Dont show `-- INSERT --` because the mode information is displayed in the statusline.
set noshowmode

" ----------------------------------------------------------------------- "

" let name = "Pat"
" echo "Hello, " . name

" ----------------------------------------------------------------------- "

" EOF "
