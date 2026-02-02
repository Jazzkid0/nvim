require('lazy').setup({
  require 'plugins.gitsigns',

  require 'plugins.which-key',

  require 'plugins.telescope',

  require 'plugins.lspconfig',

  require 'plugins.cmp',

  require 'plugins.tokyonight',

  require 'plugins.todo-comments',

  require 'plugins.mini',

  require 'plugins.treesitter',

  require 'plugins.indent_line',

  require 'plugins.neo-tree',

  -- require 'plugins.conform',
  -- require 'plugins.debug',
  -- require 'plugins.lint',
  -- require 'plugins.autopairs',

  require 'plugins.harpoon',

  require 'plugins.fugitive',

  require 'plugins.undotree',

  require 'plugins.statusline',

  require 'plugins.noice',

  require 'plugins.none',

  -- require 'plugins.avante',

  -- require 'plugins.copilot',

  require 'plugins.rustaceanvim',

}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et
