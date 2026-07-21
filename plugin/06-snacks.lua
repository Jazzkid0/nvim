-- snacks.nvim: collection of QoL plugins
vim.pack.add({ 'https://github.com/folke/snacks.nvim' })

require('snacks').setup({
  --- Picker: fuzzy finder replacing telescope
  picker = {
    sources = {
      -- Explorer source: file browser
      explorer = {
        hidden = true,
        ignored = true,
      },
    },
  },

  --- Explorer: file tree replacing neo-tree
  explorer = {
    replace_netrw = true,
  },

  --- Notifier: pretty notifications replacing noice+fidget
  notifier = {
    enabled = true,
    timeout = 3000,
  },

  --- Input: enhanced vim.ui.input
  input = {
    enabled = true,
  },

  --- Indent: indent guides replacing indent-blankline
  indent = {
    enabled = true,
  },

  --- Scope: text objects
  -- Text objects via snacks.nvim scope:
  --  - ii  - select [I]nner [I]ndent scope
  --  - ai  - select [A]round [I]ndent scope (full scope)
  --  - [i  - jump to top edge of scope
  --  - ]i  - jump to bottom edge of scope
  scope = {
    enabled = true,
  },

  --- Zen: distraction-free mode
  zen = {
    enabled = true,
  },

  --- Words: LSP reference navigation
  words = {
    enabled = true,
  },

  --- Dim: focus dimming
  dim = {
    enabled = true,
  },

  --- Statuscolumn: pretty gutter
  statuscolumn = {
    enabled = true,
  },

  --- Dashboard: startup screen
  dashboard = {
    enabled = true,
    sections = {
      { section = 'header' },
      { section = 'keys',   gap = 1, padding = 1 },
      { section = 'recent_files', gap = 1, indent = 2 },
      { section = 'projects',     gap = 1, indent = 2 },
    },
  },

  --- Bigfile: big file protection
  bigfile = {
    enabled = true,
  },

  --- Quickfile: fast file rendering
  quickfile = {
    enabled = true,
  },
})

-- vim: ts=2 sts=2 sw=2 et
