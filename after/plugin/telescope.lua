local builtin = require('telescope.builtin')
local telescope = require('telescope')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>hf', function()
  builtin.help_tags()
end)
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
vim.keymap.set('n', '<leader>pd', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>pg', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

telescope.setup {
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      ".git/"
    }
  }
}

telescope.load_extension('neoclip')
