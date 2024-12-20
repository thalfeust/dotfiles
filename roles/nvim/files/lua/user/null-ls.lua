-- prevents having multiple formatter running on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local null_ls = require("null-ls")

local opts = {
	sources = {
		null_ls.builtins.formatting.stylua, -- lua
	},
	-- search for a workspace's config file
	-- and activate formatting on save
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ async = false })
				end,
			})
		end
	end,
}

return opts
