local nvim_set_keymap = vim.api.nvim_set_keymap
local opts = { noremap=true, silent=true }

nvim_set_keymap("n", "<C-t>", "<cmd> Neotree show toggle <Return>", opts)
nvim_set_keymap("n", "<C-y>", "<cmd> Neotree reveal toggle <Return>", opts)
nvim_set_keymap("v", "<C-t>", "<cmd> Neotree show toggle <Return>", opts)
nvim_set_keymap("v", "<C-t>", "<cmd> Neotree git_status <Return>", opts)
nvim_set_keymap("n", "G", "Gzz", opts)

nvim_set_keymap("n", "j", "gj", opts)
nvim_set_keymap("n", "k", "gk", opts)

nvim_set_keymap("n", "[[", "[{", opts)
nvim_set_keymap("n", "]]", "]}", opts)

nvim_set_keymap("n", "yl", "^yg_", opts)

nvim_set_keymap("n", "j", "gj", opts)
nvim_set_keymap("n", "k", "gk", opts)

nvim_set_keymap("n", "+y", "<cmd> call system(\"wl-copy\", @) <Return>", opts)

nvim_set_keymap("n", "<leader>t", "<cmd> ClangdSwitchSourceHeader <Return>", opts)

nvim_set_keymap("n", "gw", "<cmd> HopWord <Return>", opts)
nvim_set_keymap("n", "gn", "<cmd> HopChar1 <Return>", opts)
nvim_set_keymap("n", "g/", "<cmd> HopPattern <Return>", opts)

nvim_set_keymap('n', '<M-q>', '<cmd> BufDel <cr>', opts)

nvim_set_keymap('n', 'c', '"_c', opts)
nvim_set_keymap('n', 'C', '"_C', opts)

nvim_set_keymap("n", "gt", "<cmd> BufferLinePick <return>", opts)
nvim_set_keymap("n", "<M-1>", "<cmd> BufferLineGoToBuffer 1 <return>", opts)
nvim_set_keymap("n", "<M-2>", "<cmd> BufferLineGoToBuffer 2 <return>", opts)
nvim_set_keymap("n", "<M-3>", "<cmd> BufferLineGoToBuffer 3 <return>", opts)
nvim_set_keymap("n", "<M-4>", "<cmd> BufferLineGoToBuffer 4 <return>", opts)
nvim_set_keymap("n", "<M-5>", "<cmd> BufferLineGoToBuffer 5 <return>", opts)
nvim_set_keymap("n", "<M-6>", "<cmd> BufferLineGoToBuffer 6 <return>", opts)
nvim_set_keymap("n", "<M-7>", "<cmd> BufferLineGoToBuffer 7 <return>", opts)
nvim_set_keymap("n", "<M-8>", "<cmd> BufferLineGoToBuffer 8 <return>", opts)
nvim_set_keymap("n", "<M-9>", "<cmd> BufferLineGoToBuffer 9 <return>", opts)

nvim_set_keymap("i", "<M-1>", "<cmd> BufferLineGoToBuffer 1 <return>", opts)
nvim_set_keymap("i", "<M-2>", "<cmd> BufferLineGoToBuffer 2 <return>", opts)
nvim_set_keymap("i", "<M-3>", "<cmd> BufferLineGoToBuffer 3 <return>", opts)
nvim_set_keymap("i", "<M-4>", "<cmd> BufferLineGoToBuffer 4 <return>", opts)
nvim_set_keymap("i", "<M-5>", "<cmd> BufferLineGoToBuffer 5 <return>", opts)
nvim_set_keymap("i", "<M-6>", "<cmd> BufferLineGoToBuffer 6 <return>", opts)
nvim_set_keymap("i", "<M-7>", "<cmd> BufferLineGoToBuffer 7 <return>", opts)
nvim_set_keymap("i", "<M-8>", "<cmd> BufferLineGoToBuffer 8 <return>", opts)
nvim_set_keymap("i", "<M-9>", "<cmd> BufferLineGoToBuffer 9 <return>", opts)

nvim_set_keymap("v", "<M-1>", "<cmd> BufferLineGoToBuffer 1 <return>", opts)
nvim_set_keymap("v", "<M-2>", "<cmd> BufferLineGoToBuffer 2 <return>", opts)
nvim_set_keymap("v", "<M-3>", "<cmd> BufferLineGoToBuffer 3 <return>", opts)
nvim_set_keymap("v", "<M-4>", "<cmd> BufferLineGoToBuffer 4 <return>", opts)
nvim_set_keymap("v", "<M-5>", "<cmd> BufferLineGoToBuffer 5 <return>", opts)
nvim_set_keymap("v", "<M-6>", "<cmd> BufferLineGoToBuffer 6 <return>", opts)
nvim_set_keymap("v", "<M-7>", "<cmd> BufferLineGoToBuffer 7 <return>", opts)
nvim_set_keymap("v", "<M-8>", "<cmd> BufferLineGoToBuffer 8 <return>", opts)
nvim_set_keymap("v", "<M-9>", "<cmd> BufferLineGoToBuffer 9 <return>", opts)

nvim_set_keymap("n", "<leader>d", "<cmd> lua require('telescope.builtin').find_files() <cr>", opts)
nvim_set_keymap("n", "<leader>f", "<cmd> lua require('telescope.builtin').live_grep() <cr>", opts)
nvim_set_keymap("n", "<leader>b", "<cmd> lua require('telescope.builtin').buffers() <cr>", opts)
nvim_set_keymap("n", "<leader>e", "<cmd> lua require('telescope.builtin').diagnostics() <cr>", opts)
nvim_set_keymap("n", "<leader>ic", "<cmd> lua require('telescope.builtin').lsp_incoming_calls() <cr>", opts)
nvim_set_keymap("n", "<leader>re", "<cmd> lua require('telescope.builtin').lsp_references() <cr>", opts)
nvim_set_keymap("n", "<leader>s", "<cmd> lua require('telescope.builtin').lsp_document_symbols() <cr>", opts)
nvim_set_keymap("n", "<leader>ws", "<cmd> lua require('telescope.builtin').lsp_workspace_symbols() <cr>", opts)
nvim_set_keymap("n", "<leader>x", "<cmd> lua require('telescope.builtin').lsp_type_definitions() <cr>", opts)
nvim_set_keymap("n", "gd", "<cmd> lua require('telescope.builtin').lsp_definitions() <cr>", opts)

nvim_set_keymap("n", "<leader>gc", "<cmd> lua require('telescope.builtin').git_commits() <cr>", opts)
-- nvim_set_keymap("n", "<leader>es", "<cmd> lua require('telescope.builtin').treesitter() <cr>", opts)

vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, opts)
vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
vim.keymap.set('n', '<space>a', vim.lsp.buf.code_action, bufopts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)

nvim_set_keymap('n', '<leader>rn', '<cmd> lua vim.lsp.buf.rename() <cr>', opts)

vim.keymap.set('i', '<C-Return>', 'copilot#Accept("\\<CR>")', {
	expr = true,
	replace_keycodes = false
})

vim.g.copilot_no_tab_map = true

vim.keymap.set(
  "",
  "<Leader>l",
  require("lsp_lines").toggle,
  { desc = "Toggle lsp_lines" }
)
