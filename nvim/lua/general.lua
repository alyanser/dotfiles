local g = vim.g
local opt = vim.opt

opt.ignorecase = true
opt.number = true
opt.termguicolors = true
opt.guicursor = nil

-- opt.list = true
-- opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

g.mapleader = ' '
g.noexpandtab = true
g.nofixedenofline = true
g.loadedmatchparen = true

g.tokyonight_style = "night"
g.tokyonight_hide_inactive_statusline = false
g.background = "dark"

g.tokyonight_colors = {
	error = "red",
	warning = "orange",
	hint = "purple",
}

vim.cmd [[ colorscheme sonokai ]]
vim.cmd [[ set mouse=a ]]
