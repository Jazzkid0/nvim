return { -- You can easily change to a different colorscheme.
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
  'folke/tokyonight.nvim',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    local tokyonight = require 'tokyonight'

    tokyonight.setup({
      on_colors = function(colors)
        colors.bg = '#000000'
      end,

      on_highlights = function(hl)
        hl.CursorLine = { fg = nil, bg = "#111113" }
      end,
    })

    vim.cmd.colorscheme 'tokyonight-night'
  end,

}
-- vim: ts=2 sts=2 sw=2 et
