-- plugins

require("packer").startup(function()

	use {
		'wbthomason/packer.nvim'
	}

	use {
		'lewis6991/impatient.nvim', 
	}

	use {
		'nvim-treesitter/nvim-treesitter',
	}

	use {
		'phaazon/hop.nvim',
	}

	use {
		'numToStr/Comment.nvim',
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
		'folke/tokyonight.nvim'
	}
end)

require("impatient")
require('Comment').setup{}
require('lualine').setup{}
require("trouble").setup{}
require('bufferline').setup{}

require('nvim-treesitter.configs').setup{
	ensure_installed = { 'cpp', 'c', 'lua', 'haskell', 'python', 'rust', 'cmake', 'bash', 'yaml' },

	highlight = {
		enable = true
	},
}

local lsp = require("lspconfig")

lsp["clangd"].setup{
	single_file_support = true,
	command = { 'clangd', '--background-index', '-j=4', '--head-insertion=never', '--clang-tidy=false', '--completion-style=detailed' },
}

local rest_lang_servers = { "cmake", "bashls", "pyright" }

for _, name in ipairs(rest_lang_servers) do
	lsp[name].setup{}
end

-- general

local tab_len = 8

vim.g.tabstop = tab_len
vim.g.shiftwidth = tab_len
vim.g.softtabstop = tab_len
vim.g.noexpandtab = true

vim.opt.number = true
vim.opt.guicursor = nil

vim.g.nofixedenofline = true
vim.g.loadedmatchparen = false

vim.g.tokyonight_style = "night"

vim.cmd [[ set mouse=a ]]
vim.cmd [[ colorscheme tokyonight ]]

-- autocmds

vim.api.nvim_create_autocmd("FileType", {
	command = "set formatoptions-=cro",
})

vim.api.nvim_create_autocmd("FileType", {
	command = "set nohlsearch",
})

vim.api.nvim_create_autocmd("Focusgained", {
	command = "checktime",
})

-- keybinds
