local M = {}

function M.render()
  return "%#OliveFiletype# " .. vim.bo.filetype:upper() .. " "
end

return M
