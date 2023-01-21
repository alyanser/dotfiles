require("packer").startup(function()

	use {
		'wbthomason/packer.nvim'
	}

	use {
		'goolord/alpha-nvim',
		config = function ()
			require'alpha'.setup(require'alpha.themes.dashboard'.config)
		end
	}

	use {
		'RRethy/vim-illuminate',
		config = function()
			require('illuminate').configure{
				delay = 300
			}
		end
	}

	use {
		"nvim-pack/nvim-spectre"
	}

	use {
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = { 
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		}
	}

	use {
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup{}
		end
	}

	use {
		"folke/noice.nvim",
		requires = "MunifTanjim/nui.nvim",
		config = function()
			require("noice-conf")
		end
	}

	use {
		"folke/persistence.nvim",
		event = "BufReadPre",
		module = "persistence",
		config = function()
			require("persistence").setup()
		end
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
		'ethanholz/nvim-lastplace',
		config = function()
			require('nvim-lastplace-conf')
		end
	}

	use {
		'lewis6991/gitsigns.nvim',
		config = function()
			require("gitsigns-conf")
		end
	}

	use {
		'ojroques/nvim-bufdel',
		config = function()
			require("bufdel").setup{
				next = 'tabs',
				quit = true,
			}
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
		'nvim-telescope/telescope.nvim',
		requires = {'nvim-lua/plenary.nvim'},
		config = function()
			require("telescope-conf")
		end
	}

	use { 
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup{}
		end
	}

	use {
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup{}
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
