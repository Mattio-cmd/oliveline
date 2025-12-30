local M = {}

function M.render()
  local branch = vim.b.gitsigns_head or vim.fn.systemlist("git branch --show-current 2>/dev/null")[1]
  if not branch or branch == "" then
    return ""
  end
  return "%#OliveGit#  " .. branch .. " "
end

return M
