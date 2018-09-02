let mapleader = "\<Space>"

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug '/usr/share/vim/vimfiles'
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-eunuch'
Plug 'dag/vim-fish'
Plug 'mattn/emmet-vim'
Plug 'tomtom/tcomment_vim'
call plug#end()

" Fzf
nnoremap <c-p> :Files<cr>
let g:fzf_action = {
    \ 'ctrl-s': 'split',
    \ 'ctrl-v': 'vsplit'
    \ }

" Tab navigation like Firefox.
" nnoremap <C-S-Tab> :tabprevious<CR>
" nnoremap <C-Tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
" inoremap <C-S-Tab> <Esc>:tabprevious<CR>i
" inoremap <C-Tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

" No arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Jump to start and end of line using the home row keys
" By default H and L are mapped to TOP and BOTTOM
map H ^
map L $

" Neat X clipboard integration
" ,p will paste clipboard into buffer
" ,c will copy entire buffer into clipboard
noremap <leader>p :read !xsel --clipboard --output<cr>
noremap <leader>c :w !xsel -ib<cr><cr>

" Quick save
nmap <leader>w :w<CR>

" Editor
set encoding=utf-8
set number
set relativenumber
set expandtab
set shiftwidth=4
set nosmartindent
set scrolloff=4
set nofoldenable
set nocursorline
set incsearch
set ignorecase
set smartcase
set nolist
set listchars=nbsp:¬,extends:»,precedes:«,trail:•

" Don't show -- INSERT --
set noshowmode
set showcmd

" Only redrawn when inputing keys
set lazyredraw

" Automatically reload files edited outside of vim
autocmd FocusGained * :checktime
set autoread

" Persistent undo
set undodir=~/.cache/vimundo
set undofile

" Color scheme
colorscheme minilux
