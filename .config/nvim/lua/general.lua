local g = vim.g
local opt = vim.opt

opt.ignorecase = true
opt.number = true
opt.termguicolors = true
opt.relativenumber = true
opt.guicursor = nil
opt.cursorline = true
opt.completeopt = {'menu', 'menuone', 'noselect'}
opt.list = true
opt.laststatus = 3
opt.scrolloff = 5
opt.wrap = true

opt.listchars = {
	tab = '❘-',
	trail = '·',
	lead = '·',
	extends = '»',
	precedes = '«',
	nbsp = '×',
}

g.mapleader = ' '
g.nofixedenofline = true

vim.cmd [[ set nocompatible ]]
vim.cmd [[ set undodir=~/.local/share/nvim/undodir ]]
vim.cmd [[ set undofile ]]
