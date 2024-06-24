return {
	name = "kanagawa",
	style = { "lotus", "dragon", "wave" },
	transparent = false,
	activate = function(style, transparency)
		require("kanagawa").setup({
			theme = style,
			transparent = true,
			undercurl = true,
		})
		vim.cmd("colorscheme kanagawa" .. "-" .. style)
	end,
}
