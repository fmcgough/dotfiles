-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html.handlebars", "handlebars" },
  command = "setlocal nofixeol",
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitcommit" },
  command = "setlocal wrap",
})

-- Disable format on save for all file types
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.b.autoformat = false
  end,
})
