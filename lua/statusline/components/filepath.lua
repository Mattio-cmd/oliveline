local M = {}

function M.render()
  return "%#OlivePath# " .. vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.")
end

return M
