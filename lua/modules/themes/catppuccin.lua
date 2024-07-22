---@type Huez.ThemeConfig
---@diagnostic disable-next-line: missing-fields
local M = {
	styles = { "latte", "frappe", "macchiato", "mocha" },
}

---@param theme string
---@return boolean
function M.set_theme(theme)
	require("catppuccin").setup({
		transparent_background = true,
		styles = {
			comments = { "italic" },
			keywords = { "bold", "italic" },
			functions = { "bold", "italic" },
			types = { "bold", "italic" },
		},
		integrations = {
			cmp = true,
			gitsigns = true,
			mason = true,
			flash = true,
			noice = true,
			notify = true,
			treesitter = true,
			treesitter_context = true,
			harpoon = true,
		},
		custom_highlights = function(colors)
			return {
				String = { style = { "italic", "bold" } },
			}
		end,
	})

	if theme ~= "catppuccin" then
		require("reactive").setup({
			load = { theme .. "-cursor", theme .. "-cursorline" },
		})
	end

	vim.cmd.colorscheme(theme)
	return true
end

return M
