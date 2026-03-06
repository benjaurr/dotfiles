-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Autoformat Python files with ruff on save
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.py",
  callback = function()
    local cmd = "ruff check --fix ./src/ && ruff format ./src/"
    vim.fn.system(cmd)

    -- Reload current buffer so changes appear
    vim.cmd("silent! edit")
  end,
})

vim.lsp.enable("biome")

-- Set the ejson as json filetype
vim.filetype.add({
  extension = {
    ejson = "json",
  },
})

-- Do not create line breaks while writing text in python
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.textwidth = 0
  end,
})
