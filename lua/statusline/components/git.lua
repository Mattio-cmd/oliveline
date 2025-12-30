-- git.lua
local M = {}

-- Update Git diff counts for current file (to be called via autocommand)
local function update_diff()
  local fname = vim.fn.expand("%:p")
  if fname == "" then return end
  -- Only proceed if inside a Git repo
  if vim.fn.system("git rev-parse --is-inside-work-tree 2>/dev/null") ~= "true\n" then
    -- Not a git repo: clear any existing stats
    vim.b.git_diff_add = nil
    vim.b.git_diff_change = nil
    vim.b.git_diff_remove = nil
    return
  end

  -- Run git diff on this file
  local git_cmd = string.format("git diff --numstat HEAD -- %s", vim.fn.shellescape(fname))
  local output = vim.fn.systemlist(git_cmd)[1] or ""
  local added, removed = output:match("^(%d+)%s+(%d+)%s+")
  added   = tonumber(added)   or 0
  removed = tonumber(removed) or 0
  local changed = math.min(added, removed)
  added   = added - changed
  removed = removed - changed

  -- Save in buffer-local vars
  vim.b.git_diff_add    = added
  vim.b.git_diff_change = changed
  vim.b.git_diff_remove = removed
end

-- Autocommand: update on file load/write
vim.api.nvim_create_autocmd({"BufReadPost", "BufWritePost"}, {
  callback = update_diff,
})

-- Return a statusline segment (to be called from statusline)
function M.git_diff_status()
  local add    = vim.b.git_diff_add    or 0
  local change = vim.b.git_diff_change or 0
  local remove = vim.b.git_diff_remove or 0
  if add == 0 and change == 0 and remove == 0 then
    return ""
  end

  -- Format with icons or symbols and highlights. Here we use +, ~, - and Diff highlights.
  -- You can replace "+" with an icon (e.g. ) if desired.
  local parts = {}
  if add > 0 then
    table.insert(parts, string.format("%%#DiffAdd# +%d", add))
  end
  if change > 0 then
    table.insert(parts, string.format("%%#DiffChange# ~%d", change))
  end
  if remove > 0 then
    table.insert(parts, string.format("%%#DiffDelete# -%d", remove))
  end
  return table.concat(parts, " ")
end

return M
