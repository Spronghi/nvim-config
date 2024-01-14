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
    f = { builtin.find_files, "Find file" },
    s = { builtin.live_grep, "Live grep" },
    o = { builtin.lsp_document_symbols, "Document symbols" },
    O = { builtin.lsp_workspace_symbols, "Workspace symbols" },
  },
  h = {
    name = "help",
    f = { builtin.help_tags, "Find Help Tags" }
  },
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
    C = { builtin.git_commits, "List of commits" },
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
    o = { function()
      neotest.summary.toggle()
    end, "Attach" },
    a = { function()
      neotest.run.attach()
    end, "Attach" },
  }
}, { prefix = "<leader>" })

-- lsp
wk.register({
  r = {
    n = { vim.lsp.buf.rename, "Rename" },
  },
  c = {
    name = "code",
    a = { vim.lsp.buf.code_action, "Code Action" },
  }
}, { prefix = "<leader>" })

wk.register({
  K = { vim.lsp.buf.hover, "Hover infos" },
  g = {
    d = { vim.lsp.buf.definition, "Go to definition" },
    D = { vim.lsp.buf.declaration, "Go to declaration" },
    r = { builtin.lsp_references, "Show references" },
  },
})

-- markdown
wk.register({
  m = {
    name = "markdown",
    d = { ":MarkdownPreviewToggle<CR>", "Preview" },
  }
})

-- tmux
wk.register({
  { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
  { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
  { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
  { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
  { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
})
