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
let g:python_host_prog  = 'C:\tools\python2\python.exe'
let g:python3_host_prog  = 'C:\tools\python3\python.exe'
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
" Plug 'mhinz/vim-startify'
" Plug 'jceb/vim-orgmode'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" Plug 'jiangmiao/auto-pairs'

" Plug 'scrooloose/nerdcommenter
" Plug 'tpope/vim-commentary'

Plug 'sheerun/vim-polyglot'
" Plug 'editorconfig/editorconfig-vim'
" Plug 'othree/html5.vim'

" Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'jistr/vim-nerdtree-tabs'
" Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/vim-gitbranch'

" (`as` will install the plugin in a directory called 'dracula' instead of just 'vim')
" Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" let g:airline_theme='simple'
" let g:airline_theme='dracula.vim'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
" Remember to run :PlugInstall
call plug#end()

" filetype plugin on

" ----------------------------------------------------------------------- "

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

" Enable deplete plugin
let g:deoplete#enable_at_startup = 1

" ----------------------------------------------------------------------- "

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

" echo "Hello Pat!"
" let name = "Pat"
" echo "Hello, " . name


" EOF "
