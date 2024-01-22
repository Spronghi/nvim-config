return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {},
  config = function()
    local wk = require("which-key")

    wk.register({
      h = { ":nohlsearch<CR>", "Clear search" },
      p = {
        v = { vim.cmd.Ex, "Ex" },
      },
    }, { prefix = "<leader>" })

    wk.register({
      J = { ":m +1<CR>gv=gv", "Move line up" },
      K = { ":m -2<CR>gv=gv", "Move line down" },
    }, { mode = "v" })
  end
}
