require("mason").setup()
require("mason").setup()

require("lsp-format").setup {}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Automatic Server Setup :h mason-lspconfig-automatic-server-setup
local handlers = {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {
      capabilities = capabilities,
      on_attach    = function(client, bufnr)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, {})
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, {})

        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
        vim.keymap.set('n', 'gi', require('telescope.builtin').lsp_references, {})
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})

        if server_name == "volar" then
          vim.api.nvim_create_autocmd("BufWritePost", {
            command = 'silent! EslintFixAll',
          })
        else
          require("lsp-format").on_attach(client, bufnr)
        end
      end,
    }
  end,
}

require("mason-lspconfig").setup({ automatic_installation = true, handlers = handlers })

require("lsp-format").setup {}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Automatic Server Setup :h mason-lspconfig-automatic-server-setup
local handlers = {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {
      capabilities = capabilities,
      on_attach    = function(client, bufnr)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, {})
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, {})

        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
        vim.keymap.set('n', 'gi', require('telescope.builtin').lsp_references, {})
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})

        if server_name == "volar" then
          vim.api.nvim_create_autocmd("BufWritePost", {
            command = 'silent! EslintFixAll',
          })
        else
          require("lsp-format").on_attach(client, bufnr)
        end
      end,
    }
  end,
}

require("mason-lspconfig").setup({ automatic_installation = true, handlers = handlers })
