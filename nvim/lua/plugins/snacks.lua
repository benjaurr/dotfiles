return {
  "folke/snacks.nvim",
  opts = {
    explorer = {},
    picker = {
      sources = {
        explorer = {
          win = {
            list = {
              wo = {
                number = true,
                relativenumber = true,
              },
            },
          },
        },
      },
    },
  },
  keys = {
    {
      "<leader>fh",
      function()
        Snacks.picker.files({ hidden = true })
      end,
      desc = "Find files (hidden)",
    },
  },
}
