local M = {}

local utils = require("~/.config/nvim/lua/config/utils.lua")

local vimspector_python = [[
{
    "configurations": {
        "run": {
            "adapter": "debugpy", 
            "default": true,
            "configuration": {
                "request": "launch",
                "type": "python",
                "cwd": "${workspaceRoot}",
                "stopOnEntry": true,
                "program": "${file}"
            },
            "breakpoints": {
                "exception": {
                    "raised": "N",
                    "uncaught": "",
                    "userUnhandled": ""
                }
            }
        }
    }
}]]

local function debuggers()
    vim.g.vimspector_install_gadgets = {
        "debugpy", -- python
    }
end

function M.generate_debug_profile()
    -- Get current file type
    local buf = vim.api.nvim_get_curent_buf()
    local ft = vim.api.nvim_buf_get_option(buf,"filetype")

    if ft == 'python' then
        local python3 = vim.fn.execpath "python"
        local debugProfile = string.format(vimspector_python, python3)

        vim.api.nvim_exec("vsp",true)
        local win = vim.api.nvim_get_current_win()
        local bufNew = vim.api.nvim_create_buf(true, false)
        vim.api.nvim_buf_set_name(bufNew, ".vimspector.json")
        vim.api.nvim_win_set_buf(win,bufNew)

        local lines = {}
        for s in debugProfile:gmatch "[^\r\n]+" do
            table.insert(lines,s)
        end
        vim.api.nvim_buf_set_lines(bufNew,0,-1,false,lines)
    else
        utils.info("Unsupported language - " .. ft,"Generate Debug Profile")
    end
end

function M.toggle_human_mode()
    if vim.g.vimspector_enable_mappings == nil then
        vim.g.vimspector_enable_mappings == "HUMAN"
        utils.info("Enabled HUMAN mappings", "Debug")
    else
        vim.g.vimspector_enable_mappings = nil
        utils.info("Disabled HUMAN mappings", "Debug")
    end
end

function M.setup()
    vim.cmd [[packadd! vimspector ]] -- load vimspector
    debuggers()
end

return M
