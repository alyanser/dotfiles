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
		'tpope/vim-surround'
	}

	use {
		'nvim-treesitter/nvim-treesitter',
	}

	use {
		'folke/tokyonight.nvim'
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

require('Comment').setup{}
require('lualine').setup{}
require('trouble').setup{}

require('aerial').setup {
	close_behavior = "global",
	backends = {
		"lsp",
		"treesitter",
		"markdown",
	},
	min_width = 30,
	show_guides = true,
	filter_kind = false,
	icons = {
		Array = "",
		Boolean = "⊨",
		Class = "",
		Constant = "",
		Constructor = "",
		Key = "",
		Function = "",
		Method = "ƒ",
		Namespace = "",
		Null = "NULL",
		Number = "#",
		Object = "⦿",
		Property = "",
		TypeParameter = "𝙏",
		Variable = "",
		Enum = "ℰ",
		Package = "",
		EnumMember = "",
		File = "",
		Module = "",
		Field = "",
		Interface = "ﰮ",
		String = "𝓐",
		Struct = "𝓢",
		Event = "",
		Operator = "+",
	},
	guides = {
		mid_item = "├ ",
		last_item = "└ ",
		nested_top = "│ ",
		whitespace = "  ",
	},
}

require('gitsigns').setup {
	signs = {
		add = { text = "▎" },
		change = { text = "▎" },
		delete = { text = "▎" },
		topdelete = { text = "契" },
		changedelete = { text = "▎" },
	},
}

require('bufferline').setup {
	options = {
		{
			filetype = "neo-tree",
			text = "",
			padding = 1,
		},
		{
			filetype = "outline",
			text = "",
			padding = 1,
		}
	},
	buffer_close_icon = "",
	modified_icon = "",
	close_icon = "",
	max_name_length = 14,
	max_prefix_length = 13,
	tab_size = 20,
	separator_style = "thin",

}

require('indent_blankline').setup {
	show_end_of_line = true,
	space_char_blankline = " ",
	show_current_context = false,
	char = "▏",
	use_treesitter = true,
}

require("telescope").setup {
	defaults = {
		prompt_prefix = " ",
		selection_caret = "❯ ",
		path_display = { "truncate" },
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			width = 0.87,
			height = 0.80,
			preview_cutoff = 120,
		},
	},
}

require('scrollbar').setup {

	handle = {
		hide_if_all_visible = false,
	},
}

require('nvim-treesitter.configs').setup{
	ensure_installed = { 'cpp', 'c', 'lua', 'haskell', 'python', 'rust', 'cmake', 'bash', 'yaml' },
	highlight = {
		enable = true
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	autopairs = {
		enable = true,
	},
	incremental_selection = {
		enable = true
	},
	indent = {
		enable = true,
	},
	rainbow = {
		enable = true,
		max_file_lines = nil,
	},
	autotag = {
		enable = true,
	},
}

require("neo-tree").setup {
	close_if_last_window = true,
	popup_border_style = "rounded",
	enable_diagnostics = true,
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
	on_attach = require("aerial").on_attach
}

-- local rest_lang_servers = { "cmake", "bashls", "pyright" }
--
-- for _, name in ipairs(rest_lang_servers) do
--	lsp[name].setup{}
-- end

-- general

local tab_len = 8

local g = vim.g
local opt = vim.opt

g.tabstop = tab_len
g.shiftwidth = tab_len
g.softtabstop = tab_len
g.noexpandtab = true

opt.number = true
opt.relativenumber = false
opt.guicursor = nil
opt.termguicolors = true

-- opt.list = true
-- opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

g.nofixedenofline = true
g.loadedmatchparen = true
g.background = "dark"
g.one_allow_italics = true

g.tokyonight_colors = {
	hint = "cyan",
	warning = "blue",
	error = "red",
}

g.tokyonight_style = "night"
g.tokyonight_italic_comments = false
g.tokyonight_italic_keywords = false

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
