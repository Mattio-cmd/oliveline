local M = {}

local components = {
  mode        = require("statusline.components.mode"),
  filepath    = require("statusline.components.filepath"),
  git         = require("statusline.components.git"),
  lsp         = require("statusline.components.lsp"),
  diagnostics = require("statusline.components.diagnostics"),
  filetype    = require("statusline.components.filetype"),
  encoding    = require("statusline.components.encoding"),
}

local highlights = require("statusline.highlights")

local config = {
  layout = { left = {}, right = {} },
}

function M.setup(user_cfg)
  config = vim.tbl_deep_extend("force", config, user_cfg or {})
  highlights.setup(config.colors or {})

  _G.Oliveline = M

  vim.api.nvim_exec([[
    augroup Oliveline
      autocmd!
      autocmd WinEnter,BufEnter * setlocal statusline=%!v:lua.Oliveline.render()
      autocmd WinLeave,BufLeave * setlocal statusline=%!v:lua.Oliveline.inactive()
    augroup END
  ]], false)
end

function M.render()
  local left, right = {}, {}

  for _, name in ipairs(config.layout.left) do
    local c = components[name]
    if c then table.insert(left, c.render()) end
  end

  for _, name in ipairs(config.layout.right) do
    local c = components[name]
    if c then table.insert(right, c.render()) end
  end

  return table.concat(left) .. "%=" .. table.concat(right)
end

function M.inactive()
  return " %F"
end

return M
