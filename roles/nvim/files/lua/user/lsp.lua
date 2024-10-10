-- lua lsp setup
----------------------------------------------
local lua_ls_config = {
	runtime = {
		version = "LuaJIT", -- specify Lua version
	},
	-- make the server aware of Neovim runtime files
	workspace = {
		checkThirdParty = false,
		library = {
			vim.env.VIMRUNTIME,
		},
	},
}
require("lspconfig").lua_ls.setup({
	on_init = function(client)
		-- search for a config file in the workspace
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc") then
				return
			end
		end

		-- use default configuration if no config file is found
		-- merge the base settings with the Lua Language Server config
		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, lua_ls_config)
	end,
	settings = {
		Lua = {},
	},
})
