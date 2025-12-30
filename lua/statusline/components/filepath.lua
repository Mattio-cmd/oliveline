local M = {}

function M.render()
  local path = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.")
  if path == "" then return "" end
  return " " .. path
end

return M
