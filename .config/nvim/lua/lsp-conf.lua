local lsp = require("lspconfig")

lsp["clangd"].setup{
	single_file_support = true,
	cmd = {'clangd', '--log=error', '--background-index', '-j=6', '--header-insertion=never', '--clang-tidy=false', '--completion-style=detailed'},
	completion = {
		workspaceWord = false,
		showWord = "Disable"
	},
}

local servers = {"pyright", "cmake", "bashls"}
-- local servers = {"cmake", "bashls"}

require'lspconfig'.intelephense.setup{
    on_attach = function(client, bufnr)
      print(vim.inspect(client.resolved_capabilities))
    end
}

for _, server in ipairs(servers) do
	lsp[server].setup{
		signature_help = false,
	}
end

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
