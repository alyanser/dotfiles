local lsp = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lsp["clangd"].setup{
	single_file_support = true,
	command = {'clangd', '--background-index', '-j=6', '--head-insertion=never', '--clang-tidy=true', '--completion-style=detailed'},
	capabilities = capabilities,
	completion = {
		workspaceWord = false,
		showWord = "Disable"
	},
}

lsp["pyright"].setup{
	capabilities = capabilities,
}

lsp["bashls"].setup{
	capabilities = capabilities,
}

lsp["cmake"].setup{
	capabilities = capabilities,
}

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
