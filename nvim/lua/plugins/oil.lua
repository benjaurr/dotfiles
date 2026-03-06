return {
  {
    "stevearc/oil.nvim",
    opts = {
      view_options = {
        show_hidden = true,
      },
    },
    keys = {
      {
        "<leader>o",
        function()
          local path = vim.fn.expand("%:p:h")
          require("oil").open(path)
        end,
        desc = "Open Oil in current file directory",
      },
    },
  },
}
