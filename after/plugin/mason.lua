require("mason").setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function (_, _)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, {})
  vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, {})

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

-- Automatic Server Setup :h mason-lspconfig-automatic-server-setup
local handlers = {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function (server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {
      on_attach = on_attach,
      capabilities  = capabilities,
    }
  end
}

require("mason-lspconfig").setup({ handlers = handlers })
