-- Key binding helper (shows pending keybinds)
-- Lazy-loaded on VimEnter
vim.api.nvim_create_autocmd('VimEnter', {
  once = true,
  callback = function()
    vim.pack.add({ 'https://github.com/folke/which-key.nvim' })

    require('which-key').setup()

    require('which-key').add {
      { '<leader>c', group = '[C]ode' },
      { '<leader>d', group = '[D]ocument' },
      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      { '<leader>l', group = '[L]SP' },
      { '<leader>p', group = '[P]earch' },
      { '<leader>q', group = '[Q]uickfix' },
      { '<leader>r', group = '[R]ename' },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>w', group = '[W]orkspace' },
      { '<leader>z', group = '[Z]en' },
    }
  end,
})

-- vim: ts=2 sts=2 sw=2 et
