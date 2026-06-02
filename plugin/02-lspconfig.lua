-- LSP Configuration
vim.pack.add({
  'https://github.com/folke/lazydev.nvim',
  'https://github.com/Bilal2453/luvit-meta',
  'https://github.com/neovim/nvim-lspconfig',
})

-- lazydev config: load luvit types when vim.uv is found
require('lazydev').setup({
  library = {
    { path = 'luvit-meta/library', words = { 'vim%.uv' } },
  },
})

local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = true })
local detach_augroup = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true })

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc)
      vim.keymap.set('n', keys, func, { buf = event.buf, desc = 'LSP: ' .. desc })
    end

    map('gp', function()
      vim.api.nvim_echo({ { "use <C-t> instead!", "WarningMsg" } }, true, {})
      vim.cmd('pop')
    end, '[G]oto [P]revious')
    map('gd', function() Snacks.picker.lsp_definitions() end, '[G]oto [D]efinition')
    map('gr', function() Snacks.picker.lsp_references() end, '[G]oto [R]eferences')
    map('gI', function() Snacks.picker.lsp_implementations() end, '[G]oto [I]mplementation')
    map('<leader>D', function() Snacks.picker.lsp_type_definitions() end, 'Type [D]efinition')
    map('<leader>ds', function() Snacks.picker.lsp_symbols() end, '[D]ocument [S]ymbols')
    map('<leader>ws', function() Snacks.picker.lsp_workspace_symbols() end, '[W]orkspace [S]ymbols')
    map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    map('K', vim.lsp.buf.hover, 'Hover Documentation')
    map('H', vim.lsp.buf.signature_help, 'Signature Help')

    -- LSP control
    map('<leader>lr', function() vim.cmd('LspRestart') end, '[R]estart')
    map('<leader>ls', function() vim.cmd('LspStart') end, '[S]tart')
    map('<leader>lt', function() vim.cmd('LspStop') end, 's[T]op')
    map('<leader>li', function() vim.cmd('LspInfo') end, '[I]nfo')
    map('<leader>ll', function() vim.cmd('LspInfo') end, '[L]og')

    -- Highlight symbol under cursor
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buf = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buf = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })
      vim.api.nvim_create_autocmd('LspDetach', {
        group = detach_augroup,
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buf = event2.buf }
        end,
      })
    end

    -- Inlay hints
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
      map('<leader>th', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
      end, '[T]oggle Inlay [H]ints')
    end
  end,
})

-- Configure and enable LSP servers
local capabilities = require('blink.cmp').get_lsp_capabilities()
local servers = {
  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
      },
    },
  },
  clangd = {},
  gleam = {},
  markdown_oxide = {
    capabilities = {
      workspace = {
        didChangeWatchedFiles = {
          dynamicRegistration = true,
        },
      },
    },
  },
  nixd = {},
  ts_ls = {},
}

for server, config in pairs(servers) do
  config.capabilities = config.capabilities or capabilities
  vim.lsp.config[server] = config
  vim.lsp.enable(server)
end

-- vim: ts=2 sts=2 sw=2 et
