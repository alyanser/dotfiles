require("packer").startup(function()

	use {
		'wbthomason/packer.nvim'
	}

	use {
		'lewis6991/impatient.nvim' 
	}

	use {
		'navarasu/onedark.nvim'
	}

	use {
		'akinsho/toggleterm.nvim'
	}

	use {
		'kyazdani42/nvim-tree.lua'
	}

	use {
		'tpope/vim-surround'
	}

	use {
		'lewis6991/gitsigns.nvim'
	}

	use {
		'nvim-treesitter/nvim-treesitter'
	}

	use {
		'NMAC427/guess-indent.nvim',
	}

	use {
		'phaazon/hop.nvim',
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
		'windwp/nvim-autopairs'
	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = {
			'kyazdani42/nvim-web-devicons', 
			opt = true
		}
	}

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { 
			{'nvim-lua/plenary.nvim'}
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
		'lukas-reineke/indent-blankline.nvim'
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
		}
	}

	use {
		'L3MON4D3/LuaSnip'
	}
end)
