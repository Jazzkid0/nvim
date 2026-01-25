-- [[ Basic Keymaps ]]
--  See `:help map()`

local map = vim.keymap.set

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map('n', '<Esc>', vim.cmd.nohlsearch)

map('n', '<leader>ff', vim.cmd.Ex, { desc = 'Open netrw file explorer' })

-- Diagnostic keymaps
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix List' })
-- Diag jumps
local function diag_jump(user_opts)
  return function()
    vim.diagnostic.jump(vim.tbl_extend("force", {
      on_jump = function()
        vim.schedule(vim.cmd("normal! zz"))
        vim.diagnostic.open_float()
      end,
    }, user_opts or {}))
  end
end

map('n', '[d' , diag_jump({ count = -1 }), { desc = 'Previous Diagnostic'} )
map('n', ']d' , diag_jump({ count = 1 }), { desc = 'Next Diagnostic'} )
map('n', '[e' , diag_jump({ count = -1, severity = vim.diagnostic.severity.ERROR, }), { desc = 'Previous Error'} )
map('n', ']e' , diag_jump({ count = 1, severity = vim.diagnostic.severity.ERROR, }), { desc = 'Next Error'} )
map('n', '[w' , diag_jump({ count = -1, severity = vim.diagnostic.severity.WARN, }), { desc = 'Previous Warning'} )
map('n', ']w' , diag_jump({ count = 1, severity = vim.diagnostic.severity.WARN, }), { desc = 'Next Warning'} )

map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

--  See `:help wincmd` for a list of all window commands
map('n', '<C-h>', '<C-w>h', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w>l', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w>k', { desc = 'Move focus to the upper window' })
map('n', '<C-Left>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-Right>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-Down>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-Up>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Navigate wrapped text with alt
map('n', '<M-j>', 'gj')
map('n', '<M-k>', 'gk')

-- Move multiple highlighted lines with capitals
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

-- Keep the cursor in the right place (joining, scrolling, searching)
map('n', 'J', 'mzJ`z')
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- Find and replace with word under cursor
map('n', '<leader>s', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>', { desc = 'Find and replace word' })

-- vim: ts=2 sts=2 sw=2 et
