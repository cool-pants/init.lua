---@type Huez.ThemeConfig
---@diagnostic disable-next-line: missing-fields
local M = {
	styles = { "moon", "day", "night", "storm" },
}

---@param theme string
M.set_theme = function(theme)
	---@type tokyonight.Config
	local base_conf = {
		styles = {
			functions = { bold = true, italic = true },
			variables = { italic = true },
			keywords = { bold = true, italic = true },
		},
		on_colors = function(colors) end,
		on_highlights = function(highlights, colors)
			highlights["Type"] = { bold = true, italic = true }
			highlights["@string.javascript"] = { bold = true, italic = true, fg = colors.green }
		end,
	}

	require("tokyonight").setup(base_conf)
	vim.cmd("colorscheme " .. theme)
	return true
end

return M
