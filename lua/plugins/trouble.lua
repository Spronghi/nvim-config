return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    { "<leader>xx", function() require("trouble").toggle() end,                        desc = "Open trouble" },
    { "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end, desc = "Workspace diagnostics" },
    { "<leader>xd", function() require("trouble").toggle("document_diagnostics") end,  desc = "Document diagnostic" },
    { "<leader>xq", function() require("trouble").toggle("quickfix") end,              desc = "Quickfix" },
    { "<leader>xl", function() require("trouble").toggle("loclist") end,               desc = "Loclist" },
    { "gR",         function() require("trouble").toggle("lsp_references") end,        desc = "LSP references" },
  }
}
