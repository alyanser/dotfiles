local tab_len = 8

local g = vim.g
local opt = vim.opt

g.mapleader = ' '
g.tabstop = tab_len
g.shiftwidth = tab_len
g.softtabstop = tab_len
g.noexpandtab = true

opt.ignorecase = true
opt.number = true
-- opt.relativenumber = true
opt.termguicolors = true
opt.guicursor = nil

opt.list = true
opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

g.nofixedenofline = true
g.loadedmatchparen = true
g.one_allow_italics = true

g.tokyonight_style = "night"
g.tokyonight_dark_float = false
g.background = "dark"

g.tokyonight_colors = {
	error = "#000000",
	warning = "#000000",
	hint = "#000000",
}

vim.cmd [[ colorscheme tokyonight ]]
vim.cmd [[ set mouse=a ]]
