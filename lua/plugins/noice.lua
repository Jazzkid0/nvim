return {
  "folke/noice.nvim",
  event = "VeryLazy",
  config = function()
    local noice = require("noice")
    noice.setup {
      presets = {
        bottom_search = false,
      }
    }
  end
}
