local config = require("statusline.config")

local M = {}

function M.setup()
  if config.options.use_theme_colors then
    -- minimal example: link to existing groups
    vim.api.nvim_set_hl(0, "StatusLineNormal", { link = "StatusLine" })
    vim.api.nvim_set_hl(0, "StatusLineInsert", { link = "String" })
    vim.api.nvim_set_hl(0, "StatusLineVisual", { link = "Type" })
    vim.api.nvim_set_hl(0, "StatusLineVisualBlock", { link = "Type" })
    vim.api.nvim_set_hl(0, "StatusLineCommand", { link = "Keyword" })
    vim.api.nvim_set_hl(0, "StatusLineReplace", { link = "Error" })
  else
    vim.cmd([[
      hi StatusLineNormal      guifg=#1f1f28 guibg=#009246
      hi StatusLineInsert      guifg=#1f1f28 guibg=#FFFFFF
      hi StatusLineVisual      guifg=#1f1f28 guibg=#CE2B37
      hi StatusLineVisualBlock guifg=#1f1f28 guibg=#CE2B37
      hi StatusLineCommand     guifg=#1f1f28 guibg=#009CDE
      hi StatusLineReplace     guifg=#1f1f28 guibg=#D40000
    ]])
  end
end

return M
