vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.opt.shiftround = true
vim.opt.expandtab = true

-- share clipboard with yield
vim.opt.clipboard = "unnamed"

-- if you move more then 2 lines, it will add a jump so ctrl + o and ctrl + i are more resilient
vim.keymap.set(
  'n',
  'j',
  [[v:count ? (v:count >= 3 ? "m'" . v:count : '') . 'j' : 'gj']],
  { noremap = true, expr = true }
)

vim.keymap.set(
  'n',
  'k',
  [[v:count ? (v:count >= 3 ? "m'" . v:count : '') . 'k' : 'gk']],
  { noremap = true, expr = true }
)
