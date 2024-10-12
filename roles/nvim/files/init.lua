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

	-- external package management
	{
		"williamboman/mason.nvim",
		lazy = false,
		build = ":MasonUpdate",
		config = function()
			require("mason").setup()
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
		},
	},
})

require("user.colorscheme")
require("user.session")
