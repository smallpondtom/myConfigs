local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- This file can be loaded by calling `lua require('plugins')` from your init.lua
return require('packer').startup(function()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

  -- Important
  use 'nvim-lua/plenary.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'folke/which-key.nvim'

  -- LSP
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'L3MON4D3/LuaSnip'
  use 'williamboman/nvim-lsp-installer'
  use 'ray-x/lsp_signature.nvim'

  -- TS
  use { 'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"}

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}

  -- Editing
  use 'windwp/nvim-autopairs'
  use 'numToStr/Comment.nvim'

  -- themes
  use 'folke/tokyonight.nvim'
  use 'tanvirtin/monokai.nvim'
  use 'EdenEast/nightfox.nvim'
  use 'bluz71/vim-nightfly-guicolors'

  -- UX
	use {
	    'kyazdani42/nvim-tree.lua',
	    requires = {
	      'kyazdani42/nvim-web-devicons', -- optional, for file icon
	    },
	    config = function() require'nvim-tree'.setup {} end
	}
  use {
  'nvim-lualine/lualine.nvim',
  requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use 'romgrk/barbar.nvim'

  -- Markdown Preview
  use 'iamcco/markdown-preview.nvim'

  -- Doge Generation
  use 'kkoomen/vim-doge'

  -- Project
  -- Lua
  use {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  -- Dashboard
  use 'glepnir/dashboard-nvim'

	if packer_bootstrap then
	require('packer').sync()
	end
end)

