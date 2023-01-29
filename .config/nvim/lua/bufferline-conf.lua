require('bufferline').setup {
	options = {
		mode = "buffers",
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = false,
		color_icons = true,
		show_close_icon = false,
		always_show_bufferline = true,
		separator_style = "thick",
		max_name_length = 20,
		max_prefix_length = 13,
		tab_size = 20,
		close_command = "BufDel",
		enforce_regular_tabs = true,
		offsets = {
			{
				filetype = "neo-tree",
				text = "Explorer",
				text_align = "center",
				separator = true,
			},
		},
	},
}
