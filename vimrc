call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'google/vim-colorscheme-primary'
Plug 'morhetz/gruvbox'

Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'preservim/nerdcommenter'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

call plug#end()


syntax on
set tabstop=2
set autoindent
set softtabstop=2
set expandtab
set cursorline
set nu
map <C-o> :NERDTreeToggle<CR>
set noshowmode


set background=dark
