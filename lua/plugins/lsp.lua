return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/vim-vsnip",
    "hrsh7th/cmp-nvim-lsp",
    "lukas-reineke/lsp-format.nvim",
    "neovim/nvim-lspconfig"
  },
  lazy = false,
  keys = {
    { "K",  vim.lsp.buf.hover,                           desc = "Hover infos" },
    { "gd", vim.lsp.buf.definition,                      desc = "Go to definition" },
    { "gD", vim.lsp.buf.declaration,                     desc = "Go to declaration" },
    { "gr", require("telescope.builtin").lsp_references, desc = "Show references" },
    { "ca", vim.lsp.buf.code_action,                     desc = "Code Action" },
    { "rn", vim.lsp.buf.rename,                          desc = "Rename" },
  },
  config = function()
    require("mason").setup()
    require("lsp-format").setup()

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- Automatic Server Setup :h mason-lspconfig-automatic-server-setup
    local handlers = {
      -- The first entry (without a key) will be the default handler
      -- and will be called for each installed server that doesn't have
      -- a dedicated handler.
      function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup({
          capabilities = capabilities,
          on_attach = function(client, bufnr)
            if server_name == "volar" then
              vim.api.nvim_create_autocmd("BufWritePost", {
                command = 'silent! EslintFixAll',
              })
            else
              require("lsp-format").on_attach(client, bufnr)
            end
          end,
        }
        )
      end,
    }

    require("mason-lspconfig").setup({
      automatic_installation = true,
      handlers = handlers
    })
  end
}
