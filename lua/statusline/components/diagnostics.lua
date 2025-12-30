local M = {}

function M.render()
  local levels = {
    { vim.diagnostic.severity.ERROR, "E", "OliveDiagError" },
    { vim.diagnostic.severity.WARN,  "W", "OliveDiagWarn"  },
    { vim.diagnostic.severity.INFO,  "I", "OliveDiagInfo"  },
    { vim.diagnostic.severity.HINT,  "H", "OliveDiagHint"  },
  }

  local out = {}

  for _, l in ipairs(levels) do
    local count = #vim.diagnostic.get(0, { severity = l[1] })
    if count > 0 then
      table.insert(out, "%#" .. l[3] .. "# " .. l[2] .. " " .. count .. " ")
    end
  end

  return table.concat(out)
end

return M
