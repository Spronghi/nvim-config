return {
  "tpope/vim-fugitive",
  dependencies = { "nvim-telescope/telescope.nvim" },
  event = "VeryLazy",
  keys = {
    { "<leader>gg", vim.cmd.Git,          desc = "Git" },
    { "<laeder>gf", "<cmd>Git diff<cr>",  desc = "Git diff" },
    { "<leader>gd", vim.cmd.Gdiff,        desc = "Gdiff" },
    { "<leader>ga", "<cmd>Git add .<cr>", desc = "Git add ." },
    { "<leader>gp", "<cmd>Git push<cr>",  desc = "Git push" },
    { "<leader>gh", "<cmd>Gllog<cr>",     desc = "Git history" },
    {
      "<leader>gb",
      function()
        local branch = vim.fn.input("Branch name: ")
        local command = string.format('Git checkout -b %s', branch)

        if branch == "" then
          return
        end

        vim.cmd(command)
      end,
      desc = "Git checkout -b"
    },
    {
      "<leader>gc",
      function()
        local message = vim.fn.input("Commit message: ")
        local command = string.format('Git commit -m"%s"', message)

        if message == "" then
          return
        end

        vim.cmd(command)
      end,
      desc = "Git commit"
    },
  }
}
