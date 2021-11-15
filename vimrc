" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'morhetz/gruvbox'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align

" Any valid git URL is allowed

" Multiple Plug commands can be written in a single line using | separators

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)

" Plugin options

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)

" Initialize plugin system
call plug#end()


syntax on
set tabstop=4
set autoindent
set softtabstop=4
set expandtab
set cursorline
set nu
map <C-o> :NERDTreeToggle<CR>
set noshowmode

colorscheme gruvbox
set background=dark
