-- codesnap.nvim appends the full static path of its generator .so to
-- `package.cpath` WITHOUT a `?` wildcard. A wildcard-less entry is tried for
-- every `require`, so it shadows other C modules and breaks blink.cmp's Rust
-- fuzzy matcher with a "symbol not found: luaopen_blink_cmp_fuzzy" error.
-- Upstream bug: https://github.com/mistricky/codesnap.nvim/issues/179
-- Workaround: drop the wildcard-less entries again after each capture.
local function clean_cpath()
  package.cpath = table.concat(
    vim.tbl_filter(function(p)
      return p:find("?", 1, true) ~= nil
    end, vim.split(package.cpath, ";")),
    ";"
  )
end

-- Leave visual mode first so the `'<`/`'>` marks point at the *current*
-- selection, run the command, then sanitize cpath.
local function snap(cmd)
  return function()
    vim.cmd("normal! \27")
    vim.cmd(cmd)
    clean_cpath()
  end
end

return {
  "mistricky/codesnap.nvim",
  tag = "v2.0.0",
  cmd = { "CodeSnap", "CodeSnapSave", "CodeSnapHighlight", "CodeSnapSaveHighlight" },
  opts = {
    save_path = "~/Pictures/CodeSnap",
    snapshot_config = {
      background = "#FFFFFF",
      code_config = {
        breadcrumbs = {
          enable = true,
        },
      },
    },
  },
  keys = {
    {
      "<leader>cs",
      snap("CodeSnap"),
      mode = "x",
      desc = "Screenshot selection to clipboard",
    },
    {
      "<leader>cS",
      snap("CodeSnapSave"),
      mode = "x",
      desc = "Screenshot selection to file",
    },
  },
}
