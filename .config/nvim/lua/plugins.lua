local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	{
		'wbthomason/packer.nvim'
	},

	{
		'RRethy/vim-illuminate',
		config = function()
			require('illuminate').configure{
				delay = 300
			}
		end
	},

	{
		"nvim-pack/nvim-spectre"
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		cmd = 'NeoTreeShowToggle',
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = true,
	},

	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		module = "persistence",
		config = true,
	},

	{
		'filipdutescu/renamer.nvim',
		branch = 'master',
		dependencies = 'nvim-lua/plenary.nvim',
		config = function()
			require("renamer-conf")
		end
	},

	{
		'ethanholz/nvim-lastplace',
		config = function()
			require('nvim-lastplace-conf')
		end
	},

	{
		'lewis6991/gitsigns.nvim',
		config = function()
			require("gitsigns-conf")
		end
	},

	{
		'ojroques/nvim-bufdel',
		config = function()
			require("bufdel").setup{
				next = 'tabs',
				quit = true,
			}
		end
	},

	{
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require("treesitter-conf")
		end,
	},

	{
		'NMAC427/guess-indent.nvim',
		config = function()
			require("guess-indent-conf")
		end
	},

	{
		'phaazon/hop.nvim',
		cmd = 'HopWord',
		config = function()
			require("hop-conf")
		end
	},

	{
		'folke/tokyonight.nvim',
		lazy = false,
		priority = 100,
		config = function()
			require("tokyonight").setup{
				style = "moon",
				on_colors = function(colors)
					colors.hint = colors.purple
					colors.warning = colors.orange
					colors.error = colors.red
				end,
			}

			vim.cmd([[colorscheme tokyonight]])
		end,
	},

	{
		'akinsho/bufferline.nvim',
		dependencies = 'kyazdani42/nvim-web-devicons',
		config = function()
			require("bufferline-conf")
		end,
	},

	{
		'windwp/nvim-autopairs',
		config = function()
			require("nvim-autopairs").setup{
				map_c_h = true,
				map_c_w = true,
			}
		end
	},

	{
		'nvim-lualine/lualine.nvim',
		dependencies = {
			'kyazdani42/nvim-web-devicons',
		},
		config = function()
			require("lualine-conf")
		end,
	},

	{
		'nvim-telescope/telescope.nvim',
		dependencies = {'nvim-lua/plenary.nvim'},
		config = function()
			require("telescope-conf")
		end
	},

	{
		'neovim/nvim-lspconfig',
		config = function()
			require("lsp-conf")
		end,
	},

	{
		'hrsh7th/nvim-cmp',
		dependencies = {
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
	},

	{
		'numToStr/Comment.nvim',
		keys = {'go', 'ggo'},
		config = function()
			require('Comment').setup({
				padding = true,
				sticky = true,
				ignore = nil,
				toggler = {
					line = 'go',
					block = 'ggo',
				},
				opleader = {
					line = 'go',
					block = 'ggo',
				},
				extra = {
					above = 'guo',
					below = 'gbo',
					eol = 'gao',
				},
				mappings = {
					basic = true,
					extra = true,
				},
				pre_hook = nil,
				post_hook = nil,
			})
		end
	}
})
