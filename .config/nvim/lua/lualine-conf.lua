require('lualine').setup {
	options = {
		theme = "onedark",
		component_separators = { left = '', right = ''},
		section_separators = { left = '', right = ''},
		disabled_filetypes = {
			"neo-tree",
			"nvim-tree",
			"aerial",
			"Trouble"
		},
	}
}
