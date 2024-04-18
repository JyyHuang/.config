vim.g.have_nerd_font = true

vim.opt.number = true;
vim.opt.relativenumber = true;

vim.opt.foldmethod = "syntax";

vim.opt.showmode = false

vim.opt.splitbelow = true;
vim.opt.splitright = true;

vim.opt.wrap = false;

vim.opt.breakindent= true
vim.opt.expandtab = true;
vim.opt.softtabstop = 4;
vim.opt.tabstop = 4;
vim.opt.shiftwidth = 4;

vim.opt.autoindent = true;
vim.opt.cindent = true;

vim.opt.hlsearch = true;
vim.opt.incsearch = true;

-- Sync system clipboard with Neovim clipboard
vim.opt.clipboard = "unnamedplus"

if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 0,
  }
end


vim.opt.wrap = false;

vim.opt.scrolloff = 999;

vim.opt.inccommand = "split";

vim.opt.updatetime = 250;

vim.opt.ignorecase = true;
vim.opt.smartcase = true;

vim.opt.termguicolors = true;

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.signcolumn = 'yes'

vim.opt.timeoutlen = 300

vim.opt.cursorline = true

vim.opt.virtualedit = "block"


