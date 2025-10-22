local nvim_set_keymap = vim.api.nvim_set_keymap
local opts = { noremap=true, silent=true }

nvim_set_keymap('n', '<A-q>', '<Cmd>BufDel<CR>', opts)
nvim_set_keymap('n', '<C-t>', '<Cmd>BufDel<CR>', opts)

nvim_set_keymap("n", "<M-1>", "<cmd> BufferLineGoToBuffer 1 <return>", opts)
nvim_set_keymap("n", "<M-2>", "<cmd> BufferLineGoToBuffer 2 <return>", opts)
nvim_set_keymap("n", "<M-3>", "<cmd> BufferLineGoToBuffer 3 <return>", opts)
nvim_set_keymap("n", "<M-4>", "<cmd> BufferLineGoToBuffer 4 <return>", opts)
nvim_set_keymap("n", "<M-5>", "<cmd> BufferLineGoToBuffer 5 <return>", opts)
nvim_set_keymap("n", "<M-6>", "<cmd> BufferLineGoToBuffer 6 <return>", opts)
nvim_set_keymap("n", "<M-7>", "<cmd> BufferLineGoToBuffer 7 <return>", opts)
nvim_set_keymap("n", "<M-8>", "<cmd> BufferLineGoToBuffer 8 <return>", opts)
nvim_set_keymap("n", "<M-9>", "<cmd> BufferLineGoToBuffer 9 <return>", opts)

vim.keymap.set('i', '<C-Return>', 'Copilot#Accept("\\<CR>")', {
	expr = true,
	replace_keycodes = false
})

vim.g.copilot_no_tab_map = true
