call plug#begin()

Plug 'jiangmiao/auto-pairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'preservim/nerdtree'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'justinmk/vim-sneak'
Plug 'folke/tokyonight.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'numToStr/Comment.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'mhinz/vim-startify'

call plug#end()

set number
set relativenumber
set autoindent
set nocompatible
set path+=**
set wrap
set scrolloff=13
set tabstop=6
set shiftwidth=6
set encoding=UTF-8
set numberwidth=4
set termguicolors
set ignorecase
set smartcase
set nohlsearch
" set listchars=tab:→\ ,trail:.,extends:#,nbsp:.,eol:~
" set list
set breakindent
set mouse=a
set updatetime=300
set signcolumn=number

syntax on
filetype plugin on

let mapleader = " "

let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let NERDTreeMinimalUI = 1 " removes top help indicator

let g:sneak#label = 1

let tokyonight_italic_comments = 0
let tokyonight_italic_keywords = 0
let tokyonight_style = "night"
let tokyonight_transparent = 1
let tokyonight_hide_inactive_statusline = 1
let tokyonight_lualine_bold = 1

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunction

function! s:show_documentation()
	if CocAction('hasProvider', 'hover')
		call CocActionAsync('doHover')
	else
		call feedkeys('K', 'in')
	endif
endfunction

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

lua require("config")

source ~/.config/nvim/keybinds.vim

colorscheme tokyonight
