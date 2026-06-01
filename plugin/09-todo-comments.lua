-- Highlight todo, notes, etc in comments
-- Lazy-loaded on VimEnter
vim.api.nvim_create_autocmd('VimEnter', {
  once = true,
  callback = function()
    vim.pack.add({
      'https://github.com/nvim-lua/plenary.nvim',
      'https://github.com/folke/todo-comments.nvim',
    })

    require('todo-comments').setup({ signs = false })
  end,
})

-- vim: ts=2 sts=2 sw=2 et
