local M = {}

M.get_languages = function()
	return {
		"html",
		"typescript",
		"lua",
		"golang",
		"rust",
		"python",
		"docker",
		"css",
		"css_vars",
		"ecmascript",
		"tailwindcss",
	}
end

---@return table
M.get_formatters = function()
	local formatters = {}
	for _, value in ipairs(M.get_languages()) do
		local lang = require("core.languages." .. value)
		if lang.conf ~= nil then
			formatters[value] = lang.conf
			goto continue
		end
		if lang.formatters ~= nil then
			for _, fmt in ipairs(lang.format_files) do
				formatters[fmt] = { lang.formatters }
			end
		end
		::continue::
	end
	return formatters
end

return M
