require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "python", "cpp", "html", "hyprlang"},

  highlight = {
    enable = true,
  },

  indent = { 
    enable = false
  },

  folds = {
    enable = false
  },

  -- autopairs = {
  --   enable = false,
  -- },

  -- context_commentstring = {
  --   enable = false,
  -- },
}
