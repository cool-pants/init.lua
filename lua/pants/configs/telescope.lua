local M = {}

M.opts = {
	defaults = {
		prompt_prefix = " ",
		selection_caret = "➤ ",
		layout_config = {
			horizontal = { prompt_position = "top", results_width = 0.6 },
			vertical = { mirror = false },
		},
		sorting_strategy = "ascending",
		file_ignore_patterns = {
			"node_modules",
			"venv",
			".venv",
			"[.+]git/",
			"__pycache__",
		},
	},
	}

M.config = function()
    require("telescope").setup(M.opts)
end

return M
