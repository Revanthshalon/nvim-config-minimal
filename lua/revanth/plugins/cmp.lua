return {
    "saghen/blink.cmp",
    event = { "LspAttach", "InsertCharPre" },
    version = "v0.*",
    opts = {
      highlight = {
        use_nvim_cmp_as_default = true,
      },

      trigger = { signature_help = { enabled = true } },

      keymap = {
        ["<CR>"] = { "select_and_accept", "fallback" },
        ["<C-n>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<C-y>"] = { "scroll_documentation_down" },
        ["<C-e>"] = { "scroll_documentation_up" },
      },

      windows = {
        autocomplete = {
          border = "single",
        },
        documentation = {
          border = "single",
        },
      },
    },
  }
