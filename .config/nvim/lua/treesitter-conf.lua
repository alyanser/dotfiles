require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "python", "cpp", "html", "hyprlang"},
  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
  },

  indent = { 
    enable = false
  },

  autopairs = {
    enable = false,
  },

  context_commentstring = {
    enable = false,
  },
}
