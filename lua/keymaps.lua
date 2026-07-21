-- [[ Basic Keymaps ]]
--  See `:help map()`

local map = vim.keymap.set

-- Diagnostic keymaps
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix List' })
-- Diag jumps (on_jump callback defined in vim.diagnostic.config)
map('n', '[d', function() vim.diagnostic.jump { count = -1 } end, { desc = 'Previous Diagnostic' })
map('n', ']d', function() vim.diagnostic.jump { count = 1 } end, { desc = 'Next Diagnostic' })
map('n', '[e', function() vim.diagnostic.jump { count = -1, severity = vim.diagnostic.severity.ERROR } end, { desc = 'Previous Error' })
map('n', ']e', function() vim.diagnostic.jump { count = 1, severity = vim.diagnostic.severity.ERROR } end, { desc = 'Next Error' })
map('n', '[w', function() vim.diagnostic.jump { count = -1, severity = vim.diagnostic.severity.WARN } end, { desc = 'Previous Warning' })
map('n', ']w', function() vim.diagnostic.jump { count = 1, severity = vim.diagnostic.severity.WARN } end, { desc = 'Next Warning' })

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
map('n', '<leader>o', '<C-w><C-o>', { desc = '[O]nly show this window' })

-- Navigate wrapped text with alt
map('n', '<M-Down>', 'gj')
map('n', '<M-Up>', 'gk')

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

-- Picker keymaps (snacks.nvim)
vim.keymap.set('n', '<leader>ph', function() Snacks.picker.help() end, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>pk', function() Snacks.picker.keymaps() end, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>pf', function() Snacks.picker.files() end, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>pw', function() Snacks.picker.grep_word() end, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>pg', function() Snacks.picker.grep() end, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>pd', function() Snacks.picker.diagnostics() end, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>pr', function() Snacks.picker.resume() end, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>p.', function() Snacks.picker.recent() end, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader><leader>', function() Snacks.picker.buffers() end, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>pb', function() Snacks.picker.buffers() end, { desc = '[S]earch [B]uffers' })
vim.keymap.set('n', '<leader>pl', function() Snacks.picker.loclist() end, { desc = '[S]earch [L]oclist' })
vim.keymap.set('n', '<leader>pq', function() Snacks.picker.qflist() end, { desc = '[S]earch [Q]uickfix' })
vim.keymap.set('n', '<leader>pp', function() Snacks.picker.registers() end, { desc = '[S]earch [P] Registers' })
vim.keymap.set('n', '<leader>pj', function() Snacks.picker.jumps() end, { desc = '[S]earch [J]umplist' })
vim.keymap.set('n', '<leader>pm', function() Snacks.picker.marks() end, { desc = '[S]earch [M]arks' })
vim.keymap.set('n', '<leader>p?', function() Snacks.picker.notifications() end, { desc = '[S]earch [?]notifications' })
vim.keymap.set('n', '<leader>/', function() Snacks.picker.lines() end, { desc = '[/] Search in current buffer' })
vim.keymap.set('n', '<leader>p/', function() Snacks.picker.grep_buffers() end, { desc = '[S]earch [/] within Open Files' })
vim.keymap.set('n', '<leader>pn', function() Snacks.picker.files({ cwd = vim.fn.stdpath('config') }) end, { desc = '[S]earch [N]eovim files' })
vim.keymap.set('n', '<leader>p!', function() Snacks.picker.files({ cwd = vim.fn.expand('~/notes') }) end, { desc = '[S]earch [!]Notes' })
vim.keymap.set('n', '<leader>pc', function() Snacks.picker.commands() end, { desc = '[S]earch [C]ommands' })
vim.keymap.set('n', '<leader>pC', function() Snacks.picker.colorschemes() end, { desc = '[S]earch [C]olorschemes' })
vim.keymap.set('n', '<leader>pu', function() Snacks.picker.undo() end, { desc = '[S]earch [U]ndo history' })

-- Explorer keymap (replaces neo-tree)
vim.keymap.set('n', '\\', function() Snacks.explorer() end, { desc = 'Explorer' })

-- Zen mode (replaces manual zen keymaps)
vim.keymap.set('n', '<leader>zz', function() Snacks.zen() end, { desc = 'Toggle Zen Mode' })
vim.keymap.set('n', '<leader>zZ', function() Snacks.zen.zoom() end, { desc = 'Toggle Zoom' })

-- Words: LSP reference navigation
vim.keymap.set('n', ']]', function() Snacks.words.jump(vim.v.count1) end, { desc = 'Next Reference' })
vim.keymap.set('n', '[[', function() Snacks.words.jump(-vim.v.count1) end, { desc = 'Prev Reference' })

-- vim: ts=2 sts=2 sw=2 et
