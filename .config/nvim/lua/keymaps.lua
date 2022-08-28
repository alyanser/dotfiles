local nvim_set_keymap = vim.api.nvim_set_keymap
local opts = { noremap=true, silent=true }

nvim_set_keymap("n", "<C-t>", "<cmd> NeoTreeShowToggle <Return>", opts)

nvim_set_keymap("n", "<leader>s", "<cmd> ClangdSwitchSourceHeader <Return>", opts)

nvim_set_keymap("n", "gw", "<cmd> HopWord <Return>", opts)
nvim_set_keymap("n", "gn", "<cmd> HopChar1 <Return>", opts)
nvim_set_keymap("n", "g/", "<cmd> HopPattern <Return>", opts)
nvim_set_keymap("n", "g/", "<cmd> HopPattern <Return>", opts)

nvim_set_keymap("n", "gt", "<cmd> BufferLinePick <return>", opts)
nvim_set_keymap("n", "<leader>1", "<cmd> BufferLineGoToBuffer 1 <return>", opts)
nvim_set_keymap("n", "<leader>2", "<cmd> BufferLineGoToBuffer 2 <return>", opts)
nvim_set_keymap("n", "<leader>3", "<cmd> BufferLineGoToBuffer 3 <return>", opts)
nvim_set_keymap("n", "<leader>4", "<cmd> BufferLineGoToBuffer 4 <return>", opts)
nvim_set_keymap("n", "<leader>5", "<cmd> BufferLineGoToBuffer 5 <return>", opts)
nvim_set_keymap("n", "<leader>6", "<cmd> BufferLineGoToBuffer 6 <return>", opts)
nvim_set_keymap("n", "<leader>7", "<cmd> BufferLineGoToBuffer 7 <return>", opts)
nvim_set_keymap("n", "<leader>8", "<cmd> BufferLineGoToBuffer 8 <return>", opts)
nvim_set_keymap("n", "<leader>9", "<cmd> BufferLineGoToBuffer 9 <return>", opts)

nvim_set_keymap("n", "<leader>t", "<cmd> TroubleToggle <return>", opts)

nvim_set_keymap("n", "<leader>g", "<cmd> lua require('telescope.builtin').find_files() <cr>", opts)
nvim_set_keymap("n", "<leader>f", "<cmd> lua require('telescope.builtin').live_grep() <cr>", opts)
nvim_set_keymap("n", "<leader>b", "<cmd> lua require('telescope.builtin').buffers() <cr>", opts)

nvim_set_keymap("n", "<leader>rn", "<cmd> lua require('cosmic-ui').rename() <cr>", opts)

nvim_set_keymap("n", "<leader>a", "<cmd> lua require('cosmic-ui').code_actions() <cr>", opts)

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
-- vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)

