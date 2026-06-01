-- Completion engine
vim.pack.add({
  { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('*') },
  'https://github.com/rafamadriz/friendly-snippets',
})

require('blink.cmp').setup({
  keymap = { preset = 'default' },
  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = 'mono',
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
})

-- vim: ts=2 sts=2 sw=2 et
