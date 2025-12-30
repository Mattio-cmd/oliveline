local M = {}

M.options = {
  use_theme_colors = false, -- true = derive from colorscheme
  separators = {
    left = " ",
    right = " ",
  },
}

function M.setup(opts)
  M.options = vim.tbl_deep_extend("force", M.options, opts or {})
end

return M
