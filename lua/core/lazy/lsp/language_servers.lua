local M = {}

---@return table
M.get_all_servers = function()
	-- Enable the following language servers
	--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
	--
	--  Add any additional override configuration in the following tables. Available keys are:
	--  - cmd (table): Override the default command used to start the server
	--  - filetypes (table): Override the default list of associated filetypes for the server
	--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
	--  - settings (table): Override the default settings passed when initializing the server.
	--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
	local bufdir = vim.loop.os_homedir()
	local root_pattern = require("lspconfig").util.root_pattern
	local languages = require("core.languages.init").get_languages()
	local servers = {
		-- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
		--
		-- Some languages (like typescript) have entire language plugins that can be useful:
		--    https://github.com/pmizio/typescript-tools.nvim
		--
	}
	for _, value in ipairs(languages) do
		local lang = require("core.languages." .. value)
		local lang_setup = {}
		if lang.lsp_cmd ~= nil then
			lang_setup["cmd"] = lang.lsp_cmd
		end
		if lang.ft ~= nil then
			lang_setup["filetypes"] = lang.ft
		end
		if lang.root ~= nil then
			lang_setup["root_dir"] = root_pattern(vim.fn.flattennew({ lang.root, ".git" }))
			if lang.check_buf_dir then
				lang_setup["root_dir"] = lang_setup["root_dir"] or bufdir
			end
		end
		if lang.lsp_opts ~= nil then
			for key, v in pairs(lang.lsp_opts) do
				lang_setup[key] = v
			end
		end
		servers[lang.lsp] = lang_setup
	end

	return servers
end

return M
