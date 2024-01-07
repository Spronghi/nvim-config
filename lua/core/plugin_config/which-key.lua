local wk = require("which-key")

vim.g.mapleader = " "

-- generic
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
    f = { "<cmd>Git diff<cr>", "Git diff" },
    d = { vim.cmd.Gdiff, "Gdiff" },
    a = { "<cmd>Git add .<cr>", "Git add ." },
    p = { "<cmd>Git push<cr>", "Git push" },
    c = { function()
      local message = vim.fn.input("Commit message: ")
      local command = string.format('Git commit -m"%s"', message)

      if command == "" then
        return
      end

      vim.cmd(command)
    end, "Git commit" },

  }
}, { prefix = "<leader>" })

-- neotest
local neotest = require("neotest")

wk.register({
  t = {
    name = "test",
    t = { neotest.run.run, "Run one" },
    f = { function()
      neotest.run.run(vim.fn.expand("%"))
    end, "Run all" },
    d = { function()
      neotest.run.run({ strategy = "dap" })
    end, "Debug" },
    s = { function()
      neotest.run.stop()
    end, "Stop" },
    a = { function()
      neotest.run.attach()
    end, "Attach" }
  }
}, { prefix = "<leader>" })

-- lsp
wk.register({
  r = {
    n = { vim.lsp.buf.rename, "Rename" },
  },
  c = {
    a = { vim.lsp.buf.code_action, "Code Action" },
  }
}, { prefix = "<leader>" })

wk.register({
  K = { vim.lsp.buf.hover, "Hover infos" },
  g = {
    d = { vim.lsp.buf.hover, "Go to definition" },
    r = { require("telescope.builtin").lsp_references, "Show references" },
  },
})
