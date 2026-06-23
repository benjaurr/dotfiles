return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruby_lsp = {
          mason = false,
          cmd = { vim.fn.expand("~/.rbenv/shims/ruby-lsp") },
        },
        -- Formatting is handled by conform (rubocop) instead, so the standalone
        -- rubocop LSP server is disabled. The global rubocop (1.85.1) it launched
        -- crashes against this repo's locked rubocop-factory_bot plugin.
        rubocop = {
          enabled = false,
        },
      },
    },
  },
  {
    -- Run rubocop through Bundler from the project root so it uses the version
    -- locked in the repo (vendor/bundle, 1.76.2) with its matching plugins,
    -- instead of whatever the bare `rubocop` shim resolves to globally.
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        rubocop = {
          command = "bundle",
          prepend_args = { "exec", "rubocop" },
          cwd = require("conform.util").root_file({ "Gemfile", ".rubocop.yml" }),
          require_cwd = true,
        },
      },
    },
  },
}
