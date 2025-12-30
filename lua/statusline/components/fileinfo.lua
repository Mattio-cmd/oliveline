local M = {}

function M.render()
  local ft = vim.bo.filetype
  if ft == "" then return "" end
  return " " .. ft:upper()
end

return M
