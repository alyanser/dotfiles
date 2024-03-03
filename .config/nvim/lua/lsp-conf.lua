local lsp = require("lspconfig")

lsp["clangd"].setup{
	single_file_support = true,
	cmd = {'clangd', '--log=error', '--header-insertion=never', '--clang-tidy=true', '--completion-style=detailed', '--background-index=false', '-j=6'},
	completion = {
		workspaceWord = false,
		showWord = "Disable"
	},
	signature_help = true,
}

local servers = {"bashls"}

require('lspconfig').intelephense.setup{
    on_attach = function(client, bufnr)
	print(vim.inspect(client.resolved_capabilities))
    end
}

for _, server in ipairs(servers) do
	lsp[server].setup{}
end

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
