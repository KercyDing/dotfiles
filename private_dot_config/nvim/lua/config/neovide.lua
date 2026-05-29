if not vim.g.neovide then
  return
end

-- Font
vim.o.guifont = "Maple Mono NF CN:h12"

-- Transparency
vim.g.neovide_opacity = 0.85
vim.g.neovide_normal_opacity = 0.85

-- Window padding
vim.g.neovide_padding_top = 8
vim.g.neovide_padding_bottom = 8
vim.g.neovide_padding_left = 8
vim.g.neovide_padding_right = 8

-- Cursor
vim.g.neovide_cursor_animation_length = 0.08
vim.g.neovide_cursor_trail_size = 0.5

-- Remember window size
vim.g.neovide_remember_window_size = true
