vim.opt.number = true;
vim.opt.relativenumber = true;

vim.opt.foldmethod = "syntax";

vim.opt.splitbelow = true;
vim.opt.splitright = true;

vim.opt.wrap = false;

vim.opt.expandtab = true;
vim.opt.softtabstop = 4;
vim.opt.tabstop = 4;
vim.opt.shiftwidth = 4;

vim.opt.autoindent = true;
vim.opt.cindent = true;

vim.opt.hlsearch = false;
vim.opt.incsearch = true;

vim.opt.clipboard = "unnamedplus"
-- Sync system clipboard with Neovim clipboard

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

vim.opt.virtualedit = "all";

vim.opt.inccommand = "split";

vim.opt.updatetime = 50;

vim.opt.ignorecase = true;

vim.opt.termguicolors = true;

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true


