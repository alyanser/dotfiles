call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-sensible'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'
Plug 'ryanoasis/vim-devicons'
Plug 'machakann/vim-highlightedyank'
Plug 'sainnhe/sonokai'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

set number
set autoindent
set nocompatible
set path+=**
set wildmenu
set wrap
set linebreak
set showbreak=>
set ttyfast
set laststatus=2
set scrolloff=10
set showcmd
set smarttab
set tabstop=8
set shiftwidth=8
set mat=1
set cursorline
set ruler
set autoread
set incsearch
set hlsearch
set smartcase
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline
set display+=lastline

set numberwidth=4
let g:netrw_banner=0

let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1

let g:airline_theme='sonokai'

syntax enable
filetype plugin on

let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1

colorscheme sonokai

if exists('+termguicolors') && ($TERM == "xterm-256color" || $TERM == "tmux-256color")
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

" Line bubbling
nnoremap <silent> <c-j> :m .+1<CR>==
nnoremap <silent> <c-k> :m .-2<CR>==
nnoremap <silent> <c-j> :m .+1<CR>
nnoremap <silent> <c-k> :m .-2<CR>
inoremap <silent> <c-j> <Esc>:m .+1<CR>==gi
inoremap <silent> <c-k> <Esc>:m .-2<CR>==gi
vnoremap <silent> <c-j> :m '>+1<CR>gv=gv
vnoremap <silent> <c-k> :m '<-2<CR>gv=gv

" escape after search will remove match highlight
nnoremap <silent> <esc> :noh<cr><esc>
