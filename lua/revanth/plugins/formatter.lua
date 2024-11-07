return {
  'stevearc/conform.nvim',
  config = function()
    local config = require "conform"
    config.setup({
      rust = { "rustfmt" },
      format_on_save = {
        lsp_format = "fallback",
      },
    })
  end
}
