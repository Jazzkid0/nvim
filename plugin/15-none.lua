-- Null-ls successor: formatting, diagnostics, code actions
vim.pack.add({
  'https://github.com/nvimtools/none-ls.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
})

local null_ls = require('null-ls')
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.code_actions.gitrebase,
    null_ls.builtins.code_actions.gitsigns.with({
      config = {
        filter_actions = function(title)
          return title:lower():match("blame") == nil
        end,
      },
    }),
  },
})

-- vim: ts=2 sts=2 sw=2 et
