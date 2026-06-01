-- Collection of small independent plugins/modules
vim.pack.add({ 'https://github.com/echasnovski/mini.nvim' })

-- Better Around/Inside textobjects
-- Examples:
--  - va)  - [V]isually select [A]round [)]paren
--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
--  - ci'  - [C]hange [I]nside [']quote
require('mini.ai').setup { n_lines = 500 }

-- vim: ts=2 sts=2 sw=2 et
