---@type Huez.ThemeConfig
---@diagnostic disable-next-line: missing-fields
local M = {
	styles = {},
}

---neomodern campfire
---@param theme string
---@return boolean
function M.set_theme(theme)
	print("Setting theme")
	require("neomodern").setup({
		style = "campfire",
		transparent = true,
		code_style = {
			keywords = "bold,italic",
		},
	})
	vim.cmd.colorscheme(theme)
	return true
end

return M
