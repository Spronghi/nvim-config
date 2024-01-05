local wk = require("which-key")

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
