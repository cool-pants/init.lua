local conf = require("modules.ui.configs")
packadd({
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		"rcarriga/nvim-notify",
	},
	opts = {},
})

packadd({
	"rcarriga/nvim-notify",
	event = "UIEnter",
	---@type notify.Config
	---@diagnostic disable-next-line: missing-fields
	opts = {
		background_colour = "#000000",
		stages = "static",
		timeout = 3000,
		max_height = function()
			return math.floor(vim.o.lines * 0.75)
		end,
		max_width = function()
			return math.floor(vim.o.columns * 0.75)
		end,
		on_open = function(win)
			vim.api.nvim_win_set_config(win, { zindex = 100 })
		end,
	},
})

packadd({
	"folke/todo-comments.nvim",
	event = "BufEnter",
	opts = { signs = false },
})

packadd({
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	config = conf.lualine,
})

packadd({
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = conf.which_key,
})

--- Enhance cursor
packadd({ "rasulomaroff/reactive.nvim" })

packadd({
	"vague2k/huez.nvim",
	branch = "main",
	event = "UIEnter",
	opts = {
		suppress_messages = true,
		theme_config_module = "modules.themes",
	},
})

packadd({
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = conf.alpha,
})
