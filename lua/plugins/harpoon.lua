return {
  'theprimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
    local harpoon = require 'harpoon'

    harpoon:setup()

    vim.keymap.set('n', '<leader>m', function() harpoon:list():add() end, { desc = 'Add file to harpoon' })

    vim.keymap.set('n', '<M-m>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    vim.keymap.set('n', '<M-n>', function() harpoon:list():select(1) end)
    vim.keymap.set('n', '<M-e>', function() harpoon:list():select(2) end)
    vim.keymap.set('n', '<M-i>', function() harpoon:list():select(3) end)
    vim.keymap.set('n', '<M-o>', function() harpoon:list():select(4) end)
    vim.keymap.set('n', '<M-h>', function() harpoon:list():select(5) end)
    vim.keymap.set('n', '<M-k>', function() harpoon:list():select(6) end)
    vim.keymap.set('n', '<M-l>', function() harpoon:list():select(7) end)
    vim.keymap.set('n', '<M-j>', function() harpoon:list():select(8) end)

    vim.keymap.set('n', '<M-,>', function() harpoon:list():prev() end)
    vim.keymap.set('n', '<M-.>', function() harpoon:list():next() end)

    -- basic telescope configuration
    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    vim.keymap.set('n', '<leader>px', function()
      toggle_telescope(harpoon:list())
    end, { desc = '[S]earch [X]harpoon buffers' })
  end,
}
