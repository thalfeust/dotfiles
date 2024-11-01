require("user.options")

local is_colemak_layout = (layout == "colemak")
require(is_colemak_layout and "user.keymaps_colemak" or "user.keymaps_qwerty")

-- lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- plugins loading
require("lazy").setup({
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "olimorris/persisted.nvim", lazy = false, config = true },

	-- plugin denpendencies
	{ "nvim-lua/plenary.nvim" },

	-- external package management
	{
		"williamboman/mason.nvim",
		lazy = false,
		build = ":MasonUpdate",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"Whoissethdaniel/mason-tool-installer.nvim",
		lazy = false,
		config = function()
			require("mason-tool-installer").setup({
				auto_update = true,
				run_on_start = true,
				ensure_installed = {
					"stylua", -- lua formatter
				},
			})
		end,
	},

	-- language server protocole plugins
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			ensure_installed = {
				"lua_ls", -- lua
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			require("user.lsp")
		end,
	},

	-- completion plugins
	{
		"hrsh7th/nvim-cmp",
		lazy = false,
		config = function()
			require("user.cmp")
		end,
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "onsails/lspkind.nvim" },
		},
	},

	-- formatter plugins
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "VeryLazy",
		opts = function()
			return require("user.null-ls")
		end,
	},
})

-- plugins configuration
require("user.colorscheme")
require("user.session")
