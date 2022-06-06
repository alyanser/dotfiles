local lsp = require("lspconfig")

lsp["clangd"].setup{
	single_file_support = true,
	command = { 'clangd', '--background-index', '-j=4', '--head-insertion=never', '--clang-tidy=false', '--completion-style=detailed' },
	on_attach = require("aerial").on_attach
}

-- local rest_lang_servers = { "cmake", "bashls", "pyright" }
--
-- for _, name in ipairs(rest_lang_servers) do
-- 	lsp[name].setup{}
-- end
