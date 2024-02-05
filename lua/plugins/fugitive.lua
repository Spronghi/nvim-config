return {
  "tpope/vim-fugitive",
  dependencies = { "nvim-telescope/telescope.nvim" },
  event = "VeryLazy",
  keys = {
    { "<leader>gg", vim.cmd.Git,          desc = "Git" },
    { "<leader>gd", vim.cmd.Gdiff,        desc = "Gdiff" },
    { "<leader>ga", "<cmd>Git add .<cr>", desc = "Git add ." },
    { "<leader>gp", "<cmd>Git push<cr>",  desc = "Git push" },
    { "<leader>gh", "<cmd>Gllog<cr>",     desc = "Git history" },
    {
      "<leader>gu",
      function()
        local confirm = vim.fn.input("Are you sure you want to undo the last commit? (y/N) ")
        local command = string.format('Git reset HEAD^')

        if string.lower(confirm) ~= "y" then
          return
        end

        vim.cmd(command)
      end,
      desc = "Git reset HEAD^"
    },
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
      desc = "Git checkout -b <branch>"
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
