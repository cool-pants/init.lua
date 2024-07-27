local Icons = {}

Icons.separators = {
	angle_quote = {
		left = "«",
		right = "»",
	},
	chevron = {
		left = "",
		right = "",
		down = "",
	},
	circle = {
		left = "",
		right = "",
	},
	arrow = {
		left = "",
		right = "",
	},
	slant = {
		left = "",
		right = "",
	},
	bar = {
		left = "⎸",
		right = "⎹",
	},
}

Icons.diagnostics = {
	errors = "󰞏", --
	warnings = "", -- "",--
	hints = "󱐌", --"󰮔", -- 󱐌
	info = "",
}
Icons.diagnostics.Error = Icons.diagnostics.errors
Icons.diagnostics.Warn = Icons.diagnostics.warnings
Icons.diagnostics.Hint = Icons.diagnostics.hints
Icons.diagnostics.Info = Icons.diagnostics.info

Icons.actions = {
	close_hexagon = "󰅜",
	close_round = "󰅙",
	close_outline = "󰅚",
	close = "󰅖",
	close_box = "󰅗",
}

return Icons
