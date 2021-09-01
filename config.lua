-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.format_on_save = false
lvim.lint_on_save = false
vim.opt.background = "light"
vim.opt.colorcolumn = "120"

-- colour scheme config in Lua
vim.g.tokyonight_style = "day"
vim.g.tokyonight_italic_functions = false
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer", "NvimTree" }
vim.g.tokyonight_day_brightness = 0.4
vim.g.neon_bold = true
vim.g.neon_style = "light"

-- default:
-- diff_red = "#fb4934",
-- diff_green = "#8ec07c",
-- diff_blue = "#458588",
-- diff_yellow = "#fabd2f",

-- light:
-- colors.diff_red = "#55393d"
-- colors.diff_green = "#394634"
-- colors.diff_blue = "#354157"
-- colors.diff_yellow = "#4e432f"

local diff_red = "#fb4934"
local diff_green = "#8ec07c"
local diff_blue = "#458588"
local diff_yellow = "#fabd2f"
vim.g.neon_overrides = {
  DiffAdd = { fg = diff_green },
  DiffChange = { fg = diff_blue },
  DiffDelete = { fg = diff_red },

  diffAdded = { fg = diff_green },
  diffRemoved = { fg = diff_red },
  diffChanged = { fg = diff_blue },

  GitGutterAdd = { fg = diff_green },
  GitGutterChange = { fg = diff_blue },
  GitGutterDelete = { fg = diff_red },

  GitSignsAdd = { fg = diff_green },
  GitSignsAddNr = { fg = diff_green },
  GitSignsAddLn = { fg = diff_green },
  GitSignsChange = { fg = diff_yellow },
  GitSignsChangeNr = { fg = diff_yellow },
  GitSignsChangeLn = { fg = diff_yellow },
  GitSignsDelete = { fg = diff_red },
  GitSignsDeleteNr = { fg = diff_red },
  GitSignsDeleteLn = { fg = diff_red },

  SignifySignAdd = { fg = diff_green },
  SignifySignChange = { fg = diff_yellow },
  SignifySignDelete = { fg = diff_red },
}

vim.g.edge_style = "light"

vim.g.material_style = "lighter"
vim.g.material_lighter_contrast = true
vim.g.material_borders = true
vim.g.material_italic_comments = true

