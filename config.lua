-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
-- lvim.format_on_save = true
-- lvim.lint_on_save = true
-- vim.opt.background = "light"
vim.opt.colorcolumn = "120"

-- colour scheme config in Lua
vim.g.tokyonight_style = "day"
vim.g.tokyonight_italic_functions = false
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
vim.g.neon_bold = true
vim.g.neon_style = "light"

-- Load the colorscheme
lvim.colorscheme = "neon" -- "tokyonight", "github", "PaperColor"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"
lvim.keys.normal_mode["<S-h>"] = "^"
lvim.keys.normal_mode["<S-l>"] = "$"
lvim.keys.normal_mode["<Tab>"] = "<cmd>BufferNext<CR>"
lvim.keys.normal_mode["<S-Tab>"] = "<cmd>BufferPrevious<CR>"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = {
--   "<cmd>lua require'telescope'.extensions.project.project{}<CR>",
--   "Projects"
-- }
lvim.builtin.which_key.mappings.b["b"] = { "<cmd>Telescope buffers<cr>", "Find buffer" }
lvim.builtin.which_key.mappings.b["d"] = { "<cmd>bdelete<cr>", "Delete buffer" }
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

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

lvim.builtin.telescope.defaults.layout_config.prompt_position = 'top'
lvim.builtin.telescope.defaults.sorting_strategy = "ascending"

require("telescope").setup {
  defaults = {
    -- Your defaults config goes in here
    theme = "dropdown",
    mappings = {
      i = {
      }
    }
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
        }
      }
    },
    find_files = {
      -- theme = "dropdown"
    },
    oldfiles = {
      -- theme = "dropdown"
    }
  },
  extensions = {
    -- Your extension config goes in here
  }
}
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
  {
    "projekt0n/github-nvim-theme",
    -- config = function()
    --   require("github-theme").setup({
    --     themeStyle = "light",
    --     functionStyle = "italic",
    --     sidebars = {"qf", "vista_kind", "terminal", "packer"},
    --   })
    -- end
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
    "rafamadriz/neon"
  },
  -- {
  --   "folke/tokyonight.nvim"
  -- },
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
