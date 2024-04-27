return {
  {
    "catppuccin",
    opts = function(_, opts)
      opts.flavour = "latte"
      opts.show_end_of_buffer = true
      opts.styles = {
        conditionals = { "italic", "bold" },
        keywords = { "bold" },
        booleans = { "bold" },
      }
      opts.custom_highlights = function(colours)
        return {
          LineNr = { bg = colours.crust, fg = colours.surface1 },
          SignColumn = { link = "LineNr" },
          ColorColumn = { bg = colours.crust },
          GitSignsAdd = { bg = colours.crust, fg = colours.green },
          GitSignsChange = { bg = colours.crust, fg = colours.yellow },
          GitSignsDelete = { bg = colours.crust, fg = colours.red },
          StorageClass = { fg = colours.pink },
          Type = { link = "StorageClass" },
        }
      end
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },

  {
    "echasnovski/mini.indentscope",
    enabled = false,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
  },
  {
    "folke/tokyonight.nvim",
    enabled = false,
  },

  {
    "akinsho/bufferline.nvim",
    opts = function(_, opts)
      opts.options.always_show_bufferline = true
      opts.options.separator_style = "slant"
    end,
  },

  {
    "rcarriga/nvim-notify",
    opts = function(_, opts)
      opts.timeout = 5000
    end,
  },

  {
    "alexghergh/nvim-tmux-navigation",
    config = function()
      require("nvim-tmux-navigation").setup({
        { "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>" },
        { "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>" },
        { "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>" },
        { "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>" },
      })
    end,
    keys = {
      { "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>" },
      { "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>" },
      { "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>" },
      { "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>" },
    },
  },
}
