require('nvim-treesitter.configs').setup{
	ensure_installed = { 'cpp', 'c', 'lua', 'haskell', 'python', 'rust', 'cmake', 'bash', 'yaml', 'make' },
	highlight = {
		enable = true,
	},
	incremental_selection = {
		enabled = true,
	},
	indent = {
		enabled = false,
	},
}
