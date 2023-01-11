local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer. Close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]])

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

return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("NvChad/nvim-colorizer.lua") -- Maintained fork of the fastest Neovim colorizer
	-- use({ "nvim-colortils/colortils.nvim", cmd = "Colortils" }) -- Some color utils for neovim
	use("nvim-tree/nvim-web-devicons") -- Devicons for Neovim
	use("nvim-tree/nvim-tree.lua") -- A file explorer tree
	use("akinsho/bufferline.nvim") -- A snazzy bufferline for Neovim
	use("moll/vim-bbye") -- Delete buffers and close files like :bdelete, but rewritten and well maintained
	use("nvim-lualine/lualine.nvim") -- A statusline written in pure lua
	use("akinsho/toggleterm.nvim") -- Manage multiple terminal windows
	use({
		"NvChad/nvterm",
		config = function()
			require("nvterm").setup()
		end,
	}) -- NvChad Official Terminal Plugin
	use("ahmedkhalf/project.nvim") -- The superior project management solution for neovim
	use("lewis6991/impatient.nvim") -- Improve startup time for Neovim
	use("lukas-reineke/indent-blankline.nvim") -- Indent guides for Neovim
	use("goolord/alpha-nvim") -- A lua powered greeter like vim-startify / dashboard-nvim
	use("antoinemadec/FixCursorHold.nvim") -- Fix CursorHold Performance. This is needed to fix lsp doc highlight
	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" }) -- Not UFO in the sky, but an ultra fold in Neovim.
	use("folke/which-key.nvim") -- Display a popup with possible keybindings
	use("rcarriga/nvim-notify") -- A fancy, configurable, notification manager for NeoVim
	use("folke/zen-mode.nvim") -- 🧘 Distraction-free coding for Neovim

	-- Colorschemes
	use("lunarvim/darkplus.nvim")
	-- use("folke/tokyonight.nvim")
	use("ellisonleao/gruvbox.nvim")
	use("sainnhe/gruvbox-material")
	use("rose-pine/neovim")
	-- use("olimorris/onedarkpro.nvim")
	use("shaunsingh/moonlight.nvim")
	use("lunarvim/synthwave84.nvim")
	use({
		"catppuccin/nvim",
		as = "catppuccin",
		run = ":CatppuccinCompile",
	})

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("hrsh7th/cmp-nvim-lsp") -- source for neovim builtin LSP client
	use("hrsh7th/cmp-nvim-lua") -- source for neovim for nvim lua
	use("hrsh7th/cmp-emoji") -- source for emoji
	use("ray-x/cmp-treesitter") -- cmp source for treesitter
	use("onsails/lspkind.nvim") -- vscode-like pictograms for neovim lsp completion items
	use("saadparwaiz1/cmp_luasnip") -- snippet completions

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use
	use("heavenshell/vim-jsdoc") -- Generate JSDoc to your JavaScript code
	use({ -- Generate proper code documentation skeletons with a single keypress
		"kkoomen/vim-doge",
		run = ":call doge#install()",
	})

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/mason.nvim") -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
	use("williamboman/mason-lspconfig.nvim") -- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use("ray-x/lsp_signature.nvim") -- LSP signature hint as you type
	use("SmiteshP/nvim-navic") -- Simple plugin that shows your current code context
	use("b0o/SchemaStore.nvim") -- JSON schemas for Neovim
	use("RRethy/vim-illuminate") -- highlighting other uses of the word under the cursor. Use LSP for intelligent hl
	use("https://git.sr.ht/~whynothugo/lsp_lines.nvim")
	-- use "github/copilot.vim"
	-- use {
	-- "zbirenbaum/copilot-cmp",
	-- module = "copilot_cmp",
	-- }

	-- Telescope
	use("nvim-telescope/telescope.nvim") -- Find, Filter, Preview, Pick. All lua, all the time.
	use({ -- FZF sorter for telescope written in c
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
	})
	use("nvim-telescope/telescope-media-files.nvim") -- Telescope extension to preview media files using Ueberzug
	use("nvim-telescope/telescope-project.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-treesitter/nvim-tree-docs") -- Code documentation built with treesitter
	use("nvim-treesitter/nvim-treesitter-context") -- Show code context
	use("JoosepAlviste/nvim-ts-context-commentstring") -- setting the commentstring based on the cursor location in a file
	use("p00f/nvim-ts-rainbow") -- Rainbow parentheses for neovim using tree-sitter. https://sr.ht/~p00f/nvim-ts-rainbow preferred
	use("windwp/nvim-ts-autotag") -- Autopairs, integrates with both cmp and treesitter
	use("nvim-treesitter/playground") -- Treesitter playground integrated into Neovim
	use("andymass/vim-matchup") -- vim match-up: even better % fist_oncoming navigate and highlight matching words fist_oncoming modern matchit and matchparen
	use({
		"kylechui/nvim-surround", -- Add/change/delete surrounding delimiter pairs with ease
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
	})

	-- Git
	use("lewis6991/gitsigns.nvim") -- Git integration for buffers
	use("tpope/vim-fugitive") -- fugitive.vim: A Git wrapper so awesome, it should be illegal
	use("mattn/vim-gist") -- Vim plugin for Gist
	use("mattn/webapi-vim") -- Vim interface to Web API

	-- DAP
	use("mfussenegger/nvim-dap") -- Debug Adapter Protocol client implementation for Neovim
	use("rcarriga/nvim-dap-ui") -- A UI for nvim-dap
	use("ravenxrz/DAPInstall.nvim") -- A NeoVim plugin for managing several debuggers for Nvim-dap

	-- Java
	use("mfussenegger/nvim-jdtls") -- Extensions for the built-in LSP support in Neovim for eclipse.jdt.ls

	-- Rust
	-- use "simrat39/rust-tools.nvim" -- Tools for better development in rust using neovim's builtin lsp

	-- Eww
	use("elkowar/yuck.vim")

	-- Markdown
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	-- Game to practice basic movements
	use("ThePrimeagen/vim-be-good")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	-- if PACKER_BOOTSTRAP then
	-- 	require("packer").sync()
	-- end
end)
