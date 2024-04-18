-- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- LSP keymaps
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function()
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
		vim.keymap.set("n", "<Leader>fi", vim.lsp.buf.hover, {})
		vim.keymap.set("n", "<Leader>gd", vim.lsp.buf.definition, {})
		vim.keymap.set({ "n", "v" }, "<Leader>ca", vim.lsp.buf.code_action, {})
	end,
})
vim.diagnostic.config({
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    }
})

--Highlights on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Netrw
vim.keymap.set("n", "<Leader>ft", vim.cmd.Ex)

-- Undotree
vim.keymap.set("n", "<Leader>ut", vim.cmd.UndotreeToggle)

-- Move
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
-- Panel Movement
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { silent = true })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { silent = true })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { silent = true })
vim.keymap.set("n", "<C-l>", "<C-w><C-l", { silent = true })

-- Paste preserve
vim.keymap.set("x", "<Leader>p", '"_dP')

--Replace
vim.keymap.set("n", "<Leader>r", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set({ "n", "v" }, "<Leader>ar", ":,$s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Fugitive
vim.keymap.set("n", "<Leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<Leader>gv", vim.cmd.Gvdiffsplit)
vim.keymap.set("n", "<Leader>gl", function()
	vim.cmd(":Git log")
end)
vim.keymap.set("n", "<Leader>gl%", function()
	vim.cmd(":Git log %")
end)

-- None ls
vim.keymap.set({ "n", "v" }, "<Leader>mp", vim.lsp.buf.format, {})

-- Oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- highlight search
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
