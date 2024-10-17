require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "python", "cpp", "html", "hyprlang"},
  sync_install = true,
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
