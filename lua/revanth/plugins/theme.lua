return {
  'tanvirtin/monokai.nvim',
  priority = 1000,
  config = function()
    -- local transparent = true -- set to true if you would like to enable transparency
    local config = require "monokai"

    -- local bg = "#011628"
    -- local bg_dark = "#011423"
    -- local bg_highlight = "#143652"
    -- local bg_search = "#0A64AC"
    -- local bg_visual = "#275378"
    -- local fg = "#CBE0F0"
    -- local fg_dark = "#B4D0E9"
    -- local fg_gutter = "#627E97"
    -- local border = "#547998"

    config.setup({})
  end,
}
