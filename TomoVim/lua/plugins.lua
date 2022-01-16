local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

-- Automatically install packer
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- This file can be loaded by calling `lua require('plugins')` from your init.lua
return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Important
	use("nvim-lua/plenary.nvim") -- should come right after packer
	use("folke/which-key.nvim")
	use({
		"pwntester/octo.nvim",
		config = function()
			require("octo").setup()
		end,
	})
	use("jose-elias-alvarez/null-ls.nvim")

	-- git
	use("lewis6991/gitsigns.nvim")
	use("tpope/vim-fugitive")
	use("tpope/vim-repeat")
	use("sindrets/diffview.nvim")

	-- tmux
	use("aserowy/tmux.nvim")

	-- LSP
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("L3MON4D3/LuaSnip")
	use("williamboman/nvim-lsp-installer")
	use("ray-x/lsp_signature.nvim")
	use("folke/trouble.nvim")

	-- Python Formatter
	use("tell-k/vim-autopep8")

	-- TS
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("p00f/nvim-ts-rainbow")

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-project.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({
		"nvim-telescope/telescope-frecency.nvim",
		config = function()
			require("telescope").load_extension("frecency")
		end,
		requires = { "tami5/sqlite.lua" },
	})
	use({ "LinArcX/telescope-env.nvim" })
	use("cljoly/telescope-repo.nvim")

	-- Editing
	use("windwp/nvim-autopairs")
	use("numToStr/Comment.nvim")
	use("rafamadriz/friendly-snippets")
	use("simrat39/symbols-outline.nvim")
	use("Pocco81/AutoSave.nvim")
	use({ "michaelb/sniprun", run = "bash install.sh" })
	use({ "anuvyklack/pretty-fold.nvim" })
	use("lukas-reineke/indent-blankline.nvim")

	-- themes
	use("folke/tokyonight.nvim")
	use("tanvirtin/monokai.nvim")
	use("EdenEast/nightfox.nvim")
	use("bluz71/vim-nightfly-guicolors")

	-- UI
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
		config = function()
			require("nvim-tree").setup({})
		end,
	})
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use("romgrk/barbar.nvim")
	use("akinsho/toggleterm.nvim")
	use("rcarriga/nvim-notify")
	use("Xuyuanp/scrollbar.nvim")

	-- Markdown Preview
	use("iamcco/markdown-preview.nvim")

	-- Doge Generation
	use("kkoomen/vim-doge")

	-- Project
	-- Lua
	use({ "ahmedkhalf/project.nvim" })

	-- Dashboard
	use("glepnir/dashboard-nvim")

	-- Debugger
	use("mfussenegger/nvim-dap")
	use("Pocco81/DAPInstall.nvim")
	use("nvim-telescope/telescope-dap.nvim")
	use("mfussenegger/nvim-dap-python")
	use("theHamsta/nvim-dap-virtual-text")
	use("rcarriga/nvim-dap-ui")
	use({
		"rcarriga/vim-ultest",
		config = "require('config.ultest').post()",
		run = ":UpdateRemotePlugins",
		requires = { "vim-test/vim-test" },
	})

	-- Octave/Matlab
	use("tranvansang/octave.vim")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
