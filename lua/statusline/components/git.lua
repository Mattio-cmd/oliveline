local M = {}

function M.render()
  local g = vim.b.gitsigns_status_dict
  if not g or not g.head then return "" end

  local parts = {}

  if g.added   and g.added   > 0 then table.insert(parts, "+" .. g.added) end
  if g.changed and g.changed > 0 then table.insert(parts, "~" .. g.changed) end
  if g.removed and g.removed > 0 then table.insert(parts, "-" .. g.removed) end

  return table.concat({
    "  ",
    g.head,
    (#parts > 0 and " [" .. table.concat(parts, " ") .. "]" or ""),
  })
end

return M
