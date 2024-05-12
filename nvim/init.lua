require("options")
require("remap")
require("plugins")

-- Set wezterm tab title to file name on Buffer Enter
--vim.api.nvim_create_autocmd({ "BufEnter" }, {
--    callback = function(event)
--        local title = "vim"
--        if event.file ~= "" then
--            title = string.format("vim: %s", vim.fs.basename(event.file))
--        end
--
--        vim.fn.system({ "wezterm.exe", "cli", "set-tab-title", title })
--    end,
--})
--
---- Set wezterm tab title to default on Vim Leave
--vim.api.nvim_create_autocmd({ "VimLeave" }, {
--    callback = function()
--        -- Setting title to empty string causes wezterm to revert to its
--        -- default behavior of setting the tab title automatically
--        vim.fn.system({ "wezterm.exe", "cli", "set-tab-title", "" })
--    end,
--})
