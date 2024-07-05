---@param transparent boolean
---@return Themify.ThemeConf
local function get_conf(transparent)
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
	if transparent then
		additional_conf = vim.tbl_extend("force", additional_conf, {
			highlight_groups = {
				TelescopeBorder = { fg = "highlight_high", bg = "none" },
				TelescopeNormal = { bg = "none" },
				TelescopePromptNormal = { bg = "base" },
				TelescopeResultsNormal = { fg = "subtle", bg = "none" },
				TelescopeSelection = { fg = "text", bg = "base" },
				TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
			},
			styles = {
				transparency = true,
			},
		})
	end

	---@type Themify.ThemeConf
	local conf = {
		set_theme = function(theme)
			require("rose-pine").setup(vim.tbl_deep_extend("force", base_conf, additional_conf))
			vim.cmd("colorscheme " .. theme)
			return true
		end,
	}

	return conf
end

return {
	get_conf = get_conf,
}
