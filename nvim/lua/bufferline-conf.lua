require('bufferline').setup {
	options = {
		mode = "tabs",
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = false,
		color_icons = true,
		show_close_icon = false,
		always_show_bufferline = true,
		separator_style = "thick",
		offsets = {
			{
				filetype = "neo-tree",
				text = "Explorer",
				text_align = "center",
			},
			{
				filetype = "aerial",
				text = "Explorer",
				text_align = "center",
			},
		},
	},
	buffer_close_icon = "",
	modified_icon = "",
	close_icon = "",
	max_name_length = 14,
	max_prefix_length = 13,
	tab_size = 20,
}
