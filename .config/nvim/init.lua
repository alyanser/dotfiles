require("plugins")

require("general")
require("autocmds")
require("keymaps")

require("lsp-conf")
require("treesitter-conf")
require("telescope-conf")
require("blankline-conf")
require("lualine-conf")
require("bufferline-conf")
require("trouble-conf")
require("cmp-conf")
require("gitsigns-conf")
require("nvimtree-conf")
require("terminal-conf")

require('Comment').setup{}
require('hop').setup{}

require("guess-indent").setup{
	auto_cmd = false,
}

require("nvim-autopairs").setup{
	map_c_h = true,
	map_c_w = true,
}

require("onedark").setup{
	style = 'dark',

	colors = {
		purple = '#FA8072',
	},

	diagnostics = {
		darker = false,
	}
}

require("onedark").load()
