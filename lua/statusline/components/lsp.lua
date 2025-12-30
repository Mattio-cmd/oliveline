local M = {}

function M.render()
  local clients = vim.lsp.get_active_clients({ bufnr = 0 })
  if #clients == 0 then return "" end

  local names = {}
  for _, c in ipairs(clients) do table.insert(names, c.name) end

  return "%#OliveLSP#  " .. table.concat(names, ",") .. " "
end

return M
