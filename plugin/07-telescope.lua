-- Fuzzy Finder (files, lsp, etc)
-- Lazy-loaded on VimEnter
vim.api.nvim_create_autocmd('VimEnter', {
  once = true,
  callback = function()
    local specs = {
      'https://github.com/nvim-lua/plenary.nvim',
      'https://github.com/nvim-telescope/telescope.nvim',
      'https://github.com/nvim-telescope/telescope-ui-select.nvim',
    }

    -- fzf-native: only if make is available
    if vim.fn.executable('make') == 1 then
      table.insert(specs, 2, 'https://github.com/nvim-telescope/telescope-fzf-native.nvim')
    end

    -- web-devicons: only with nerd font
    if vim.g.have_nerd_font then
      table.insert(specs, 'https://github.com/nvim-tree/nvim-web-devicons')
    end

    vim.pack.add(specs)

    -- NOTE: Shim for nvim-treesitter API compatibility.
    local ok, ts_parsers = pcall(require, 'nvim-treesitter.parsers')
    if ok then
      if not ts_parsers.ft_to_lang then
        ts_parsers.ft_to_lang = function(ft)
          return vim.treesitter.language.get_lang(ft) or ft
        end
      end
      if not ts_parsers.get_parser then
        ts_parsers.get_parser = vim.treesitter.get_parser
      end
    end

    local ok2, ts_configs = pcall(require, 'nvim-treesitter.configs')
    if not ok2 then
      package.preload['nvim-treesitter.configs'] = function()
        local M = {}
        function M.is_enabled(_, lang, bufnr)
          local ok3, parser = pcall(vim.treesitter.get_parser, bufnr, lang)
          return ok3 and parser ~= nil
        end
        function M.get_module()
          return { additional_vim_regex_highlighting = false }
        end
        return M
      end
    end

    require('telescope').setup {
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>ph', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>pk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>ps', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
    vim.keymap.set('n', '<leader>pw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>pd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>pr', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>p.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>pb', builtin.buffers, { desc = '[S]earch [B]uffers' })
    vim.keymap.set('n', '<leader>pl', builtin.loclist, { desc = '[S]earch [L]oclist' })
    vim.keymap.set('n', '<leader>pq', builtin.quickfix, { desc = '[S]earch [Q]uickfix' })
    vim.keymap.set('n', '<leader>p-', builtin.quickfixhistory, { desc = '[S]earch [-]quickfix history' })
    vim.keymap.set('n', '<leader>pp', builtin.registers, { desc = '[S]earch [P]registers' })
    vim.keymap.set('n', '<leader>pj', builtin.jumplist, { desc = '[S]earch [J]umplist' })
    vim.keymap.set('n', '<leader>pt', builtin.tagstack, { desc = '[S]earch [T]agstack' })
    vim.keymap.set('n', '<leader>pm', builtin.marks, { desc = '[S]earch [M]arks' })

    vim.keymap.set('n', '<leader>p?', function() vim.cmd('Telescope noice') end, { desc = '[S]earch [?]nvim output messages' })

    vim.keymap.set('n', '<leader>/', function()
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    vim.keymap.set('n', '<leader>p/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[S]earch [/] within Open Files' })

    vim.keymap.set('n', '<leader>pn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[S]earch [N]eovim files' })

    vim.keymap.set('n', '<leader>p!', function()
      builtin.find_files { cwd = '~/notes' }
    end, { desc = '[S]earch [!]Notes' })
  end,
})

-- vim: ts=2 sts=2 sw=2 et
