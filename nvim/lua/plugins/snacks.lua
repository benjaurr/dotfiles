return {
  "folke/snacks.nvim",
  opts = {
    explorer = {},
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
