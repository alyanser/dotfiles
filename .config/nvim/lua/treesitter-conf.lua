require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "python", "cpp", "html", "hyprlang"},
  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    disable = {},
  },

  indent = { enable = true },

  autopairs = {
    enable = true,
  },

  context_commentstring = {
    enable = true,
    enable_autocmd = false
  },
}
