local g = vim.g
local opt = vim.opt

opt.autowrite = true
opt.cmdheight = 1
opt.ignorecase = true
opt.number = true
opt.termguicolors = true
opt.relativenumber = true
opt.guicursor = nil
opt.cursorline = false
opt.completeopt = {'menu', 'menuone', 'noselect'}
opt.laststatus = 3
opt.scrolloff = 4
opt.wrap = true
opt.list = true
opt.formatoptions = "jcroqlnt"
opt.shiftround = true
opt.signcolumn = "yes"
opt.smartindent = true
opt.undolevels = 50000
opt.undofile = true
opt.swapfile = false
opt.compatible = false

if vim.fn.has("nvim-0.9.0") == 1 then
	opt.splitkeep = "screen"
	opt.shortmess = "filnxtToOFWIcC"
end

opt.listchars = {
	tab = '❘-',
	trail = '·',
	lead = '·',
	extends = '»',
	precedes = '«',
	nbsp = '×',
}

vim.g.markdown_recommended_style = 0

g.mapleader = ' '
g.nofixedenofline = true
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

vim.cmd [[ set undodir=~/.local/share/nvim/undodir ]]
