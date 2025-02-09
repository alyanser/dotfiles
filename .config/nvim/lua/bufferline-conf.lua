require('bufferline').setup {
	options = {
		mode = "buffers",
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = false,
		color_icons = true,
		show_close_icon = true,
		always_show_bufferline = true,
		separator_style = "slope",
		max_name_length = 20,
		max_prefix_length = 13,
		tab_size = 25,
		close_command = "BufDel",
		enforce_regular_tabs = true,

		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,

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
