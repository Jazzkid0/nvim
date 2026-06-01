-- File system browser
vim.pack.add({
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range('*') },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/MunifTanjim/nui.nvim',
})

require('neo-tree').setup({
  filesystem = {
    window = {
      mappings = {
        ['\\'] = 'close_window',
      },
    },
  },
})

vim.keymap.set('n', '\\', ':Neotree reveal<CR>', { desc = 'NeoTree reveal' })

-- vim: ts=2 sts=2 sw=2 et
