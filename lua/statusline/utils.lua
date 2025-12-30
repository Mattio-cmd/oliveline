-- shared helpers
local M = {}

function M.hl(group)
  return "%#" .. group .. "#"
end

function M.is_empty(s)
  return s == nil or s == ""
end

return M
