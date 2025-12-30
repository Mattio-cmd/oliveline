local M = {}

local modes = {
  n = "NORMAL",
  i = "INSERT",
  v = "VISUAL",
  V = "VISUAL BLOCK",
  [""] = "VISUAL",
  c = "COMMAND",
  R = "REPLACE",
}

-- current mode label
function M.mode()
  local m = vim.api.nvim_get_mode().mode
  return " " .. (modes[m] or m):upper() .. " "
end

-- mode highlight
function M.update_mode_colors()
  local m = vim.api.nvim_get_mode().mode
  if m == "n" then return "%#StatusLine#" end
  if m == "i" then return "%#StatusLineInsert#" end
  if m == "v" then return "%#StatusLineVisual#" end
  return "%#StatusLine#"
end

-- filepath
function M.filepath()
  return vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.")
end

-- active statusline
function M.active()
  return table.concat({
    M.update_mode_colors(),
    M.mode(),
    "%#Normal# ",
    M.filepath(),
  })
end

-- inactive statusline
function M.inactive()
  return " %F"
end

return M
