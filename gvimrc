set nocompatible

source /usr/share/vim/google/google.vim


Glug codefmt plugin[mappings]
Glug codefmt-google
Glug youcompleteme-google
Glug piper plugin[mappings]
Glug critique plugin[mappings]
Glug blaze plugin[mappings]
Glug blazedeps plugin[mappings]
Glug syntastic-google
Glug buganizer plugin[mappings]


augroup autoformat_settings
  autocmd FileType borg,gcl,patchpanel AutoFormatBuffer gclfmt
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,javascript,typescript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType jslayout AutoFormatBuffer jslfmt
  autocmd FileType markdown AutoFormatBuffer mdformat
  autocmd FileType ncl AutoFormatBuffer nclfmt
  autocmd FileType python AutoFormatBuffer pyformat
  autocmd FileType soy AutoFormatBuffer soyfmt
  autocmd FileType textpb AutoFormatBuffer text-proto-format
  autocmd FileType proto AutoFormatBuffer protofmt
  autocmd FileType sql AutoFormatBuffer format_sql
augroup END


call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'google/vim-colorscheme-primary'
Plug 'morhetz/gruvbox'

Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'preservim/nerdcommenter'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

call plug#end()

filetype plugin indent on
syntax on
set autoindent
set expandtab
set cursorline
set nu
map <C-o> :NERDTreeToggle<CR>
set noshowmode

set background=dark
