local lsp = require("lspconfig")

lsp["clangd"].setup{
	single_file_support = true,
	cmd = {'clangd', '--log=error', '--header-insertion=never', '--clang-tidy=false', '--completion-style=detailed', '--background-index=true', '-j=6'},
	completion = {
		workspaceWord = false,
		showWord = "Disable"
	},
	signature_help = true,
}

local servers = {"bashls", "pylsp"}

for _, server in ipairs(servers) do
	lsp[server].setup{}
end

local  signs = { Error = "", Warn = "", Hint = "", Info = "" }

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = '',
            [vim.diagnostic.severity.HINT] = '󰌵',
            [vim.diagnostic.severity.INFO] = '',
        },
        numhl = {
            [vim.diagnostic.severity.WARN] = 'WarningMsg',
            [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
        },
    },
})
