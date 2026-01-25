require('lazy').setup({
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  require 'kickstart.plugins.gitsigns',

  require 'kickstart.plugins.which-key',

  require 'kickstart.plugins.telescope',

  require 'kickstart.plugins.lspconfig',

--  require 'kickstart.plugins.conform',

  require 'kickstart.plugins.cmp',

  require 'kickstart.plugins.tokyonight',

  require 'kickstart.plugins.todo-comments',

  require 'kickstart.plugins.mini',

  require 'kickstart.plugins.treesitter',

  require 'kickstart.plugins.indent_line',

  require 'kickstart.plugins.neo-tree',

  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.lint',
  -- require 'kickstart.plugins.autopairs',

  require 'custom.plugins.harpoon',

  require 'custom.plugins.fugitive',

  require 'custom.plugins.undotree',

  require 'custom.plugins.statusline',

  require 'custom.plugins.noice',

  require 'custom.plugins.none',

  require 'custom.plugins.avante',

  require 'custom.plugins.copilot',

  require 'custom.plugins.rustaceanvim',

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
