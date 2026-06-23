return {
  { "nvim-mini/mini.pairs", enabled = false },
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = vim.tbl_filter(function(tool)
        return tool ~= "erb-formatter" and tool ~= "erb-lint"
      end, opts.ensure_installed or {})
    end,
  },
}
