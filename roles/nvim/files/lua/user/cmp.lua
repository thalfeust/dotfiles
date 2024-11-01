local cmp = require("cmp")
local lspkind = require("lspkind")

local key_bindings = {
	qwerty = { scrolld = "<C-d>", scrollu = "<C-d>", openclose = "<C-r>" },
	colemak = { scrolld = "<C-l>", scrollu = "<C-u>", openclose = "<C-s>" },
}

local layout_keys = key_bindings[layout] or key_bindings.qwerty

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
	},

	mapping = cmp.mapping.preset.insert({
		-- scroll entry documentation
		[layout_keys.scrolld] = cmp.mapping.scroll_docs(4),
		[layout_keys.scrollu] = cmp.mapping.scroll_docs(-4),
		-- open or close nvim-cmp
		[layout_keys.openclose] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.close()
			else
				cmp.complete()
			end
		end, { "i", "c" }),
		-- enter to apply the selected entry
		["<CR>"] = cmp.mapping(function(fallback)
			if cmp.visible() and cmp.get_active_entry() then
				cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
			else
				fallback()
			end
		end, { "i" }),
		-- tab to apply the first enter or the selected one
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				if not cmp.get_selected_entry() then
					cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
				end
				cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace })
			else
				fallback()
			end
		end, { "i" }),
	}),

	-- cmp window style
	view = {
		entries = "custom",
	},

	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text",
			menu = {
				nvim_lsp = "[LSP]",
			},
		}),
	},
})
