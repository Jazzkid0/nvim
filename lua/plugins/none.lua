return {
  'nvimtools/none-ls.nvim',

  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.code_actions.gitrebase,
        null_ls.builtins.code_actions.gitsigns.with({
          config = {
            filter_actions = function(title)
              return title:lower():match("blame") == nil
            end,
          },
        }),
      },
    })

    local NOTES_DIR = vim.fn.expand("~/notes")

    local function extract_internal_link(line, col)
      local s, e, link = line:find("%[%[([^%]]+)%]%]")
      if not s then return nil end
      if col < s or col > e then return nil end
      return link
    end

    local internal_link_action = {
      name = "create_markdown_from_internal_link",
      method = null_ls.methods.CODE_ACTION,
      filetypes = { "markdown" },
      generator = {
        fn = function(params)
          local row = params.row
          local col = params.col
          local line = params.content[row]
          if not line then return end

          local link = extract_internal_link(line, col)
          if not link then return end

          local filename = link .. ".md"
          local path = NOTES_DIR .. "/" .. filename

          return {
            {
              title = "Create note: " .. filename,
              action = function()
                if vim.loop.fs_stat(path) then
                  vim.notify("File already exists: " .. path, vim.log.levels.INFO)
                  vim.cmd.edit(path)
                  return
                end

                local lines = {
                  "---",
                  "title: " .. link,
                  "created: " .. os.date("%Y-%m-%d"),
                  "---",
                  "",
                  "# " .. link,
                  "",
                }

                vim.fn.mkdir(NOTES_DIR, "p")
                vim.fn.writefile(lines, path)

                vim.cmd.edit(path)
              end,
            },
          }
        end,
      },
    }

  null_ls.register(internal_link_action)
  end
}
