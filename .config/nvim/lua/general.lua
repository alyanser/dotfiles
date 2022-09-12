local g = vim.g
local opt = vim.opt

opt.ignorecase = true
opt.number = true
opt.relativenumber = false
opt.termguicolors = true
-- opt.guicursor = nil
opt.autoindent = true
opt.cursorline = true
opt.completeopt = {'menu', 'menuone', 'noinsert', 'noselect'}
opt.list = true
opt.scrolloff = 8
opt.laststatus = 3
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
g.noexpandtab = true
g.nofixedenofline = true
g.loadedmatchparen = false

vim.cmd [[ set mouse=a ]]
vim.cmd [[ set nocompatible ]]
vim.cmd [[ set noshowcmd ]]
vim.cmd [[ syntax on ]]
