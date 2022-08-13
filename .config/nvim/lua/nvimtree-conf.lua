require("nvim-tree").setup{
	hijack_unnamed_buffer_when_opening = true,
	open_on_setup = true,
	view = {
		side = "left",
		adaptive_size = true,
		preserve_window_proportions = true,
	},

	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		}
        },
}
