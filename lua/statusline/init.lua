local config = require("statusline.config")
local highlights = require("statusline.highlights")

local mode     = require("statusline.components.mode")
local filepath = require("statusline.components.filepath")
local git      = require("statusline.components.git")
local fileinfo = require("statusline.components.fileinfo")
local encoding = require("statusline.components.encoding")

local M = {}

function M.setup(opts)
  config.setup(opts)
  highlights.setup()

  _G.Statusline = M

  vim.api.nvim_exec([[
    augroup Oliveline
      autocmd!
      autocmd WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
      autocmd WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
    augroup END
  ]], false)
end

function M.active()
  return table.concat({
    mode.render(),
    filepath.render(),
    git.render(),
    "%=",
    fileinfo.render(),
    encoding.render(),
  })
end

function M.inactive()
  return " %F"
end

return M
