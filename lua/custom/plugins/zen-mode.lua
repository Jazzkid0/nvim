return {
  "folke/zen-mode.nvim",
  opts = {
    window = {
      backdrop = 1,
      width = 60,
    },
  },
  config = function()
    local zen = require("zen-mode")
    zen.setup {
      vim.keymap.set('n', '<leader>zz', function()
        zen.open() 
        vim.cmd('set wrap')
        vim.cmd('set linebreak')
      end, { desc = "enable zen mode" }),
      vim.keymap.set('n', '<leader>zx', function()
        zen.close() 
        vim.cmd('set nowrap')
        vim.cmd('set nolinebreak')
      end, { desc = "disable zen mode" })
    }
  end
}
