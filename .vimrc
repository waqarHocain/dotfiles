" " Enable 24-bit true colors if your terminal supports it.
if (has("termguicolors"))
  " https://github.com/vim/vim/issues/993#issuecomment-255651605
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

  set termguicolors
endif

set nocompatible

syntax on
set number
set nowrap

filetype on
" enable loading indent file for filetype
filetype plugin indent on   

set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set smartindent

" Show popup even when only 1 match, also select the longest
" word by default 
set completeopt=menuone,longest

" copy to  system clipboard when yanking
set clipboard=unnamed

set splitbelow
set splitright

set noswapfile
set nobackup
set noerrorbells

set incsearch
set ignorecase
set smartcase

set colorcolumn=80
highlight Normal ctermbg=1  guibg=lightgrey

" ---------------- Plugins -------------------

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

Plug 'ctrlpvim/ctrlp.vim'

" change cursor in insert mode
Plug 'wincent/terminus'

" auto complete popup
Plug 'vim-scripts/AutoComplPop'

" python code formatter
Plug 'psf/black', {'branch': 'stable'}

" ColorSchemes
Plug 'danwagnerco/tomorrow-theme', {'rtp': 'vim'}
Plug 'gruvbox-community/gruvbox'
Plug 'rakr/vim-one'

call plug#end()

" Use colorscheme
"colorscheme Tomorrow-Night-Bright
colorscheme gruvbox
set background=dark

" ------------ Mappings -------------------

" shift to normal mode
inoremap jk <esc>

" put current line in center of screen
nnoremap <space> zz

" move current line up
nnoremap <up> dd<up>P

" move current line down
nnoremap <down> ddp

" move between splits
nnoremap <right> <C-w>l
nnoremap <left> <C-w>h
nnoremap <up> <C-w>k
nnoremap <down> <C-w>j

" delete whole word instead of a character when backspace is pressed
" TODO: this mapping isn't working as expected :( #fixit
inoremap <BS> <C-w>


" ------------ Autocommands -------------------

" set tab to 4 spaces for python files
autocmd filetype python set tabstop=4 softtabstop=4 shiftwidth=4

" format python file using Black formatter
autocmd BufWritePre *.py execute ':Black'
