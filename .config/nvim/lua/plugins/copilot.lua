return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true, -- show suggestions automatically as you type
				deboucne = 75,
        keymap = {
          accept = "<C-l>",        -- accept suggestion
          next = "<M-]>",          -- cycle to next suggestion
          prev = "<M-[>",          -- cycle to previous
          dismiss = "<C-]>",       -- dismiss
        },
      },
      panel = { enabled = true }, -- optional side panel UI
    },
  },
}

