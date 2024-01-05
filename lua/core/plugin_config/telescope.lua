local builtin = require('telescope.builtin')
local telescope = require('telescope')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>hf', builtin.help_tags, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
vim.keymap.set('n', '<leader>pd', builtin.lsp_document_symbols, {})

telescope.setup {
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      ".git/"
    }
  }
}
