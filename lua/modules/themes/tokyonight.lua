---@return Themify.ThemeConf
local function get_conf()
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

	---@type Themify.ThemeConf
	local conf = {
		set_theme = function(theme)
			require("tokyonight").setup(base_conf)
			vim.cmd("colorscheme " .. theme)
			return true
		end,
	}

	return conf
end

return {
	get_conf = get_conf,
}
