return {
  "folke/snacks.nvim",
  opts = {
		dashboard = { enabled = false },
    scroll = { enabled = false },
    animate = { enabled = false },
    indent = {
      enabled = true,
      char = "│",  -- Simple vertical line
      tab = "│",  -- Simple vertical line
	blank = " ",
      only_scope = false,  -- Show all indent levels
      only_current = false,
      animate = { enabled = false },  -- No animation
      -- No fancy colors, just static lines
      scope = {
        enabled = false,  -- Disable scope highlighting
      },
    },
  },
}
