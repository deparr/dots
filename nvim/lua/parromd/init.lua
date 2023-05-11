require("parromd.set")
require("parromd.remap")
require("parromd.packer")


-- NONE OF THIS WORKS CORRECTLY
--[[


local M = {}
-- function to create a list of commands and convert them to autocommands
-------- This function is taken from https://github.com/norcalli/nvim_utils
function M.nvim_create_augroups(definitions)
    for group_name, definition in pairs(definitions) do
        vim.api.nvim_command('augroup ' .. group_name)
        vim.api.nvim_command('autocmd!')
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten { 'autocmd', def }, ' ')
            print(command)
            vim.api.nvim_command(command)
        end
        vim.api.nvim_command('augroup END')
    end
end

local autoCommands = {
    -- other autocommands
    open_folds = {
        { "BufReadPost,FileReadPost", "*", "normal zR" }
    }
}

M.nvim_create_augroups(autoCommands)

local autocmd = vim.api.nvim_create_autocmd

autocmd({'BufReadPost', 'FileReadPost'}, {
    pattern = {'*'},
    command = 'normal G'
})


--]]
