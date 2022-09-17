require("neo-tree").setup{
	close_if_last_window = true,
	popup_border_style = "rounded",
	enable_git_status = true,
	use_libuv_file_watcher = true,
	follow_current_file = true,

	window = {
		position = "left",
		width = 23,
	},
}
