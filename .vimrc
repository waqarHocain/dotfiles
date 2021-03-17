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
set scrolloff=4

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

" test runner
Plug 'vim-test/vim-test'

" ColorSchemes
Plug 'danwagnerco/tomorrow-theme', {'rtp': 'vim'}
Plug 'gruvbox-community/gruvbox'
Plug 'rakr/vim-one'

call plug#end()

" Use colorscheme
"colorscheme Tomorrow-Night-Bright
colorscheme gruvbox
set background=dark

set colorcolumn=80
highlight Normal guibg=black

" ------------ Mappings -------------------
let mapleader = ";"

" shift to normal mode
inoremap jk <esc>

" put current line in center of screen
nnoremap <space> zz

" test runner
nmap <silent> <Leader>s :TestSuite<CR>
nmap <silent> <Leader>f :TestFile<CR>

" move current line up
nnoremap <up> ddkP

" move current line down
nnoremap <down> ddjp

" move between splits
nnoremap <right> <C-w>l
nnoremap <left> <C-w>h
nnoremap <up> <C-w>k
nnoremap <down> <C-w>j

" send vim to background, switch to terminal
nnoremap <leader>b <C-z>

" delete whole word instead of a character when backspace is pressed
" TODO: this mapping isn't working as expected :( #fixit
inoremap <BS> <C-w>


filetype on
" enable loading indent file for filetype
filetype plugin indent on   

" ------------ Autocommands -------------------

" set tab to 4 spaces for python files
autocmd filetype python set tabstop=4 softtabstop=4 shiftwidth=4

" format python file using Black formatter
autocmd BufWritePre *.py execute ':Black'
