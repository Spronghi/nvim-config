-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- You can configure Neovim to automatically run :PackerCompile whenever plugins.lua is updated with an autocommand
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])


-- bootstrapping packer the first execution
-- from https://github.com/wbthomason/packer.nvim?tab=readme-ov-file#bootstrapping
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup({
  function(use)
    if packer_bootstrap then
      require('packer').sync()
    end

    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use {
      'nvim-telescope/telescope.nvim',
      requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    use {
      "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
    }

    use {
      "windwp/nvim-ts-autotag",
      config = function() require("nvim-ts-autotag").setup {} end
    }

    use {
      "folke/which-key.nvim",
      config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        require("which-key").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }

    use {
      'wbthomason/packer.nvim',
      'Shatur/neovim-ayu',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      "rafamadriz/friendly-snippets",
      'mbbill/undotree',
      'tpope/vim-fugitive',
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "kkharji/sqlite.lua",
      "fatih/vim-go",
      "lukas-reineke/lsp-format.nvim",
    }

    use {
      "nvim-neotest/neotest",
      requires = {
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "folke/neodev.nvim",
        "nvim-neotest/neotest-go",
      }
    }
  end,
  config = {
    display = {
      open_fn = require('packer.util').float,
    }
  }
})
