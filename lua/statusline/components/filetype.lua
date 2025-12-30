-- filetype.lua
local M = {}

function M.filetype_icon()
  local lspkind = require('lspkind')
  local ft = vim.bo.filetype or ''  -- get current buffer's filetype

  -- Try nvim-web-devicons if available (provides per-language icons)
  local icon = nil
  local ok, devicons = pcall(require, "nvim-web-devicons")
  if ok then
    -- get_icon_by_filetype returns (icon, highlight); ignore highlight here
    icon = devicons.get_icon_by_filetype(ft, {default = false})
  end

  -- Fallback: use LSPkind’s generic File icon (󰈙):contentReference[oaicite:3]{index=3}
  if not icon or icon == "" then
    icon = lspkind.symbol_map.File
  end

  -- Return icon (with a trailing space for separation)
  -- For colored output, wrap with a highlight group, e.g. %#StatusFileIcon# (see below)
  return icon .. " "
end

return M
