call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'bling/vim-airline'
Plug '/usr/share/vim/vimfiles'
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-eunuch'
Plug 'dag/vim-fish'
" Plug '~/.vim/plugged_custom/rust.vim'
" Plug 'jiangmiao/auto-pairs'
Plug 'tomtom/tcomment_vim'
call plug#end()

let g:fzf_action = {
    \ 'ctrl-s': 'split',
    \ 'ctrl-v': 'vsplit'
    \ }
nnoremap <c-p> :FZF<cr>

set number
set relativenumber
set nocursorline
set expandtab
set shiftwidth=4
set nosmartindent
set scrolloff=4
set mouse=a
" set cursorline
" set termguicolors

colorscheme minilux
