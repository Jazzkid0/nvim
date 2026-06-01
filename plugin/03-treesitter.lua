-- Tree-sitter: highlight, edit, and navigate code
-- Build hook (TSUpdate on install/update) is in lua/autocmds.lua
vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter' })

require('nvim-treesitter').setup({
  ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
})

-- vim: ts=2 sts=2 sw=2 et
