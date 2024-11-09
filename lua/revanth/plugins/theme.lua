return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "storm",
    transparent = true,
    cache = true,
    terminal_colors = true,
    on_colors = function(colors)
      colors.fg_gutter = "#b2b8cf"
    end
  },
  config = function(_, opts)
    local tokyonight = require "tokyonight"
    tokyonight.setup(opts)
    tokyonight.load()
  end
}
