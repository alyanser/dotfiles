local M = {}

M.disabled = {

	-- i = {
	-- 	["<C-h>"] = "",
	-- 	["<C-l>"] = "",
	-- 	["<C-k>"] = "",
	-- 	["<C-j>"] = "",
	-- },

	n = {
		["<leader>x"] = "",
	}
}

M.maps = {

	n = {
		["<leader>xx"] = { "<cmd> TroubleToggle <CR>", "Toggle trouble" },
		["<leader>xd"] = { "<cmd> Trouble document_diagnostics <CR>", "Toggle document diagnostics" },
		["gpd"] = { "<cmd> lua require('goto-preview').goto_preview_definition()<CR>", "Preview definition" },
		["gpi"] = { "<cmd> lua require('goto-preview').goto_preview_implementation()<CR>", "Preview implementation" },
		["gpx"] = { "<cmd>lua require('goto-preview').close_all_win()<CR>", "Close all previews" },
		["gw"] = { "<cmd> HopWord <CR>", "Hop Word" },
		["gl"] = { "<cmd> HopLineStart <CR>", "Hop Line Start" },
		["g/"] = { "<cmd> HopPattern <CR>", "Hop Pattern" },
	},
}

return M
