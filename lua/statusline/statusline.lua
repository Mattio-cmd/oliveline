local M = {}

-- Define the modes table
local modes = { ["n"] = "NORMAL", ["i"] = "INSERT", ["v"] = "VISUAL", ["c"] = "COMMAND", }

-- Mode function
function M.mode()
    local current_mode = vim.api.nvim_get_mode().mode
    return string.format(" %s ", modes[current_mode]):upper()
end

-- Mode color function
function M.update_mode_colors()
    local current_mode = vim.api.nvim_get_mode().mode
    if current_mode == "n" then return "%#StatusLineNormal#" end
    if current_mode == "i" then return "%#StatusLineInsert#" end
    return "%#StatusLine#" -- Default color
end

-- Filepath function
function M.filepath()
    return vim.fn.fnamemodify(vim.fn.expand('%'), ':~:.:h')
end

-- Active statusline
function M.active()
    return table.concat {
        "%#Statusline#",
        M.update_mode_colors(),
        M.mode(),
        "%#Normal# ",
        M.filepath(),
        "%#Normal#",
    }
end

-- Inactive statusline
function M.inactive()
    return " %F"
end

return M
