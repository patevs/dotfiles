" -------------------- "
" config/nvim/init.vim "
" -------------------- "

" NeoVim configuration file location:
"   ~/APPDATA/Local/nvim/init.vim
"   Or: stdpath('config') . '/init.vim'

" Ensure vim-plug is install
"   https://github.com/junegunn/vim-plug

" PowerShell:
" ```
" md ~\AppData\Local\nvim\autoload
" $uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
" (New-Object Net.WebClient).DownloadFile(
"   $uri,
"   $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
"     "~\AppData\Local\nvim\autoload\plug.vim"
"   )
" )
" ```

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'

" call plug#begin(stdpath('data') . '/plugged')

" Make sure you use single quotes

" https://github.com/tpope/vim-sensible
" Plug 'tpope/vim-sensible'

" Initialize plugin system
" call plug#end()


" EOF "
