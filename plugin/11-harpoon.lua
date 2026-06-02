-- File bookmarks / marks
vim.pack.add({
  { src = 'https://github.com/theprimeagen/harpoon', version = 'harpoon2' },
  'https://github.com/nvim-lua/plenary.nvim',
})

local harpoon = require 'harpoon'
harpoon:setup()

vim.keymap.set('n', '<leader>m', function() harpoon:list():add() end, { desc = 'Add file to harpoon' })
vim.keymap.set('n', '<M-m>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set('n', '<M-n>', function() harpoon:list():select(1) end)
vim.keymap.set('n', '<M-e>', function() harpoon:list():select(2) end)
vim.keymap.set('n', '<M-i>', function() harpoon:list():select(3) end)
vim.keymap.set('n', '<M-o>', function() harpoon:list():select(4) end)
vim.keymap.set('n', '<M-h>', function() harpoon:list():select(5) end)
vim.keymap.set('n', '<M-k>', function() harpoon:list():select(6) end)
vim.keymap.set('n', '<M-l>', function() harpoon:list():select(7) end)
vim.keymap.set('n', '<M-j>', function() harpoon:list():select(8) end)
vim.keymap.set('n', '<M-,>', function() harpoon:list():prev() end)
vim.keymap.set('n', '<M-.>', function() harpoon:list():next() end)

-- vim: ts=2 sts=2 sw=2 et