-- Load the colorscheme
lvim.colorscheme = "tokyonight" -- "neon", "material", "tokyonight", "github", "PaperColor"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"
lvim.keys.normal_mode["<S-h>"] = ""
lvim.keys.normal_mode["H"] = "^"
lvim.keys.normal_mode["<S-l>"] = ""
lvim.keys.normal_mode["L"] = "$"
lvim.keys.normal_mode["<Tab>"] = "<cmd>bn<CR>"
lvim.keys.normal_mode["<S-Tab>"] = "<cmd>bp<CR>"
-- mappings overridden by vim-tmux-navigator
lvim.keys.normal_mode["<C-h>"] = "<cmd>TmuxNavigateLeft<cr>"
lvim.keys.normal_mode["<C-j>"] = "<cmd>TmuxNavigateDown<cr>"
lvim.keys.normal_mode["<C-k>"] = "<cmd>TmuxNavigateUp<cr>"
lvim.keys.normal_mode["<C-l>"] = "<cmd>TmuxNavigateRight<cr>"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = {
--   "<cmd>lua require'telescope'.extensions.project.project{}<CR>",
--   "Projects"
-- }
lvim.builtin.which_key.mappings["q"] = { "<cmd>q<cr>", "Quit" }
lvim.builtin.which_key.mappings["Q"] = { "<cmd>q!<cr>", "Quit without saving" }
lvim.builtin.which_key.mappings.b["b"] = { "<cmd>Telescope buffers<cr>", "Find buffer" }
lvim.builtin.which_key.mappings.b["d"] = { "<cmd>bdelete<cr>", "Delete buffer" }
lvim.builtin.which_key.mappings.g["d"] = { "<cmd>Gvdiffsplit<cr>", "Git diff" }
lvim.builtin.which_key.mappings.g["w"] = { "<cmd>lua require'gitsigns'.toggle_word_diff()<cr>", "Toggle word diff" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  t = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

lvim.builtin.bufferline.active = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

lvim.builtin.telescope.defaults.layout_config.prompt_position = "top"
lvim.builtin.telescope.defaults.sorting_strategy = "ascending"

-- lvim.builtin.galaxyline.active = false
lvim.builtin.lualine.options.theme = "tokyonight"
lvim.builtin.lualine.options.section_separators = {'', ''}
lvim.builtin.lualine.options.component_separators = {'', ''}

lvim.builtin.gitsigns.opts.signs.add.text = "▌"
lvim.builtin.gitsigns.opts.signs.change.text = "▌"
lvim.builtin.gitsigns.opts.signs.changedelete.text = "▌"

require("telescope").setup({
  defaults = {
    -- Your defaults config goes in here
    theme = "dropdown",
    mappings = {
      i = {},
    },
  },
  pickers = {
    -- Your special builtin config goes in here
    buffers = {
      sort_lastused = true,
      -- theme = "dropdown",
      previewer = false,
      mappings = {
        i = {
          ["<c-d>"] = require("telescope.actions").delete_buffer,
          -- Right hand side can also be the name of the action as a string
          -- ["<c-d>"] = "delete_buffer",
        },
        n = {
          ["<c-d>"] = require("telescope.actions").delete_buffer,
        },
      },
    },
    find_files = {
      -- theme = "dropdown"
    },
    oldfiles = {
      -- theme = "dropdown"
    },
  },
  extensions = {
    -- Your extension config goes in here
  },
})

-- generic LSP settings
-- disable highlighting reference under cursor
lvim.lsp.document_highlight = false
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- set a formatter if you want to override the default lsp one (if it exists)
lvim.lang.lua.formatters = {
  {
    exe = "stylua",
    args = {
      "--indent-type",
      "Spaces",
      "--indent-width",
      "2",
    },
  },
}

lvim.lang.scala.formatters = {
  {
    exe = "scalafmt",
    args = {},
  },
}
lvim.lang.scala.linters = {}

-- lvim.lang.python.formatters = {
--   {
--     exe = "black",
--     args = {}
--   }
-- }
-- set an additional linter
-- lvim.lang.python.linters = {
--   {
--     exe = "flake8",
--     args = {}
--   }
-- }

-- Additional Plugins
lvim.plugins = {
  -- {
  --   "NLKNguyen/papercolor-theme"
  -- },
  -- {
  --   "projekt0n/github-nvim-theme",
  -- config = function()
  --   require("github-theme").setup({
  --     themeStyle = "light",
  --     functionStyle = "italic",
  --     sidebars = {"qf", "vista_kind", "terminal", "packer"},
  --   })
  -- end
  -- },

  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gvdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit",
    },
    ft = { "fugitive" },
  },
  {
    "folke/lsp-colors.nvim",
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "*" }, {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },

  {
    "~/workspace/neon",
  },
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("bufferline").setup({
        options = {
          separator_style = "slant",
          diagnostics = "nvim_lsp",
          diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or level:match("warning") and " " or " "
            return " " .. icon .. count
          end,
          offsets = {
            {
              filetype = "NvimTree",
              text = function()
                return vim.fn.getcwd()
              end,
              highlight = "Directory",
              text_align = "left",
            },
          },
          show_close_icon = false,
        },
      })
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
  },
  {
    "rafcamlet/nvim-luapad",
  },
  {
    "Th3Whit3Wolf/space-nvim",
  },
  {
    "marko-cerovac/material.nvim",
  },

  {
    "folke/tokyonight.nvim",
  },

  -- {
  --     "ray-x/lsp_signature.nvim",
  --     config = function() require"lsp_signature".on_attach() end,
  --     event = "InsertEnter"
  -- }
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
