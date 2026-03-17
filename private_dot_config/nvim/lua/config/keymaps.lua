-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jk", "<esc>", { noremap = true, silent = true })
vim.keymap.set("t", "jk", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
local map = vim.keymap.set

map("n", "<leader>ct", "<cmd>CMakeSelectLaunchTarget<CR>", { desc = "Select CMake Target" })

map("n", "<leader>r", function()
  local ft = vim.bo.filetype
  if ft == "cpp" or ft == "c" then
    vim.cmd("CMakeRun")
  elseif ft == "rust" then
    vim.cmd("vsplit | wincmd l | term cargo run")
    vim.cmd("startinsert")
  else
    print("Unsupported filetype: " .. ft)
  end
end, { desc = "Run Project" })

map("n", "<leader>t", function()
  vim.cmd("vsplit")
  vim.cmd("wincmd l")
  vim.cmd("term")
  vim.cmd("startinsert")
end, { desc = "Terminal on right" })

map("t", "<C-h>", [[<C-\><C-n><C-w>h]])
map("t", "<C-j>", [[<C-\><C-n><C-w>j]])
map("t", "<C-k>", [[<C-\><C-n><C-w>k]])
map("t", "<C-l>", [[<C-\><C-n><C-w>l]])
