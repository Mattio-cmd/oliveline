local M = {}

function M.setup(colors)
  for group, opts in pairs(colors) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

return M
