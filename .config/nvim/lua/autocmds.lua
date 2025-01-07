vim.api.nvim_create_autocmd("FileType", {
	command = "set nohlsearch",
})

vim.api.nvim_create_autocmd("FileType", {
	command = "set nofixendofline",
})

vim.api.nvim_create_autocmd("FileType", {
	command = "set commentstring=#%s",
})

vim.api.nvim_create_autocmd("FileType", {
	command = "set formatoptions-=cro",
})

vim.api.nvim_create_autocmd("FileType", {
	command = "set cino+=L0",
})

vim.api.nvim_create_autocmd("FileType", {
	command = "set cinoptions+=l1",
})

vim.api.nvim_create_autocmd("FileType", {
	command = "set cinoptions+=j1,(0,ws,ws",
})

vim.api.nvim_create_autocmd('TextYankPost', {
	group = vim.api.nvim_create_augroup('yank_highlight', {}),
	pattern = '*',
	callback = function()
		vim.highlight.on_yank { higroup='IncSearch', timeout=50 }
	end,
})

vim.api.nvim_create_autocmd({"FocusGained", "TermClose", "TermLeave" },{
	command = "checktime"
})

-- -- workaroud till auto_cmd is fixed
vim.api.nvim_create_autocmd("BufReadPost", {
	command = "silent GuessIndent",
})

-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	pattern = {"*.cc", "*.h", "*.cxx", "*.cc", "*.hpp", "*.cpp", "*.hxx"},
-- 	command = "lua vim.lsp.buf.format()",
-- })
