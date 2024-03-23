require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "python", "cpp", "html", "hyprlang"},
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = false },
}
