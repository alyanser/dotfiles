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
                vim.opt.tabstop = 8
                vim.opt.shiftwidth = 8
                vim.opt.ignorecase = true
                vim.o.hlsearch = false
                vim.o.guicursor = nil
                vim.o.ignorecase = true
                vim.o.smartcase = true
        end
}

return M
