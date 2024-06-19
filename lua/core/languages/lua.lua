return {
	lsp = "lua_ls",
	lsp_cmd = { "lua-language-server" },
	lsp_opts = {
		-- filetypes = { ...},
		-- capabilities = {},
		settings = {
			Lua = {
				runtime = { version = "LuaJIT" },
				completion = {
					callSnippet = "Replace",
				},
				diagnostics = {
					globals = { "vim", "it" },
				},
				-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
				-- diagnostics = { disable = { 'missing-fields' } },
			},
		},
	},
	ft = { "lua" },
	formatters = {
		"stylua",
	},
	format_files = { "lua" },
}
