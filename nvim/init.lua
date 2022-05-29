-- plugins

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
end)

require('impatient')
require('Comment').setup{}
require('lualine').setup{}
require('trouble').setup{}
require('bufferline').setup{}
require('gitsigns').setup{}

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

require('indent_blankline').setup {
	show_end_of_line = true,
	space_char_blankline = " ",
	show_current_context = false,
}

local scrollbar_colors = require("tokyonight.colors").setup()

require('scrollbar').setup {

	handle = {
		color = scrollbar_colors.bg_highlight,
		hide_if_all_visible = false
	},

	marks = {
		Search = { color = scrollbar_colors.orange },
		Error = { color = scrollbar_colors.error },
		Warn = { color = scrollbar_colors.warning },
		Info = { color = scrollbar_colors.info },
		Hint = { color = scrollbar_colors.hint },
		Misc = { color = scrollbar_colors.purple },
	}
}

require('nvim-treesitter.configs').setup{
	ensure_installed = { 'cpp', 'c', 'lua', 'haskell', 'python', 'rust', 'cmake', 'bash', 'yaml' },

	highlight = {
		enable = true
	},
}

require("neo-tree").setup {
	close_if_last_window = true,
	popup_border_style = "rounded",
	enable_diagnostics = false,
	default_component_configs = {
		indent = {
			padding = 0,
			with_expanders = false,
		},
		icon = {
			folder_closed = "",
			folder_open = "",
			folder_empty = "",
			default = "",
		},
		git_status = {
			symbols = {
				added = "",
				deleted = "",
				modified = "",
				renamed = "➜",
				untracked = "★",
				ignored = "◌",
				unstaged = "✗",
				staged = "✓",
				conflict = "",
			},
		},
	},
	window = {
		width = 25,
		mappings = {
			["o"] = "open",
		},
	},
	filesystem = {
		filtered_items = {
			visible = false,
			hide_dotfiles = true,
			hide_gitignored = false,
			hide_by_name = {
				".DS_Store",
				"thumbs.db",
				"node_modules",
				"__pycache__",
			},
		},
		follow_current_file = true,
		hijack_netrw_behavior = "open_current",
		use_libuv_file_watcher = true,
	},
	git_status = {
		window = {
			position = "float",
		},
	},
	event_handlers = {
		{
			event = "vim_buffer_enter",
			handler = function(_)
				if vim.bo.filetype == "neo-tree" then
					vim.wo.signcolumn = "auto"
				end
		end,
		},
	},
}

local lsp = require("lspconfig")

lsp["clangd"].setup{
	single_file_support = true,
	command = { 'clangd', '--background-index', '-j=4', '--head-insertion=never', '--clang-tidy=false', '--completion-style=detailed' },
}

-- local rest_lang_servers = { "cmake", "bashls", "pyright" }
--
-- for _, name in ipairs(rest_lang_servers) do
--	lsp[name].setup{}
-- end

-- general

local tab_len = 8

vim.g.tabstop = tab_len
vim.g.shiftwidth = tab_len
vim.g.softtabstop = tab_len
vim.g.noexpandtab = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.guicursor = nil
vim.opt.termguicolors = true

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
