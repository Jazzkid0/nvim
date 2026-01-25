-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
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

-- vim: ts=2 sts=2 sw=2 et
