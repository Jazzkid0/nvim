-- Git integration
vim.pack.add({ 'https://github.com/tpope/vim-fugitive' })

vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = 'Git status' })

-- vim: ts=2 sts=2 sw=2 et
