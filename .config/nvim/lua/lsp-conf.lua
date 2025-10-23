-- Define clangd config
vim.lsp.config['clangd'] = {
    single_file_support = true,
    cmd = {'clangd', '--log=error', '--header-insertion=never', '--clang-tidy=true', '--completion-style=detailed', '--background-index=true', '-j=2'},
    completion = {
        workspaceWord = false,
        showWord = "Disable"
    },
    signature_help = true,
}

-- Enable clangd
vim.lsp.enable('clangd')

-- Define pylsp config
vim.lsp.config['pylsp'] = {
    settings = {
        pylsp = {
            configurationSources = { "flake8" },
            plugins = {
                flake8 = { enabled = false }
            },
        },
    },
}

-- Enable pylsp
vim.lsp.enable('pylsp')

-- Enable other servers (defaults from lspconfig)
local servers = {"bashls"}
for _, server in ipairs(servers) do
    vim.lsp.enable(server)
end

-- Your diagnostic signs config (unchanged)
local signs = { Error = "", Warn = "", Hint = "", Info = "" }

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
