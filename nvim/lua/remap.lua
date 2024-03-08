-- leader key
vim.g.mapleader = " "

-- LSP keymaps
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig",{}),
    callback = function()
        vim.keymap.set("n", "<Leader>fi", vim.lsp.buf.hover, {})
        vim.keymap.set("n", "<Leader>gd", vim.lsp.buf.definition, {})
        vim.keymap.set({"n", "v"}, "<Leader>ca", vim.lsp.buf.code_action, {})
    end
})

-- Netrw
vim.keymap.set("n", "<Leader>ft", vim.cmd.Ex)

-- Undotree
vim.keymap.set("n", "<Leader>u", vim.cmd.UndotreeToggle)

-- Fugitive
vim.keymap.set("n", "<Leader>gs", vim.cmd.Git)

-- Move
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

-- Paste preserve
vim.keymap.set("x", "<Leader>p", "\"_dP")

vim.keymap.set("i", "kj", "<Esc>")

vim.keymap.set("n", "<Leader>r", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

