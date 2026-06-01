vim.loader.enable()

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
-- Plugin files in plugin/ are auto-sourced by Neovim in alphabetical order.
-- See plugin/ directory for vim.pack.add() calls and plugin configuration.

-- vim: ts=2 sts=2 sw=2 et
