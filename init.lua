vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

-- Load built-in optional packages (0.12+)
vim.cmd.packadd 'nvim.undotree'

-- # Vanilla nvim configs
-- [[ Setting options ]]
require 'options'

-- [[ Basic Keymaps ]]
require 'keymaps'

-- [[ Autocommands ]]
require 'autocmds'

-- # Plugins
-- [[ Install `lazy.nvim` plugin manager ]]
require 'lazy-bootstrap'

-- [[ Configure and install plugins ]]
require 'lazy-plugins'

-- vim: ts=2 sts=2 sw=2 et
