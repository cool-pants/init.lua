---@type Huez.ThemeConfig
---@diagnostic disable-next-line: missing-fields
local M = {
	styles = { "dawn", "main", "moon" },
}

M.set_theme = function(theme)
	local base_conf = {
		highlight_groups = {
			Comment = { italic = true },
			Keyword = { bold = true, italic = true },
			TelescopeSelectionCaret = { fg = "none", bg = "none" },
		},
		styles = {
			transparency = false,
		},
	}
	local additional_conf = {}
	if theme ~= "rose-pine-dawn" then
		additional_conf = vim.tbl_extend("force", additional_conf, {
			highlight_groups = {
				TelescopeBorder = { fg = "highlight_high", bg = "none" },
				TelescopeNormal = { bg = "none" },
				TelescopePromptNormal = { bg = "base" },
				TelescopeResultsNormal = { fg = "subtle", bg = "none" },
				TelescopeSelection = { fg = "text", bg = "base" },
			},
		})
	end
	require("rose-pine").setup(vim.tbl_deep_extend("force", base_conf, additional_conf))
	vim.cmd("colorscheme " .. theme)
	return true
end

return M
