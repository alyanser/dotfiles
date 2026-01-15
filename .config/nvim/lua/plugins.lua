local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	-- {
	-- 	"nvim-pack/nvim-spectre",
	-- 	lazy = true,
	-- 	cmd = 'Spectre',
	-- },

	{
		"nvim-neo-tree/neo-tree.nvim",
		lazy = true,
		cmd = 'Neotree',
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree-conf")
			vim.api.nvim_create_augroup("load_neo_tree", {})
		end,

		init = function()
			vim.api.nvim_create_autocmd("BufEnter", {
			group = vim.api.nvim_create_augroup("load_neo_tree", {}),
			desc = "Loads neo-tree when openning a directory",
			callback = function(args)
				local stats = vim.uv.fs_stat(args.file)

				if not stats or stats.type ~= "directory" then
					return
				end

				require "neo-tree"
				return true
			end,
			})
		end,
	},

	{
		"kyazdani42/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup{
				default = true,
				strict = true,
			}
		end
	},

	{
		'ethanholz/nvim-lastplace',
		config = function()
			require('nvim-lastplace-conf')
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
		lazy = false,
		branch = "master",
		build = ":TSUpdate",
		config = function()
			require("treesitter-conf")
		end,
	},

	{
		'NMAC427/guess-indent.nvim',
		config = function()
			require("guess-indent").setup{}
		end
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("ibl").setup {
				scope = { enabled = false },
			}
		end
	},

	{
		'phaazon/hop.nvim',
		cmd = {'HopWord', 'HopPattern'},
		config = function()
			require("hop-conf")
		end
	},

	{
		'folke/tokyonight.nvim',
		priority = 100,
		config = function()
			require("tokyonight").setup{
				style = "moon",
				on_colors = function(colors)
					colors.hint = colors.purple
					colors.warning = colors.blue
					colors.error = colors.red
				end,
			}

			vim.cmd([[ colorscheme tokyonight ]])
		end,
	},

	{
		'akinsho/bufferline.nvim',
		requires = 'nvim-tree/nvim-web-devicons',

		config = function()
			require("bufferline-conf")
		end,
	},

	{
		'windwp/nvim-autopairs',
		event = 'InsertEnter',
		config = function()
			require("nvim-autopairs").setup{
				map_c_h = true,
				map_c_w = true,
			}
		end
	},

	{
		'nvim-lualine/lualine.nvim',
		config = function()
			require("lualine-conf")
		end,
	},

	{
		'nvim-telescope/telescope.nvim',
		lazy = true,
		dependencies = {'nvim-lua/plenary.nvim'},
		config = function()
			require("telescope-conf")
		end
	},

	{
		'numToStr/Comment.nvim',
		lazy = true,
		keys = {'go', 'gcc', {'go', mode = 'v'}, {'ggo', mode = 'v'}},
		config = function()
		require('Comment').setup({
				padding = true,
				sticky = false,
				ignore = '^$',
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
	},

	{
		'lewis6991/gitsigns.nvim',
		config = function()
			require("gitsigns-conf")
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
		event = 'InsertEnter',
		dependencies = {
			'neovim/nvim-lspconfig',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-cmdline',
			'L3MON4D3/LuaSnip',
		},
		config = function()
			require("cmp-conf")
		end
	},

	{
		'RRethy/vim-illuminate',
	},

	{
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function() 
			require("lsp_lines").setup()
		end
	},

	{
		"folke/ts-comments.nvim",
		event = "VeryLazy",
		opts = {},
	},

	{
		"MagicDuck/grug-far.nvim",
		opts = { headerMaxWidth = 80 },
		cmd = { "GrugFar", "GrugFarWithin" },
		keys = {
			{
			"<leader>sr",
			function()
				local grug = require("grug-far")
				local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
				grug.open({
				transient = true,
				prefills = {
				filesFilter = ext and ext ~= "" and "*." .. ext or nil,
				},
				})
			end,
			mode = { "n", "x" },
			desc = "Search and Replace",
			},
		},
	},

	{
  "NickvanDyke/opencode.nvim",
  dependencies = {
    -- Recommended for `ask()` and `select()`.
    -- Required for `snacks` provider.
    ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
    { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
  },
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition".
    }

    -- Required for `opts.events.reload`.
    vim.o.autoread = true

    -- Recommended/example keymaps.
    vim.keymap.set({ "n", "x" }, "<C-a>", function() require("opencode").ask("@this: ", { submit = true }) end, { desc = "Ask opencode" })
    vim.keymap.set({ "n", "x" }, "<C-x>", function() require("opencode").select() end,                          { desc = "Execute opencode action…" })
    vim.keymap.set({ "n", "t" }, "<C-.>", function() require("opencode").toggle() end,                          { desc = "Toggle opencode" })

    --vim.keymap.set({ "n", "x" }, "go",  function() return require("opencode").operator("@this ") end,        { expr = true, desc = "Add range to opencode" })
    --vim.keymap.set("n",          "goo", function() return require("opencode").operator("@this ") .. "_" end, { expr = true, desc = "Add line to opencode" })

    vim.keymap.set("n", "<S-C-u>", function() require("opencode").command("session.half.page.up") end,   { desc = "opencode half page up" })
    vim.keymap.set("n", "<S-C-d>", function() require("opencode").command("session.half.page.down") end, { desc = "opencode half page down" })

    -- You may want these if you stick with the opinionated "<C-a>" and "<C-x>" above — otherwise consider "<leader>o".
    vim.keymap.set("n", "+", "<C-a>", { desc = "Increment", noremap = true })
    vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement", noremap = true })
  end,
},
})

