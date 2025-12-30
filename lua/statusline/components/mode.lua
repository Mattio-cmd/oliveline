local utils = require("statusline.utils")

local M = {}

local modes = {
  n  = "NORMAL",
  i  = "INSERT",
  v  = "VISUAL",
  V  = "VISUAL LINE",
  [""] = "VISUAL BLOCK",
  c  = "COMMAND",
  R  = "REPLACE",
}

local colors = {
  n  = "StatusLineNormal",
  i  = "StatusLineInsert",
  v  = "StatusLineVisual",
  V  = "StatusLineVisual",
  [""] = "StatusLineVisualBlock",
  c  = "StatusLineCommand",
  R  = "StatusLineReplace",
}

function M.render()
  local m = vim.api.nvim_get_mode().mode
  return table.concat({
    utils.hl(colors[m] or "StatusLine"),
    " ",
    (modes[m] or m),
    " ",
  })
end

return M
