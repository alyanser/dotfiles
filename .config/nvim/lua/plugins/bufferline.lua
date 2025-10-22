return {
  "akinsho/bufferline.nvim",
	lazy = false,
  opts = {
    options = {
      always_show_bufferline = true,
	mode = "buffers",
		enforce_regular_tabs = true,
			close_command = "BufDel",
    },
  },
}
