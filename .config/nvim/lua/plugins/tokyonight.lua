return {
	{
		"folke/tokyonight.nvim",
		opts = {
			style = "moon",
			on_colors = function(colors)
				colors.hint = colors.purple
				colors.warning = colors.blue
				colors.error = colors.red
			end,
		},
	},
}
