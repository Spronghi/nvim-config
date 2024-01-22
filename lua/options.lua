local utils = require("utils")

vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.relativenumber = true
vim.opt.number = true

-- use 2 space tabs if you are not in linux and if you are editing the .config/nvim
if utils.is_nvim_config() or not utils.is_linux() then
  vim.opt.tabstop = 2
  vim.opt.shiftwidth = 2
else
  vim.opt.tabstop = 4
  vim.opt.shiftwidth = 4
end

vim.opt.shiftround = true
vim.opt.expandtab = true

-- share clipboard with yield
vim.opt.clipboard = "unnamed"
