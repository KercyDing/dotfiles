local group = vim.api.nvim_create_augroup("transparent_background", { clear = true })

local function set_transparent()
  local groups = {
    "Normal",
    "NormalNC",
    "NormalFloat",
    "FloatBorder",
    "SignColumn",
    "EndOfBuffer",
    "LineNr",
    "CursorLineNr",
    "StatusLine",
    "StatusLineNC",
    "TabLine",
    "TabLineFill",
    "WinSeparator",
  }

  for _, name in ipairs(groups) do
    vim.api.nvim_set_hl(0, name, { bg = "none" })
  end
end

set_transparent()

vim.api.nvim_create_autocmd("ColorScheme", {
  group = group,
  callback = set_transparent,
})
