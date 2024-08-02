local M = {}

M.config = function()
	local luasnip = require("luasnip")
	luasnip.filetype_extend("javascript", { "jsdoc" })
	local lsvscode = require("luasnip.loaders.from_vscode")
	lsvscode.lazy_load({ paths = { "./snippets" } })
end

return M
