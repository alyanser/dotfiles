local g = vim.g
local opt = vim.opt

opt.ignorecase = true
opt.number = true
opt.termguicolors = true
opt.relativenumber = false
opt.guicursor = nil
opt.cursorline = true
opt.completeopt = {'menu', 'menuone', 'noselect'}
opt.laststatus = 3
opt.scrolloff = 2
opt.wrap = true

opt.list = true

opt.listchars = {
	tab = '❘-',
	-- trail = '·',
	-- lead = '·',
	extends = '»',
	precedes = '«',
	nbsp = '×',
}

g.mapleader = ' '
g.nofixedenofline = true

vim.cmd [[ set nocompatible ]]
vim.cmd [[ set undodir=~/.local/share/nvim/undodir ]]
vim.cmd [[ set undofile ]]
vim.cmd [[ set noswapfile ]]
