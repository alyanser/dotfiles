local lsp = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lsp["clangd"].setup{
	single_file_support = true,
	command = {'clangd', '--background-index', '-j=$(nproc)', '--header-insertion=never', '--clang-tidy=false', '--completion-style=detailed'},
	capabilities = capabilities,
	completion = {
		workspaceWord = false,
		showWord = "Disable"
	},
}

local servers = {"pyright", "cmake", "bashls"}

for _, server in ipairs(servers) do
	lsp[server].setup{
		capabilities = capabilities
	}
end

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
