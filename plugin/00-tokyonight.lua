-- Colorscheme: must load first (before other plugins)
vim.pack.add({ 'https://github.com/folke/tokyonight.nvim' })

local tokyonight = require 'tokyonight'
tokyonight.setup({
  on_colors = function(colors)
    colors.bg = '#000000'
  end,
  on_highlights = function(hl)
    hl.CursorLine = { fg = nil, bg = "#1c1c28" }
  end,
})

vim.cmd.colorscheme 'tokyonight-night'

-- vim: ts=2 sts=2 sw=2 et
