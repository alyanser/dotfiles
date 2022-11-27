require("impatient")

require("packer").startup(function()

	use {
		'wbthomason/packer.nvim'
	}

	use {
		'lewis6991/impatient.nvim',
	}

	use {
		'filipdutescu/renamer.nvim',
		branch = 'master',
		requires = 'nvim-lua/plenary.nvim',
		config = function()
			require("renamer-conf")
		end
	}

	use {
		'nvim-neo-tree/neo-tree.nvim',
		branch = "v2.x",
		requires = { 
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neotree-conf")
		end,
	}

	use {
		'ethanholz/nvim-lastplace',
		config = function()
			require('nvim-lastplace-conf')
		end
	}

	use {
		'tpope/vim-surround'
	}

	use {
		'lewis6991/gitsigns.nvim',
		config = function()
			require("gitsigns-conf")
		end
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require("treesitter-conf")
		end,
	}

	use {
		'NMAC427/guess-indent.nvim',
		config = function()
			require("guess-indent-conf")
		end
	}

	use {
		'phaazon/hop.nvim',
		config = function()
			require("hop-conf")
		end
	}

	use {
		'numToStr/Comment.nvim',
		config = function()
			require("comment-conf")
		end
	}

	use {
		'folke/tokyonight.nvim',
	}

	use {
		'akinsho/bufferline.nvim',
		tag = "v2.*",
		requires = 'kyazdani42/nvim-web-devicons',
		config = function()
			require("bufferline-conf")
		end,
	}

	use {
		'windwp/nvim-autopairs',
		config = function()
			require("nvim-autopairs").setup{
				map_c_h = true,
				map_c_w = true,
			}
		end
	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = {
			'kyazdani42/nvim-web-devicons', 
		},
		config = function()
			require("lualine-conf")
		end,
	}

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { 
			{'nvim-lua/plenary.nvim'}
		},
		config = function()
			require("telescope-conf")
		end
	}

	use {
		'neovim/nvim-lspconfig',
		config = function()
			require("lsp-conf")
		end,
	}

	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-nvim-lsp',
			'neovim/nvim-lspconfig',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'L3MON4D3/LuaSnip',
		},
		config = function()
			require("cmp-conf")
		end
	}
end)
