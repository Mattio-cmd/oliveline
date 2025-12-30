local M = {}

local levels = {
  { vim.diagnostic.severity.ERROR, "", "OliveDiagError" },
  { vim.diagnostic.severity.WARN,  "", "OliveDiagWarn"  },
  { vim.diagnostic.severity.INFO,  "", "OliveDiagInfo"  },
  { vim.diagnostic.severity.HINT,  "", "OliveDiagHint"  },
}

function M.render()
  local out = {}

  for _, l in ipairs(levels) do
    local count = #vim.diagnostic.get(0, { severity = l[1] })
    if count > 0 then
      table.insert(out, ("%#%s# %s %d "):format(l[3], l[2], count))
    end
  end

  return table.concat(out)
end

return M
