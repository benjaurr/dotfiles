-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local wk = require("which-key")

-- Register a group for yank-related commands
wk.add({ { "<leader>y", group = "+Yank" } })

vim.keymap.set("n", "<leader>yr", ':let @+=expand("%:.")<CR>', { desc = "Yank relative path" })
vim.keymap.set("n", "<leader>yp", ':let @+=expand("%")<CR>', { desc = "Yank absolute path" })
vim.keymap.set("n", "<leader>ys", function()
  local path = vim.fn.expand("%:.")
  local cleaned = string.gsub(path, "^src/", "")
  vim.fn.setreg("+", cleaned)
end, { desc = "Yank relative path (no src/)" })

-- Register a group for markdown-related commands
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    wk.add({ { "<leader>m", group = "+Markdown" } })
  end,
})

-- use leader-p to paste without overwriting the default register
vim.keymap.set("x", "<leader>p", [["_c<C-r>"]], { desc = "Paste without overwriting register" })
