return {
  "preservim/vimux",
  keys = {
    { "<leader>vr", ":VimuxPromptCommand<cr>", desc = "Run on tmux" },
    { "<leader>vi", ":VimuxInspectRunner<cr>", desc = "Inspect tmux runner" },
    { "<leader>vz", ":VimuxZoomRunner<cr>",    desc = "Zoom tmux runner" },
    { "<leader>vo", ":VimuxOpenRunner<cr>",    desc = "Open tmux runner" },
  }
}
