require('guess-indent').setup {
	auto_cmd = false,
	override_editorconfig = true,
	filetype_exclude = {
		"netrw",
		"tutor",
		"neo-tree",
	},
	buftype_exclude = {
		"help",
		"nofile",
		"terminal",
		"prompt",
		"neo-tree",
	},
}
