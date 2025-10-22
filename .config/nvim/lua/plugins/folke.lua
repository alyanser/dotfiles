-- File: lua/plugins/noice_disable_signature.lua
-- Purpose: Lazy.nvim plugin spec to disable Noice's signature help in LazyVim

return {
  {
    "folke/noice.nvim",
    -- modify the existing options to turn off signature help
    opts = function(_, opts)
      opts = opts or {}
      opts.lsp = opts.lsp or {}
      opts.lsp.signature = { enabled = false }
      return opts
    end,
  },
}
