-- refer to https://github.com/hrsh7th/nvim-cmp/ for docs
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/vim-vsnip",
  },
  config = function()
    local cmp = require("cmp")

    -- TODO understand if these are needed or add a comment
    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-o>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end,
      },
      sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        },
        {
          { name = 'buffer' },
        }),
    })
  end
}
