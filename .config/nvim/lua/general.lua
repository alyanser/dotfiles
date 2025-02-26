local g = vim.g
local opt = vim.opt

opt.ignorecase = true
opt.number = true
opt.termguicolors = true
opt.relativenumber = false
opt.guicursor = "n-v-c:block,i:hor30"
opt.guicursor = {}
opt.completeopt = {'menu', 'menuone', 'noselect'}
opt.laststatus = 3
opt.scrolloff = 8
opt.wrap = true
opt.formatoptions = "jcroqlnt"
opt.shiftround = true
opt.signcolumn = "yes"
opt.undolevels = 50000
opt.undofile = true
opt.swapfile = false
opt.compatible = false
opt.cursorline = false


opt.splitkeep = "screen"
opt.shortmess = "filnxtToOFWIcC"

g.markdown_recommended_style = 0

g.mapleader = ' '
g.nofixedenofline = true

g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1
g.loaded_netrwFileHandlers = 1
g.loaded_netrw_gitignore = 1

vim.loader.enable()
