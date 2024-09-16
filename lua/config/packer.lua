-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	   -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
      "loctvl842/monokai-pro.nvim",
      config = function()
          require("monokai-pro").setup()
      end
  }

  use("theprimeagen/harpoon")

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use {
    "lervag/vimtex",
    config = function()
        vim.g.vimtex_view_method = "zathura"
    end
  }

  use({
      "L3MON4D3/LuaSnip",
      tag = "v2.*",
      run = "make install_jsregexp",
  })

  use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  requires = {
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    -- {'L3MON4D3/LuaSnip'},
  }
}
end)
