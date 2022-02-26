local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]] end -- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "lunarvim/onedarker.nvim"
  use ({ "catppuccin/nvim", as = "catppuccin" })
  use 'folke/tokyonight.nvim'
	use 'lewis6991/impatient.nvim' -- fast startup

  -- lsp config
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"

  use "hrsh7th/nvim-cmp" -- Completion plugin
  use "hrsh7th/cmp-nvim-lsp" -- cmp lsp plugin
  use "hrsh7th/cmp-nvim-lua" -- cmp lua
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline opts
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
	use "windwp/nvim-autopairs" -- Autopairs
	use "numToStr/Comment.nvim" -- Comment
	use "JoosepAlviste/nvim-ts-context-commentstring" -- String ts comment
	use "lewis6991/gitsigns.nvim" -- gitsigns
	use "kyazdani42/nvim-web-devicons" -- tree webicons
	use "kyazdani42/nvim-tree.lua" -- nvim tree
	use "akinsho/bufferline.nvim" -- top buffer line
	use "moll/vim-bbye"
	use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
	use "ahmedkhalf/project.nvim"
	use "nvim-lualine/lualine.nvim"
	use { "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" } -- better code action menu
	use "simrat39/symbols-outline.nvim"




		-- Cursorhold fix
	use {
		"antoinemadec/FixCursorHold.nvim",
		event = "BufRead",
		config = function()
			vim.g.cursorhold_updatetime = 100
		end,
	}

  -- snippets
  use "L3MON4D3/LuaSnip" -- snip engine
  use "rafamadriz/friendly-snippets"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-media-files.nvim"

  -- Treesitter
  use {
	  "nvim-treesitter/nvim-treesitter",
	  run = ":TSUpdate"
  }


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
