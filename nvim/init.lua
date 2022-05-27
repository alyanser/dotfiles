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
end)

require("impatient")
require('Comment').setup{}

require('lualine').setup{

	options = {
		section_separators = '',
		component_separators = ''
	}
}

require("trouble").setup {
}

require('nvim-treesitter.configs').setup {
	ensure_installed = { 'cpp', 'c', 'lua', 'haskell', 'python', 'rust', 'cmake', 'bash', 'yaml', 'ninja', 'regex' }
}

require('bufferline').setup {
	options = {
	}
}

local lsp = require("lspconfig")

lsp["clangd"].setup {
	single_file_support = true,
	command = { 'clangd', '--background-index', '-j=4', '--head-insertion=never', '--clang-tidy=false', '--completion-style=detailed' },
}

local rest_lang_servers = { "cmake", "bashls", "pyright" }

for _, name in ipairs(rest_lang_servers) do
	lsp[name].setup{}
end

vim.opt.number = true
vim.g.tabstop = 8
vim.g.shiftwidth = 8
vim.g.softtabstop = 8
vim.g.noexpandtab = true
vim.g.nofixedenofline = true
vim.g.loadedmatchparen = false
vim.opt.guicursor = nil

vim.cmd [[ set mouse=a ]]

vim.api.nvim_create_autocmd("FileType", {
	command = "set formatoptions-=cro",
})

vim.api.nvim_create_autocmd("FileType", {
	command = "set nohlsearch",
})

vim.api.nvim_create_autocmd("Focusgained", {
	command = "checktime",
})


