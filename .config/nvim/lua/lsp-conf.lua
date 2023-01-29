local lsp = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lsp["clangd"].setup{
	single_file_support = true,
	command = {'clangd', '--background-index', '-j=4', '--head-insertion=true', '--clang-tidy=true', '--completion-style=detailed'},
	capabilities = capabilities,
	completion = {
		workspaceWord = false,
		showWord = "Disable"
	},
}

local servers = {"cmake", "bashls", "sumneko_lua"}

for _, server in ipairs(servers) do
	lsp[server].setup{
		capabilities = capabilities
	}
end


require'lspconfig'.jedi_language_server.setup{
	capabilities = capabilities
}

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
