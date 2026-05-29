return {
  {
    "nvim-mini/mini.nvim",
    version = false,
    config = function()
      require("mini.icons").setup()
      require("mini.statusline").setup()
      require("mini.pairs").setup()
      require("mini.surround").setup()
      require("mini.ai").setup()
      require("mini.files").setup()
      require("mini.pick").setup()
      require("mini.extra").setup()
      require("mini.diff").setup()
      require("mini.git").setup()
      require("mini.trailspace").setup()
      require("mini.bracketed").setup()

      local map = vim.keymap.set
      local files = require("mini.files")
      local pick = require("mini.pick")

      map("n", "<leader>o", function()
        files.open(vim.api.nvim_buf_get_name(0), true)
      end, { desc = "Open file explorer" })

      map("n", "<leader>ff", function()
        pick.builtin.files()
      end, { desc = "Find files" })

      map("n", "<leader>fg", function()
        pick.builtin.grep_live()
      end, { desc = "Live grep" })

      map("n", "<leader>fb", function()
        pick.builtin.buffers()
      end, { desc = "Find buffers" })

      map("n", "<leader>fh", function()
        pick.builtin.help()
      end, { desc = "Help tags" })

      map("n", "<leader>cw", function()
        require("mini.trailspace").trim()
      end, { desc = "Trim trailing whitespace" })
    end,
  },
}
