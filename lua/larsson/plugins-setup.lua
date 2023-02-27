local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()
-- Autocommand to reload Neovim whenever file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end
return packer.startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim") -- lua functions that many plugins use
	------ COLORSCHEMES ------
	use({ "ellisonleao/gruvbox.nvim" })
	use("bluz71/vim-nightfly-colors")
	use({
		"glepnir/zephyr-nvim",
		requires = { "nvim-treesitter/nvim-treesitter", opt = true },
	})

	use("eddyekofo94/gruvbox-flat.nvim")

	------ ESSENTIALS ------
	use({
		"akinsho/git-conflict.nvim",
		tag = "*",
		config = function()
			require("git-conflict").setup()
		end,
	})
	use("tpope/vim-fugitive")
	use({ --Lua fork of tpope's vim-surround
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup()
		end,
	})

	use("vim-scripts/ReplaceWithRegister") -- replace with register contents using motion (gr + motion)
	use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

	------ MOVEMENT ------
	use("ggandor/leap.nvim") --Motion with Leap

	------ COMMENTING ------
	use("numToStr/Comment.nvim") -- commenting with gc
	use("JoosepAlviste/nvim-ts-context-commentstring") -- context aware commenting

	------ FILETREE ------
	use("nvim-tree/nvim-tree.lua")

	-------- TERMINAL --------
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup()
		end,
	})

	-------- DEBUGGING --------
	-- use("mfussenegger/nvim-dap")

	-- fuzzy finding w/ telescope
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x", requires = { { "BurntSushi/ripgrep" } } }) -- fuzzy finder
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance

	-------- AUTOCOMPLETION --------
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths

	-------- SNIPPETS --------
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	-------- LSP --------
	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			require("lspsaga").setup({

				ui = {
					border = "rounded",
				},
				symbol_in_winbar = {
					separator = " ⟩ ",
				},
			})
		end,
	})
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	use({
		"ray-x/lsp_signature.nvim", -- Function signatures
	})
	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	-------- UTILITY --------
	--[[ use({
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	}) ]]
	use({
		"romgrk/barbar.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	}) -- tabline plugin
	use("p00f/nvim-ts-rainbow") --For colorizing bracket pairs and such
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	use("rcarriga/nvim-notify")
	use("norcalli/nvim-colorizer.lua") -- Color highlighter
	use("kyazdani42/nvim-web-devicons") -- vs-code like icons
	use("nvim-lualine/lualine.nvim") -- statusline
	use("mbbill/undotree")
	use("debugloop/telescope-undo.nvim")
	use({
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.dashboard").config)
		end,
	})
	use("lukas-reineke/indent-blankline.nvim") --indent helpers
	use("szw/vim-maximizer") -- maximizes and restores current window
	use("petertriho/nvim-scrollbar") -- Scrollbar

	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
			require("scrollbar.handlers.gitsigns").setup()
		end,
	})
	if packer_boostrap then
		require("packer").sync()
	end
end)
