return {
  -- Biome owns JS/TS/JSON formatting via conform. Because LazyVim runs conform
  -- as the *primary* formatter and only falls back to LSP formatting when conform
  -- has nothing for the filetype, this lets eslint and the TS server stay attached
  -- for diagnostics / code actions while biome alone handles format-on-save.
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "biome" },
        javascriptreact = { "biome" },
        typescript = { "biome" },
        typescriptreact = { "biome" },
        json = { "biome" },
        jsonc = { "biome" },
      },
      formatters = {
        -- Only run biome when the project actually has a biome config; otherwise
        -- conform finds no formatter and LazyVim falls back to LSP formatting,
        -- so non-biome JS projects keep working as before.
        biome = {
          require_cwd = true,
        },
      },
    },
  },
}
