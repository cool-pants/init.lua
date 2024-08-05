return {
	opts = {
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
	},
}
