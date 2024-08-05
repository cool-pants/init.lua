local M = {}

local function flash(prompt_bufnr)
	require("flash").jump({
		pattern = "^",
		label = { after = { 0, 0 } },
		search = {
			mode = "search",
			exclude = {
				function(win)
					return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "TelescopeResults"
				end,
			},
		},
		action = function(match)
			local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
			picker:set_selection(match.pos[1] - 1)
		end,
	})
end

M.opts = {
	defaults = {
		prompt_prefix = " ",
		selection_caret = "➤ ",
		layout_config = {
			horizontal = { prompt_position = "top", results_width = 0.6 },
			vertical = { mirror = false },
		},
		mapping = {
			n = {
				s = flash,
			},
			i = {
				["<A-s>"] = flash,
			},
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
