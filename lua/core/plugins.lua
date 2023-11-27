-- This file can be loaded by calling-- https://github.com/wbthomason/packer.nvim `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim' 

  use ('Shatur/neovim-ayu')

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    requires = { {'nvim-lua/plenary.nvim'} }
	}

	use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}) 

	use ('mbbill/undotree')

	use ('tpope/vim-fugitive')

	use {
		'saadparwaiz1/cmp_luasnip',
		"rafamadriz/friendly-snippets",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	}

	use("sbdchd/neoformat")

	use ("hrsh7th/nvim-cmp")
end)
