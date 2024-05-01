-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "n", "v" }, "<leader>w", "<cmd>w<cr>", { silent = true, desc = "Save buffer" })

vim.keymap.del("n", "<leader>ww")
vim.keymap.del("n", "<leader>wd")
vim.keymap.del("n", "<leader>w-")
vim.keymap.del("n", "<leader>w|")

vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { silent = true })

vim.keymap.set(
  "n",
  "<leader>m",
  "<cmd>Telescope metals commands layout_config={height=0.67}<cr>",
  { silent = true, desc = "Metals commands" }
)
