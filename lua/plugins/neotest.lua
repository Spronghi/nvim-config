return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "folke/neodev.nvim",
    "nvim-neotest/neotest-go",
    "marilari88/neotest-vitest",
  },
  lazy = true,
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-go"),
        require("neotest-vitest"),
      },
    })
  end,
  keys = {
    {
      "<leader>tt",
      function()
        require("neotest").run.run()
      end,
      desc = "Run one"
    },
    {
      "<leader>tf",
      function()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      desc = "Run all"
    },
    {
      "<leader>td",
      function()
        require("neotest").run.run({ strategy = "dap" })
      end,
      desc = "Debug"
    },
    {
      "<leader>ts",
      function()
        require("neotest").run.stop()
      end,
      desc = "Stop"
    },
    {
      "<leader>to",
      function()
        require("neotest").output_panel.toggle()
      end,
      desc = "Attach"
    },
    {
      "<leader>tp",
      function()
        require("neotest").summary.toggle()
      end,
      desc = "Summary"
    },
    {
      "<leader>ta",
      function()
        require("neotest").run.attach()
      end,
      desc = "Attach"
    },
  }
}
