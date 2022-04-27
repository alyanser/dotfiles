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
Plug 'tpope/vim-obsession'

call plug#end()

set number relativenumber
set nocompatible
set path+=**
set wrap
set scrolloff=13
set tabstop=8
set shiftwidth=8
set encoding=UTF-8
set numberwidth=3
set termguicolors
set ignorecase
set smartcase
set incsearch
set nohlsearch
set mouse=a
set guicursor=
set shortmess+=c
set signcolumn=yes

hi! CocErrorSign guifg=#FF4500

syntax on
filetype plugin on

let mapleader = " "

let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let NERDTreeMinimalUI = 1 " removes top help indicator

let g:sneak#label = 1

let tokyonight_italic_comments = 0
let tokyonight_italic_keywords = 1
let tokyonight_style = "night"
let tokyonight_hide_inactive_statusline = 1
let tokyonight_lualine_bold = 1

colorscheme tokyonight

function! s:show_documentation()
	if CocAction('hasProvider', 'hover')
		call CocActionAsync('doHover')
	else
		call feedkeys('K', 'in')
	endif
endfunction

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

lua require("config")

" keybindings

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <c-space> coc#refresh()

" telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nmap <silent> <leader>k <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>j <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

nmap <leader>rn <Plug>(coc-rename)
xmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <leader>cl  <Plug>(coc-codelens-action)

nnoremap <silent> gb :BufferLinePick<CR>
nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>
nnoremap <silent><leader>h <Cmd>BufferLineCycleNext<CR>
nnoremap <silent><leader>l <Cmd>BufferLineCyclePrev<CR>

" nerdtree
nnoremap <leader>t :NERDTreeFocus<CR>
nnoremap <Leader>T :NERDTreeToggle<CR>

nnoremap <silent>ch <Cmd>CocCommand clangd.switchSourceHeader<CR>

nnoremap <silent><leader>o <Cmd>Obsess<CR>
nnoremap <silent><leader>O <Cmd>Obsess!<CR>
