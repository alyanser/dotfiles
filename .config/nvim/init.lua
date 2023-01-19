require("plugins")
require("general")
require("autocmds")
require("keymaps")

require("tokyonight").setup({
	style = "moon",
	on_colors = function(colors)
		colors.hint = colors.purple
		colors.warning = colors.orange
		colors.error = colors.red
	end,
})

vim.cmd [[ colorscheme tokyonight ]]
