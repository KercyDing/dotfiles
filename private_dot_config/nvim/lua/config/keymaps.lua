local map = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "<leader>w", "<cmd>w<CR>", { desc = "Write" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
map("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "Clear search" })

map("n", "<C-h>", "<C-w>h", { desc = "Move left" })
map("n", "<C-j>", "<C-w>j", { desc = "Move down" })
map("n", "<C-k>", "<C-w>k", { desc = "Move up" })
map("n", "<C-l>", "<C-w>l", { desc = "Move right" })

map("n", "<leader>qc", "<cmd>cclose<CR>", { desc = "Close quickfix" })
map("n", "<leader>qo", "<cmd>copen<CR>", { desc = "Open quickfix" })
map("n", "<leader>qn", "<cmd>cnext<CR>", { desc = "Next quickfix" })
map("n", "<leader>qp", "<cmd>cprevious<CR>", { desc = "Previous quickfix" })

map("n", "<leader>lc", "<cmd>lclose<CR>", { desc = "Close loclist" })
map("n", "<leader>lo", "<cmd>lopen<CR>", { desc = "Open loclist" })

map("i", "jk", "<Esc>", { desc = "Exit insert mode" })
map("t", "jk", "<C-\\><C-n>", { desc = "Exit terminal mode" })

map("n", "[d", function()
  vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Previous diagnostic" })

map("n", "]d", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Next diagnostic" })

map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Line diagnostic" })

