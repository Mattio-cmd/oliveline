local M = {}

function M.render()
  local enc = vim.bo.fileencoding ~= "" and vim.bo.fileencoding or vim.o.encoding
  local fmt = vim.bo.fileformat
  return " " .. enc .. "|" .. fmt
end

return M
