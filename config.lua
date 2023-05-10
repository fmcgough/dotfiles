--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
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


if colorscheme == "PaperColor" then
  vim.cmd([[ highlight SignColumn ctermbg=253 guibg=#dadada ]])
  vim.cmd([[ highlight! link SignifySignAdd             DiffAdd]])
  vim.cmd([[ highlight! link SignifySignChange          DiffChange ]])
  vim.cmd([[ highlight! link SignifySignDelete          DiffDelete ]])
  vim.cmd([[ highlight! link SignifySignChangeDelete    SignifySignChange ]])
  vim.cmd([[ highlight! link SignifySignDeleteFirstLine SignifySignDelete ]])
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
lvim.keys.visual_mode = lvim.keys.visual_mode or {}
lvim.builtin.which_key.vmappings.l = {}
lvim.builtin.which_key.vmappings.l["a"] = {
  "<cmd>lua vim.lsp.buf.code_action()<CR>",
  "Code Action",
}

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["c"] = { "<cmd>bp<bar>sp<bar>bn<bar>bd<cr>", "Close buffer" }
lvim.builtin.which_key.mappings["q"] = { "<cmd>q<cr>", "Quit" }
lvim.builtin.which_key.mappings["Q"] = { "<cmd>q!<cr>", "Quit without saving" }
lvim.builtin.which_key.mappings.b["b"] = { "<cmd>Telescope buffers initial_mode=insert<cr>", "Find buffer" }
lvim.builtin.which_key.mappings.b["d"] = { "<cmd>bdelete<cr>", "Delete buffer" }
-- lvim.builtin.which_key.mappings.g["d"] = { "<cmd>Gvdiffsplit<cr>", "Git diff" }

lvim.builtin.which_key.mappings.l["r"] = { "<cmd>lua vim.lsp.buf.references()<cr>", "Find references" }
lvim.builtin.which_key.mappings.l["R"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" }

lvim.builtin.which_key.mappings.g["w"] = { "<cmd>lua require'gitsigns'.toggle_word_diff()<cr>", "Toggle word diff" }
lvim.builtin.which_key.mappings["m"] = {
  "<cmd>Telescope metals commands layout_config={height=0.5}<cr>",
  "Metals commands",
}
-- }}}

-- misc other builtin plugins {{{
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
-- lvim.builtin.notify.active = true
lvim.builtin.indentlines.active = false
lvim.builtin.indentlines.options.enabled = false
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

lvim.builtin.telescope.defaults.layout_config.prompt_position = "top"
lvim.builtin.telescope.defaults.sorting_strategy = "ascending"
local telescope_mappings = require("telescope.mappings").default_mappings
telescope_mappings.n["H"] = false
telescope_mappings.n["L"] = false
lvim.builtin.telescope.defaults.mappings = telescope_mappings

lvim.builtin.lualine.style = "lvim"
lvim.builtin.lualine.options.theme = "auto"
lvim.builtin.lualine.options.section_separators = { left = "", right = "" }
lvim.builtin.lualine.options.component_separators = { left = "", right = "" }
lvim.builtin.lualine.options.disabled_filetypes = {} -- { "lua" }
lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.sections.lualine_b = { "filename" }
lvim.builtin.lualine.sections.lualine_c = {
  require("lvim.core.lualine.components").diff, { "vim.g.metals_status", },
}

lvim.builtin.lualine.extensions = { "nvim-tree" }

lvim.builtin.gitsigns.opts.signs.add.text = "▌"
lvim.builtin.gitsigns.opts.signs.change.text = "▌"
lvim.builtin.gitsigns.opts.signs.changedelete.text = "▌"

lvim.builtin.bufferline.active = true
lvim.builtin.bufferline.options.separator_style = "slant"
lvim.builtin.bufferline.options.always_show_bufferline = true

lvim.builtin.terminal.execs = {
  { "gitui", "<leader>gg", "Git UI" },
}

lvim.builtin.illuminate.active = false
lvim.builtin.breadcrumbs.active = false
-- }}}

-- NvimTree {{{
local nvimtree = lvim.builtin.nvimtree
nvimtree.setup.view.side = "left"
nvimtree.setup.view.width = 45
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
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
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
      layout_config = {
        height = 0.4,
      },
    },
    git_files = {
      theme = "dropdown",
      layout_config = {
        height = 0.5,
        width = 0.8,
      },
      -- previewer = false,
    },
    find_files = {
      -- theme = "dropdown"
    },
    oldfiles = {
      -- theme = "dropdown"
    },
    diagnostics = {
      wrap_results = true,
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
lvim.builtin.illuminate.active = false

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  {
    exe = "prettier",
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "markdown", "html.handlebars" },
  },
  {
    exe = "stylua",
    args = {
      "--indent-type",
      "Spaces",
      "--indent-width",
      "2",
    },
    filetypes = { "lua" },
  },
})

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "jdtls" })

