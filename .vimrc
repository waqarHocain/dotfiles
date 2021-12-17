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

" copy to  system clipboard when yanking
set clipboard=unnamedplus

set splitbelow
set splitright

set noswapfile
set nobackup
set noerrorbells

set incsearch
set ignorecase
set smartcase

" Always show signcolumn  on left
set signcolumn=yes


" ---------------- Plugins -------------------

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

Plug 'ctrlpvim/ctrlp.vim'

" change cursor in insert mode
Plug 'wincent/terminus'

" auto complete 
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" python code formatter
Plug 'psf/black', {'branch': 'stable'}

" auto close brackets (), {}, <> etc
Plug 'raimondi/delimitmate'
"
" auto close html tags
Plug 'alvan/vim-closetag'

" JS/HTML code formatter
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

" syntax highlighting for JS and JSX
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

" test runner
Plug 'vim-test/vim-test'

" load local vimrc files (named '.lvimrc' by default)
Plug 'embear/vim-localvimrc'

" ColorSchemes
Plug 'danwagnerco/tomorrow-theme', {'rtp': 'vim'}
Plug 'gruvbox-community/gruvbox'
Plug 'rakr/vim-one'

call plug#end()

" Use colorscheme
" colorscheme Tomorrow-Night-Bright
colorscheme gruvbox
set background=dark

set colorcolumn=80
highlight Normal guibg=black

" -------- Plugin Specific ---------------
" Ctrl-p: ignore node_modules, .git dirs
let g:ctrlp_custom_ignore = 'node_modules\|\.git'

" ------------ Mappings -------------------
let mapleader = " "

" shift to normal mode
inoremap jk <esc>

" put current line in center of screen
nnoremap <Leader>c zz

" switch to last opened file
nnoremap <Leader><tab> <C-^>

" test runner
nmap <silent> <Leader>s :TestSuite<CR>
nmap <silent> <Leader>f :TestFile<CR>
nmap <silent> <Leader>l :TestLast<CR>
nmap <silent> <Leader>n :TestNearest<CR>
nmap <silent> <Leader>V :TestVisit<CR>

" move between splits
nnoremap <right> <C-w>l
nnoremap <left> <C-w>h
nnoremap <up> <C-w>k
nnoremap <down> <C-w>j

" send vim to background, switch to terminal
nnoremap <leader>b <C-z>

" Make <Enter> auto-select the first completion item
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" delete whole word instead of a character when backspace is pressed
" TODO: this mapping isn't working as expected :( #fixit
" inoremap <BS> <C-w>


filetype on
" enable loading indent file for filetype
filetype plugin indent on   

" ------------ Autocommands -------------------

" set tab to 4 spaces for python files
autocmd filetype python set tabstop=4 softtabstop=4 shiftwidth=4

" format python file using Black formatter
autocmd BufWritePre *.py execute ':Black'

" format js/html using prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.html,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
