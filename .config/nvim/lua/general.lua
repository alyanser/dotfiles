local g = vim.g
local opt = vim.opt

opt.ignorecase = true
opt.number = true
opt.termguicolors = true
opt.relativenumber = false
opt.guicursor = nil
opt.autoindent = true
opt.cursorline = false
opt.completeopt = {'menu', 'menuone', 'noinsert', 'noselect'}
opt.list = true
opt.laststatus = 3
opt.scrolloff = 1
opt.wrap = false

opt.listchars = {
	tab = '❘-',
	trail = '·',
	lead = '·',
	extends = '»',
	precedes = '«',
	nbsp = '×',
}

g.mapleader = ' '
g.noexpandtab = true
g.nofixedenofline = true
g.loaded_matchparen = true

vim.cmd [[ set mouse=a ]]
vim.cmd [[ set nocompatible ]]
vim.cmd [[ set undodir=~/.local/share/nvim/undodir ]]
vim.cmd [[ set undofile ]]
