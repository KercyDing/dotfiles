local terminal_name = "right-terminal"
local terminal_marker = "right_terminal"

local function open_right_terminal(cmd)
  local width = math.floor(vim.o.columns / 3)

  vim.cmd("botright " .. width .. "vnew")

  vim.bo.buflisted = false
  vim.bo.bufhidden = "wipe"
  vim.b[terminal_marker] = true
  vim.api.nvim_buf_set_name(0, terminal_name)

  local job_id = vim.fn.jobstart(vim.o.shell, {
    term = true,
    cwd = vim.fn.getcwd(),
  })

  vim.cmd("startinsert")

  if cmd and cmd ~= "" then
    vim.defer_fn(function()
      vim.api.nvim_chan_send(job_id, cmd .. "\r")
    end, 500) -- Give zsh/starship enough time to draw the prompt before echoing input.
  end
end

local function is_right_terminal(buf)
  return vim.b[buf][terminal_marker] == true
end

local function close_right_terminal()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if is_right_terminal(buf) then
      vim.api.nvim_win_close(win, true)
      return
    end
  end
end

vim.keymap.set("n", "<leader>tt", function()
  open_right_terminal()
end, { desc = "Open right terminal" })

vim.keymap.set("n", "<leader>tr", function()
  vim.ui.input({
    prompt = "Command: ",
  }, function(cmd)
    open_right_terminal(cmd)
  end)
end, { desc = "Run command in right terminal" })

vim.keymap.set("n", "<leader>tq", function()
  close_right_terminal()
end, { desc = "Quit right terminal" })

vim.keymap.set("t", "<leader>tq", function()
  close_right_terminal()
end, { desc = "Quit right terminal" })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "zig",
  callback = function(event)
    vim.keymap.set("n", "<leader>zb", function()
      open_right_terminal("zig build")
    end, { buffer = event.buf, desc = "Zig build" })

    vim.keymap.set("n", "<leader>zr", function()
      open_right_terminal("zig build run")
    end, { buffer = event.buf, desc = "Zig build run" })
  end,
})
