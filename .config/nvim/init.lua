require("plugins")
require("general")
require("autocmds")
require("keymaps")

require("lsp-conf")
require("treesitter-conf")
require("telescope-conf")
require("lualine-conf")
require("bufferline-conf")
require("cmp-conf")
require("gitsigns-conf")
require("neotree-conf")
require("cosmicui-conf")
require("toggleterm-conf")

require('Comment').setup{}
require('hop').setup{}
require("guess-indent").setup{}
require("nvim-lastplace").setup{}

require("nvim-autopairs").setup{
	map_c_h = true,
	map_c_w = true,
}

require("tokyonight").setup({
	style = "storm",
	on_colors = function(colors)
		colors.hint = colors.purple
		colors.warning = colors.orange
		colors.error = colors.red
	end,
})

vim.cmd [[ colorscheme tokyonight ]]
