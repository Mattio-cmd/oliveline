local M = {}

function M.render()
  return ("%#OliveEncoding# %s|%s "):format(
    vim.bo.fileencoding ~= "" and vim.bo.fileencoding or vim.o.encoding,
    vim.bo.fileformat
  )
end

return M
