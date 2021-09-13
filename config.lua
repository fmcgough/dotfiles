-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
-- vim:fdm=marker:

-- general {{{
lvim.format_on_save = false
lvim.lint_on_save = false
vim.opt.background = "light"
vim.opt.colorcolumn = "120"
-- }}}

-- colour scheme config in Lua
local colorscheme = "pencil-color" -- "neon", "material", "tokyonight", "github", "PaperColor"
-- tokyonight {{{
vim.g.tokyonight_style = "day"
vim.g.tokyonight_italic_functions = false
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer", "NvimTree" }
vim.g.tokyonight_day_brightness = 0.4
vim.g.neon_bold = true
vim.g.neon_style = "light"
-- }}}

-- neon {{{
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
-- }}}

-- edge {{{
vim.g.edge_style = "light"
-- }}}

-- material {{{
vim.g.material_style = "lighter"
vim.g.material_lighter_contrast = true
vim.g.material_borders = true
vim.g.material_italic_comments = true
-- }}}

-- PaperColor {{{
vim.g.PaperColor_Theme_Options = {
  theme = {
    default = {
      allow_italic = 1,
    },
    ["default.light"] = {
      override = {
        linenumber_bg = { "#dadada", "253" },
      },
    },
  },
}

-- pencil statusline colours:
-- let s:base03  = {'t': s:ansi_colors ?   8 : (s:tty ? '0' : 234), 'g': '#212121'}
--   let s:base02  = {'t': s:ansi_colors ? '0' : (s:tty ? '0' : 235), 'g': '#424242'}
--   let s:base01  = {'t': s:ansi_colors ?  10 : (s:tty ? '0' : 240), 'g': '#909090'}
--   let s:base00  = {'t': s:ansi_colors ?  11 : (s:tty ? '7' : 241), 'g': '#545454'}
--   let s:base0   = {'t': s:ansi_colors ?  12 : (s:tty ? '7' : 244), 'g': '#B2B2B2'}
--   let s:base1   = {'t': s:ansi_colors ?  14 : (s:tty ? '7' : 245), 'g': '#636363'}
--   let s:base2   = {'t': s:ansi_colors ?   7 : (s:tty ? '7' : 254), 'g': '#D9D9D9'}
--   let s:base3   = {'t': s:ansi_colors ?  15 : (s:tty ? '7' : 7  ), 'g': '#C6C6C6'}
--   let s:darkblue= {'t': s:ansi_colors ?   4 : (s:tty ? '4' : 24 ), 'g': '#005F87'}
--   let s:orange  = {'t': s:ansi_colors ?   9 : (s:tty ? '1' : 166), 'g': '#D75F5F'}
--   let s:red     = {'t': s:ansi_colors ?   1 : (s:tty ? '1' : 160), 'g': '#C30771'}
--   let s:magenta = {'t': s:ansi_colors ?   5 : (s:tty ? '5' : 125), 'g': '#E32791'}
--   let s:violet  = {'t: s:ansi_colors ?  13 : (s:tty ? '5' : 61 ), 'g': '#6855DE'}
--   let s:blue    = {'t': s:ansi_colors ?   4 : (s:tty ? '4' : 33 ), 'g': '#008EC4'}
--   let s:cyan    = {'t': s:ansi_colors ?   6 : (s:tty ? '6' : 37 ), 'g': '#20A5BA'}
--   let s:green   = {'t': s:ansi_colors ?   2 : (s:tty ? '2' : 64 ), 'g': '#10A778'}


if colorscheme == "PaperColor" then
  vim.cmd [[ highlight SignColumn ctermbg=253 guibg=#dadada ]]
  vim.cmd [[ highlight! link SignifySignAdd             DiffAdd]]
  vim.cmd [[ highlight! link SignifySignChange          DiffChange ]]
  vim.cmd [[ highlight! link SignifySignDelete          DiffDelete ]]
  vim.cmd [[ highlight! link SignifySignChangeDelete    SignifySignChange ]]
  vim.cmd [[ highlight! link SignifySignDeleteFirstLine SignifySignDelete ]]
end

-- }}}

-- keymappings {{{
-- view all the defaults by pressing <leader>Lk
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<CR>"] = ":"
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
-- }}}

-- misc other builtin plugins {{{
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true

lvim.builtin.telescope.defaults.layout_config.prompt_position = "top"
lvim.builtin.telescope.defaults.sorting_strategy = "ascending"

lvim.builtin.lualine.style = "lvim"
lvim.builtin.lualine.options.theme = "auto"
lvim.builtin.lualine.options.section_separators = { "", "" }
lvim.builtin.lualine.options.component_separators = { "", "" }
lvim.builtin.lualine.options.disabled_filetypes = { "lua" }
lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.extensions = { "nvim-tree" }

lvim.builtin.gitsigns.opts.signs.add.text = "▌"
lvim.builtin.gitsigns.opts.signs.change.text = "▌"
lvim.builtin.gitsigns.opts.signs.changedelete.text = "▌"

lvim.builtin.bufferline.active = false
-- }}}

-- NvimTree {{{
local nvimtree = lvim.builtin.nvimtree
nvimtree.side = "left"
nvimtree.width = 45
nvimtree.show_icons.git = 1
nvimtree.show_icons = {
  git = 1,
  folders = 1,
  files = 1,
  folder_arrows = 0,
}
nvimtree.icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "✗",
    staged = "✓",
    unmerged = "",
    renamed = "➜",
    untracked = "★",
    deleted = "",
    ignored = "◌",
  },
  folder = {
    -- arrow_open = "",
    -- arrow_closed = "",
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
    symlink_open = "",
  },
  lsp = {
    hint = "",
    info = "",
    warning = "",
    error = "",
  },
}
-- }}}

-- treesitter {{{
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {}
lvim.builtin.treesitter.ignore_install = {} -- e.g. { "haskell" }
lvim.builtin.treesitter.highlight.enable = true
-- }}}

-- telescope {{{
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
-- }}}

-- LSP settings {{{
-- generic settings
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
-- }}}

-- Additional Plugins {{{
lvim.plugins = {

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
    "tpope/vim-surround",
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
    "rktjmp/lush.nvim"
  },

  -- themes
  {
    "Th3Whit3Wolf/space-nvim",
  },
  {
    "marko-cerovac/material.nvim",
  },
  {
    "folke/tokyonight.nvim",
  },
  {
    "NLKNguyen/papercolor-theme",
  },
  {
    "rafamadriz/neon",
  },
  {
    "fmcgough/pencil-color.nvim"
  },
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

  -- {
  --     "ray-x/lsp_signature.nvim",
  --     config = function() require"lsp_signature".on_attach() end,
  --     event = "InsertEnter"
  -- }
}
-- }}}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }

-- Load the colorscheme at the end
lvim.colorscheme = colorscheme
