-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    vim.schedule(function()
      -- wait a tick for all LSPs (ruff, pyright, etc.) to finish setup
      local active = vim.lsp.get_active_clients({ bufnr = bufnr })
      for _, client in ipairs(active) do
        if client.name == "ruff" or client.name == "pyright" then
          vim.api.nvim_buf_set_option(bufnr, "textwidth", 0)
        end
      end
    end)
  end,
})
