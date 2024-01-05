local wk = require("which-key")

vim.g.mapleader = " "

-- others in lua/core/plugin_config/lsp_config.lua

-- generic
wk.register({
  h = { ":nohlsearch<CR>", "Clear search" },
  p = {
    v = { vim.cmd.Ex, "Ex" },
  }
}, { prefix = "<leader>" })

-- undotree
wk.register({
  u = { vim.cmd.UndotreeToggle, "undotree" },
}, { prefix = "<leader>" })

-- telescope
local builtin = require('telescope.builtin')

wk.register({
  p = {
    name = "file",
    f = { builtin.find_files, "Find File" },
    s = { builtin.live_grep, "Live Grep" },
    o = { builtin.lsp_document_symbols, "Document Symbols" },
  },
  h = {
    name = "help",
    f = { builtin.help_tags, "Find Help Tags" }
  }
}, { prefix = "<leader>" })

-- git
wk.register({
  g = {
    name = "git",
    g = { vim.cmd.Git, "Git" },
    f = { "<cmd>Git diff<cr>", "GitDiff" },
    d = { vim.cmd.Gdiff, "Gdiff" },
    a = { "<cmd>Git add .<cr>", "Git add ." },
    p = { "<cmd>Git push<cr>", "Git push" },
    c = { function() 
      local message = vim.fn.input("Commit message: ")
      local command = string.format('Git commit -m"%s"',message)

      if command == "" then 
        return
      end

      vim.cmd(command)
    end, "Git commit" },

  }
}, { prefix = "<leader>" })

-- neotest
wk.register({
  t = {
    name = "test",
    t = { require("neotest").run.run, "Run one" },
    f = { function()
      require("neotest").run.run(vim.fn.expand("%"))
    end, "Run all" },
    d = { function()
      require("neotest").run.run({ strategy = "dap" })
    end, "Debug" },
    s = { function()
      require("neotest").run.stop()
    end, "Stop" },
    a = { function()
      require("neotest").run.attach()
    end, "Attach" }
  }
}, { prefix = "<let diffader>" })