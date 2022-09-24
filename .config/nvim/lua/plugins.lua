require("packer").startup(function()

	use {
		'wbthomason/packer.nvim'
	}

	use {
		'lewis6991/impatient.nvim',
		config = function()
			require("impatient")
		end
	}

	use {
		'nvim-neo-tree/neo-tree.nvim',
		config = function()
			require("neotree-conf")
		end,
	}

	use {
		'akinsho/toggleterm.nvim',
		cmd = 'ToggleTerm',
		config = function()
			require("toggleterm-conf")
		end,
	}

	use {
		'CosmicNvim/cosmic-ui',
		requires = {
			'MunifTanjim/nui.nvim',
			'nvim-lua/plenary.nvim'
		},
	}

	use {
		'ethanholz/nvim-lastplace',
		config = function()
			require('nvim-lastplace').setup{}
		end
	}

	use {
		'mhinz/vim-startify'
	}

	use {
		'tpope/vim-surround'
	}

	use {
		'lewis6991/gitsigns.nvim'
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require("treesitter-conf")
		end
	}

	use {
		'NMAC427/guess-indent.nvim',
		cmd = 'GuessIndent',
		config = function()
			require("guess-indent").setup{}
		end
	}

	use {
		'phaazon/hop.nvim',
		config = function()
			require("hop").setup{}
		end
	}

	use {
		'numToStr/Comment.nvim',
		keys = {'gcc', 'gbc'},
		config = function()
			require("Comment").setup{}
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
		end
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
		end
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
