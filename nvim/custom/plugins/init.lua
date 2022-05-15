require("cmp").setup {
	enabled = false,
}

return {

	["wfxr/minimap.vim"] = {},

	["phaazon/hop.nvim"] = {
		branch = 'v1',

		config = function()
			require("hop").setup {}
		end
	},

	["rmagatti/goto-preview"] = {

		config = function()
			require('goto-preview').setup {}
		end
	},

	["folke/trouble.nvim"] = {
		requires = "kyazdani42/nvim-web-devicons",

		config = function()
			require("trouble").setup {}
		end
	},

	["goolord/alpha-nvim"] = {
		requires = { 'kyazdani42/nvim-web-devicons' },

		config = function ()
			-- require'alpha'.setup(require'alpha.themes.startify'.config)
		end,
	},
}
