local M = {}

function M.render()
  local ft = vim.bo.filetype or ""
  if ft == "" then return "" end

  local icon = ""
  local ok, devicons = pcall(require, "nvim-web-devicons")
  if ok then
    icon = devicons.get_icon_by_filetype(ft, { default = false }) or ""
  end

  if icon == "" then
    local ok2, lspkind = pcall(require, "lspkind")
    if ok2 then
      icon = lspkind.symbol_map.File or ""
    end
  end

  if icon == "" then return "" end
  return "%#OliveFiletype# " .. icon .. " "
end

return M
