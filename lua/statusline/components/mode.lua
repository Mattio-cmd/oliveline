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

local hl = {
  n  = "OliveModeNormal",
  i  = "OliveModeInsert",
  v  = "OliveModeVisual",
  V  = "OliveModeVisual",
  [""] = "OliveModeBlock",
  c  = "OliveModeCommand",
  R  = "OliveModeReplace",
}

function M.render()
  local m = vim.api.nvim_get_mode().mode
  local group = hl[m] or "StatusLine"
  local label = modes[m] or m

  return "%#" .. group .. "# " .. label .. " "
end

return M
