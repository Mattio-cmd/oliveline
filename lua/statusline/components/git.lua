local M = {}

local function git(cmd)
  local f = vim.fn.expand("%:p:h")
  return vim.fn.systemlist("git -C " .. f .. " " .. cmd)[1]
end

function M.render()
  if vim.fn.system("git rev-parse --is-inside-work-tree 2>/dev/null") == "" then
    return ""
  end

  local branch = git("branch --show-current")
  local diff = vim.fn.systemlist("git diff --numstat")[1]
  if not branch then return "" end

  return ("%#OliveGit#  %s "):format(branch)
end

return M
