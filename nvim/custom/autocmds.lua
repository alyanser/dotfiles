local autocmd = vim.api.nvim_create_autocmd

-- Use relative & absolute line numbers in 'n' & 'i' modes respectively
autocmd("InsertEnter", {
	callback = function()
		vim.opt.relativenumber = false
	end,
})

autocmd("InsertLeave", {
	callback = function()
		vim.opt.relativenumber = true
	end,
})

-- Open a file from its last left off position
autocmd("BufReadPost", {
	callback = function()
		if not vim.fn.expand("%:p"):match ".git" and vim.fn.line "'\"" > 1 and vim.fn.line "'\"" <= vim.fn.line "$" then
			vim.cmd "normal! g'\""
			vim.cmd "normal zz"
		end
	end,
})

autocmd("Filetype", {
	pattern = "*",
	callback = function()
		vim.opt_local.expandtab = false
		vim.opt_local.tabstop = 8
		vim.opt_local.shiftwidth = 8
		vim.opt_local.softtabstop = 8
		vim.opt_local.clipboard = nil
		vim.cmd [[ :NoMatchParen ]]
	end,
})
