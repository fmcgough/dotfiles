return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers.ember = {
        filetypes = {
          "html.handlebars",
          "handlebars",
          "typescript",
          "javascript",
          "typescript.glimmer",
          "javascript.glimmer",
          "glimmer",
        },
      }
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "glimmer",
      })
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    opts = {
      aliases = {
        ["javascript.glimmer"] = "glimmer",
      },
    },
    -- opts = function(_, opts)
    --   opts.filetypes = opts.filetypes or {}
    --   table.insert(opts.filetypes, "gjs")
    --   table.insert(opts.filetypes, "glimmer")
    --   table.insert(opts.filetypes, "javascript.glimmer")
    --   table.insert(opts.filetypes, "typescript.glimmer")
    --   opts.aliases = opts.aliases or {}
    --   opts.aliases["javascript.glimmer"] = "glimmer"
    -- end
  },
}
