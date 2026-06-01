-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Name the loclist/quickfix buffer
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    local win = vim.api.nvim_get_current_win()
    local info = vim.fn.getwininfo(win)[1]
    local buf = vim.api.nvim_get_current_buf()
    if info and info.loclist == 1 then
      vim.api.nvim_buf_set_name(buf, "loclist")
    else
      vim.api.nvim_buf_set_name(buf, "quickfix")
    end
  end,
})

-- # vim.pack plugin hooks
-- These fire after install/update/delete events via vim.pack
vim.api.nvim_create_autocmd('PackChanged', { callback = function(ev)
  local name, kind = ev.data.spec.name, ev.data.kind
  local is_change = kind == 'install' or kind == 'update'

  -- Tree-sitter: update parsers after install/update
  if name == 'nvim-treesitter' and is_change then
    if not ev.data.active then
      vim.cmd.packadd('nvim-treesitter')
    end
    vim.cmd('TSUpdate')
  end

  -- telescope-fzf-native: build native module after install/update
  if name == 'telescope-fzf-native.nvim' and is_change then
    if not ev.data.active then
      vim.cmd.packadd('telescope-fzf-native.nvim')
    end
    local dir = vim.fn.stdpath('data') .. '/site/pack/core/opt/telescope-fzf-native.nvim'
    vim.fn.system({ 'make', '-C', dir })
  end
end })

-- vim: ts=2 sts=2 sw=2 et
