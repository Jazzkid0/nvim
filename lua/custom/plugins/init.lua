return {
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  require 'custom/plugins/harpoon',

  require 'custom/plugins/fugitive',

  require 'custom/plugins/undotree',

  require 'custom/plugins/statusline',

  require 'custom/plugins/noice',
}
