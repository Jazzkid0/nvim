-- UI enhancements (cmdline, messages, popupmenu)
vim.pack.add({ 'https://github.com/folke/noice.nvim' })

require('noice').setup {
  presets = {
    bottom_search = false,
  },
}

-- vim: ts=2 sts=2 sw=2 et
