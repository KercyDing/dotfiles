local opt = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = " "

opt.number = true
opt.relativenumber = true
opt.cursorline = true

-- Indent
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.autoindent = true
opt.smartindent = true
opt.breakindent = true
opt.copyindent = true
opt.preserveindent = true

opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8

opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true
opt.ambiwidth = "single"
opt.signcolumn = "yes"

opt.undofile = true
opt.swapfile = false
opt.backup = false

opt.splitright = true
opt.splitbelow = true

opt.clipboard = "unnamedplus"

opt.completeopt = { "menu", "menuone", "noselect" }

opt.updatetime = 250
opt.timeoutlen = 400

opt.laststatus = 3

if vim.fn.executable("rg") == 1 then
  opt.grepprg = "rg --vimgrep --smart-case"
end

-- Disable unused language providers
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
