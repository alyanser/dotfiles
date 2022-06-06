require("packer").startup(function()

	use {
		'wbthomason/packer.nvim'
	}

	use {
		'petertriho/nvim-scrollbar'
	}

	use {
		'lewis6991/impatient.nvim', 
	}

	use {
		'tpope/vim-surround'
	}

	use {
		'nvim-treesitter/nvim-treesitter',
	}

	use {
		'phaazon/hop.nvim',
	}

	use {
		'lewis6991/gitsigns.nvim',
		tag = 'release'
	}

	use {
		'numToStr/Comment.nvim',
	}

	use {
		'folke/tokyonight.nvim'
	}

	use {
		'akinsho/bufferline.nvim',
		tag = "v2.*",
		requires = 'kyazdani42/nvim-web-devicons',
	}

	use {
		'jiangmiao/auto-pairs'
	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = {
			'kyazdani42/nvim-web-devicons', 
			opt = true
		}
	}

	use {
		'nvim-telescope/telescope.nvim',
		requires = { 
			{ 'nvim-lua/plenary.nvim' }
		}
	}

	use {
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	}

	use {
		'neovim/nvim-lspconfig'
	}

	use {
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = { 
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		}
	}

	use {
		'lukas-reineke/indent-blankline.nvim'
	}

	use {
		'stevearc/aerial.nvim'
	}
end)

