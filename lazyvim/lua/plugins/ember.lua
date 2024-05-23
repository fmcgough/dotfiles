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
}
