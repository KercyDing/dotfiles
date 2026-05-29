vim.diagnostic.config({
  virtual_text = {
    spacing = 2,
    source = "if_many",
  },
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
  },
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local map = vim.keymap.set

    local function opts(desc)
      return { buffer = bufnr, desc = desc }
    end

    map("n", "gd", vim.lsp.buf.definition, opts("Goto definition"))
    map("n", "gD", vim.lsp.buf.declaration, opts("Goto declaration"))
    map("n", "gr", vim.lsp.buf.references, opts("References"))
    map("n", "gi", vim.lsp.buf.implementation, opts("Goto implementation"))
    map("n", "K", vim.lsp.buf.hover, opts("Hover"))
    map("n", "<leader>rn", vim.lsp.buf.rename, opts("Rename"))
    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))

    map("n", "<leader>f", function()
      vim.lsp.buf.format({ async = true })
    end, opts("Format"))
  end,
})

local servers = {
  zls = "zls",
  rust_analyzer = "rust-analyzer",

  ts_ls = "typescript-language-server",
  jsonls = "vscode-json-languageserver",
  yamlls = "yaml-language-server",
  bashls = "bash-language-server",
  lua_ls = "lua-language-server",
  clangd = "clangd",
  pyright = "pyright-langserver",
  marksman = "marksman",

  taplo = "taplo",
  eslint = "vscode-eslint-language-server",
  html = "vscode-html-language-server",
  cssls = "vscode-css-language-server",
}

local enabled = {}

for name, executable in pairs(servers) do
  if vim.fn.executable(executable) == 1 then
    table.insert(enabled, name)
  end
end

vim.lsp.enable(enabled)
