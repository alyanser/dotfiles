return {
	{
	"saghen/blink.cmp",
		opts = {
			completion = {
				trigger = {
					show_on_insert = false,
					show_on_trigger_character = false,
				},
				menu = { auto_show = false },
				ghost_text = { enabled = false },
			},
			cmdline = { enabled = false },
			signature = { enabled = false },
			keymap = {
				['<Tab>'] = {'show', 'select_next'},
				['<S-Tab>'] = {'select_prev'},
			},
		},
	},
}