local nvim_lsp = require("lspconfig")
nvim_lsp.ember.setup({
  cmd = { vim.fn.stdpath("data") .. "/lsp_servers/ember/node_modules/.bin/ember-language-server", "--stdio" },
  filetypes = { "html.handlebars", "handlebars", "typescript", "javascript" },
  root_dir = nvim_lsp.util.root_pattern("ember-cli-build.js")
})

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tsserver" })
require("lvim.lsp.manager").setup("tsserver", {
  cmd = { vim.fn.stdpath("data") .. "/lsp_servers/tsserver/node_modules/.bin/typescript-language-server", "--stdio" },
  root_dir = nvim_lsp.util.root_pattern("tsconfig.json", "jsconfig.json", ".git"),
})

lvim.builtin.dap.active = true
local dap = require("dap")
dap.configurations.scala = {
  {
    type = "scala",
    request = "launch",
    name = "Run or Test Target",
    metals = {
      runType = "runOrTestFile",
    },
  },
  {
    type = "scala",
    request = "launch",
    name = "Test Target",
    metals = {
      runType = "testTarget",
    },
  },
}

require('lspconfig').sqlls.setup{}

-- nvim_lsp.sqls.setup({
--   cmd = {
--     vim.fn.stdpath("data") .. "/lsp_servers/sqls/sqls",
--   },
--   settings = {
--     sqls = {
--       connections = {
--         {
--           driver = "mysql",
--           proto = "tcp",
--           user = "calgary",
--           passwd = "calgary",
--           host = "0.0.0.0",
--           port = 3306,
--           dbName = "calgary",
--         },
--       },
--     },
--   },
--   on_attach = function(client)
--     client.resolved_capabilities.execute_command = true
--     client.commands = require("sqls").commands -- Neovim 0.6+ only

--     require("sqls").setup({
--       picker = "default",
--     })
--   end,
-- })

lvim.lsp.on_attach_callback = function()
  vim.lsp.handlers["textDocument/codeAction"] = require("lsputil.codeAction").code_action_handler
  vim.lsp.handlers["textDocument/references"] = require("lsputil.locations").references_handler
  vim.lsp.handlers["textDocument/definition"] = require("lsputil.locations").definition_handler
  vim.lsp.handlers["textDocument/declaration"] = require("lsputil.locations").declaration_handler
  vim.lsp.handlers["textDocument/typeDefinition"] = require("lsputil.locations").typeDefinition_handler
  vim.lsp.handlers["textDocument/implementation"] = require("lsputil.locations").implementation_handler
  vim.lsp.handlers["textDocument/documentSymbol"] = require("lsputil.symbols").document_handler
  vim.lsp.handlers["workspace/symbol"] = require("lsputil.symbols").workspace_handler
end

-- }}}

-- Additional Plugins {{{
lvim.plugins = {

  {
    "scalameta/nvim-metals",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

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
    "RishabhRD/nvim-lsputils",
    dependencies = { "RishabhRD/popfix" },
  },
  {
    "christoomey/vim-tmux-navigator",
  },
  {
    "rafcamlet/nvim-luapad",
  },
  {
    "rktjmp/lush.nvim",
  },
  {
    "Julian/vim-textobj-variable-segment",
    dependencies = { "kana/vim-textobj-user" },
  },
  {
    "sheerun/vim-polyglot",
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
    "fmcgough/pencil-color.nvim",
    -- "~/workspace/pencil-color.nvim"
  },
}
-- }}}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "scala" },
  command = "setlocal omnifunc=v:lua.vim.lsp.omnifunc",
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "scala,sbt,java" },
  callback = function()
    local metals_config = require("metals").bare_config()
    metals_config.on_attach = function(client, bufnr)
      require("lvim.lsp").common_on_attach(client, bufnr)
      require("metals").setup_dap()
    end
    metals_config.settings = {
      showImplicitArguments = false,
      showInferredType = true,
      excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
      serverProperties = {
        "-Dmetals.enabled=true"
      },
    }
    metals_config.init_options.statusBarProvider = "on"
    require("metals").initialize_or_attach(metals_config)
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html.handlebars" },
  command = "setlocal nofixeol",
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitcommit" },
  command = "setlocal wrap",
})

-- Load the colorscheme at the end
lvim.colorscheme = colorscheme
