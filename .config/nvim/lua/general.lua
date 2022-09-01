local g = vim.g
local opt = vim.opt

opt.ignorecase = true
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.guicursor = nil
opt.autoindent = true
opt.cursorline = true
opt.completeopt = {'menu', 'menuone', 'noinsert', 'noselect'}
opt.lazyredraw = true
opt.list = true
opt.scrolloff = 5
opt.sidescrolloff = 3
opt.splitbelow = true
opt.splitright = true
opt.wrap = false
opt.redrawtime = 1500
opt.timeoutlen = 250
opt.ttimeoutlen = 10
opt.updatetime = 10

opt.listchars = {
	-- tab = '❘-',
	tab = '»-',
	trail = '·',
	lead = '·',
	extends = '»',
	precedes = '«',
	nbsp = '×',
}

g.mapleader = ' '
g.noexpandtab = true
g.nofixedenofline = true
g.loadedmatchparen = true

g.tokyonight_style = "storm"
g.tokyonight_hide_inactive_statusline = false

g.tokyonight_colors = {
	error = "red",
	warning = "orange",
	hint = "purple",
}

vim.cmd [[ set mouse=a ]]
vim.cmd [[ set nocompatible ]]
vim.cmd [[ syntax on ]]
vim.cmd [[ colorscheme tokyonight ]]
