local g = vim.g
local opt = vim.opt

g.autoformat = false
g.nofixedenofline = true

opt.ignorecase = true
opt.relativenumber = false
opt.guicursor = "n-v-c:block,i:hor30"
opt.laststatus = 3
opt.scrolloff = 3
opt.wrap = true
opt.swapfile = false
opt.cursorline = false
opt.clipboard = ""  -- Don't use system clipboard
opt.signcolumn = "yes"
opt.numberwidth = 5

opt.indentkeys:remove(":")
opt.list = false
