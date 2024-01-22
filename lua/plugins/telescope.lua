return {
  "nvim-telescope/telescope.nvim",
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { "<leader>ps", require("telescope.builtin").live_grep,             desc = "Live grep" },
    { "<leader>pf", require("telescope.builtin").find_files,            desc = "Find file" },
    { "<leader>po", require("telescope.builtin").lsp_document_symbols,  desc = "Document symbols" },
    { "<leader>pO", require("telescope.builtin").lsp_workspace_symbols, desc = "Workspace symbols" },
    { "<leader>hf", require("telescope.builtin").help_tags,             desc = "Find help tags" },
    { "<leader>gC", require("telescope.builtin").git_commits, desc = "List of commits" },
  }
}
