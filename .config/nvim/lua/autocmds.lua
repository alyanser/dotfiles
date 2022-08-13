vim.api.nvim_create_autocmd("FileType", {
	command = "set formatoptions-=cro",
})

vim.api.nvim_create_autocmd("FileType", {
	command = "set signcolumn=yes",
})

vim.api.nvim_create_autocmd("FileType", {
	command = "set tabstop=8",
})

vim.api.nvim_create_autocmd("FileType", {
	command = "set shiftwidth=8",
})

vim.api.nvim_create_autocmd("FileType", {
	command = "set softtabstop=8",
})

vim.api.nvim_create_autocmd("FileType", {
	command = "set noexpandtab",
})

vim.api.nvim_create_autocmd("FileType", {
	command = "set nohlsearch",
})

vim.api.nvim_create_autocmd("FileType", {
	command = "set nofixendofline",
})

vim.api.nvim_create_autocmd("FileType", {
	command = "set cino+=L0",
})
