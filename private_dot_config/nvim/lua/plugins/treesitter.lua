return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        install_dir = vim.fn.stdpath("data") .. "/site",
      })

      require("nvim-treesitter").install({
        "lua",
        "vim",
        "vimdoc",
        "c",
        "cpp",
        "python",
        "bash",
        "json",
        "yaml",
        "markdown",
        "markdown_inline",
      })
    end,
  },
}
