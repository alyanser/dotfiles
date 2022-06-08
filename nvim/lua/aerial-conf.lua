require('aerial').setup {
	close_behavior = "global",
	backends = {
		"lsp",
		"treesitter",
		"markdown",
	},
	min_width = 35,
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
	highlight_closest = false,
}
