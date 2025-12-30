local M = {}

local function update_diff()
  local file = vim.fn.expand("%:p")
  if file == "" then return end

  if vim.fn.system("git rev-parse --is-inside-work-tree 2>/dev/null") ~= "true\n" then
    vim.b.git_add, vim.b.git_change, vim.b.git_del = nil, nil, nil
    return
  end

  local cmd = "git diff --numstat HEAD -- " .. vim.fn.shellescape(file)
  local out = vim.fn.systemlist(cmd)[1] or ""
  local a, d = out:match("^(%d+)%s+(%d+)")
  a, d = tonumber(a) or 0, tonumber(d) or 0

  local c = math.min(a, d)
  vim.b.git_add = a - c
  vim.b.git_change = c
  vim.b.git_del = d - c
end

vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {
  callback = update_diff,
})

function M.render()
  local a = vim.b.git_add or 0
  local c = vim.b.git_change or 0
  local d = vim.b.git_del or 0

  if a == 0 and c == 0 and d == 0 then return "" end

  local parts = {}
  if a > 0 then table.insert(parts, "%#OliveGitAdd# +" .. a) end
  if c > 0 then table.insert(parts, "%#OliveGitChange# ~" .. c) end
  if d > 0 then table.insert(parts, "%#OliveGitDel# -" .. d) end

  return " " .. table.concat(parts, " ") .. " "
end

return M
