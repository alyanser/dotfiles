local M = {}

M.ui = {
        theme = "tokyonight",
}

M.plugins = {
	options = {
		lspconfig = {
			setup_lspconf = "custom.plugins.lspconfig",
		},
	},
}

M.options = {
        user = function()
                vim.opt.relativenumber = true
                vim.opt.scrolloff = 15
                vim.opt.ignorecase = true

                vim.o.hlsearch = false
                vim.o.guicursor = nil
                vim.o.ignorecase = true
                vim.o.smartcase = true

		vim.opt.clipboard = nil
		vim.opt.ruler = true
        end
}

vim.cmd [[
	au BufWinEnter * set formatoptions-=o 

	au FileType * set noexpandtab
	au FileType * set tabstop=8
	au FileType * set shiftwidth=8
	au FileType * set softtabstop=8
]]

return M
