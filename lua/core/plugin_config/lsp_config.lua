require("mason").setup()
require("lsp-inlayhints").setup()
require("lsp-format").setup {}

vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
vim.api.nvim_create_autocmd("LspAttach", {
  group = "LspAttach_inlayhints",
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end

    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    require("lsp-inlayhints").on_attach(client, bufnr)
  end,
})

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

require("mason-lspconfig").setup({
  automatic_installation = true,
  handlers = handlers
})
