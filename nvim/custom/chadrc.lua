local M = {}

M.plugins = {

	options = {
		lspconfig = {
			setup_lspconf = "custom.plugins.lspconfig",
		},

		statusline = {
			separator_style = "round",
		},
	},

	remove = {
		"ray-x/lsp_signature.nvim",
	},

	user = require("custom.plugins"),
}

M.ui = {
	theme = "tokyonight",
}

M.mappings = require("custom.mappings")
require("custom.options")
require("custom.autocmds")

return M
