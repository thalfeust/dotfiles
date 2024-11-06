local cmp = require("cmp")
local lspkind = require("lspkind")

local key_bindings = {
	qwerty = { scrolld = "<C-d>", scrollu = "<C-d>", openclose = "<C-r>" },
	colemak = { scrolld = "<C-l>", scrollu = "<C-u>", openclose = "<C-s>" },
}

local layout_keys = key_bindings[layout] or key_bindings.qwerty

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},

	sources = {
		{ name = "nvim_lua" }, -- source for neovim Lua API
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer", keyword_length = 3 },
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
	window = {
		completion = cmp.config.window.bordered({
			col_offset = -3,
			scrollbar = false,
			winhighlight = "Normal:Normal,FloatBorder:CmpBorder,CursorLine:Visual,Search:None",
		}),
		documentation = cmp.config.window.bordered({
			winhighlight = "Normal:Normal,FloatBorder:CmpBorder,CursorLine:Visual,Search:None",
		}),
	},

	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = lspkind.cmp_format({
			mode = "symbol",
			menu = {
				nvim_lua = "[API]",
				nvim_lsp = "[LSP]",
				luasnip = "[snip]",
				buffer = "[buf]",
			},
		}),
	},
})

-- color customization function
local function set_cmp_item_color(item, source)
	local color = vim.api.nvim_get_hl(0, { name = source }).fg
	vim.api.nvim_set_hl(0, item, { fg = color, bg = "NONE" })
end

-- customize entry's menu color
set_cmp_item_color("CmpItemMenu", "NonText")
set_cmp_item_color("CmpItemAbbr", "Text")
set_cmp_item_color("CmpItemAbbrMatch", "Statement")
set_cmp_item_color("CmpBorder", "CursorLineNr")
