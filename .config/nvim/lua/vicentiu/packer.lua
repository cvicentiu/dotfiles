-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Fuzzy Finder
  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function() vim.cmd('colorscheme rose-pine') end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    config = { run = ':TSUpdate' }
  }

  use {'theprimeagen/harpoon'}
  use {'mbbill/undotree'}
  use {'tpope/vim-fugitive'}

  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }

  use { 'mhinz/vim-signify' }
  use {
      'vimwiki/vimwiki',
      config = function()
          vim.g.vimwiki_list = {
              {
                  path = '~/Documents/wiki',
                  path_html = '~/Documents/wiki/html',
                  ext = '.md'
              },
          }

          vim.g.vimwiki_global_ext = 0

          -- vim.g.vimwiki_ext2syntax = {
          --     ['.md'] = 'markdown',
          --     ['.markdown'] = 'markdown',
          --     ['.mdown'] = 'markdown',
          -- }
      end
  }
end)
