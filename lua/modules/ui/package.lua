local conf = require("modules.ui.config")

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
	config = function()
		require("noice").setup({})
	end,
})

packadd({
	"rcarriga/nvim-notify",
	---@type notify.Config
	---@diagnostic disable-next-line: missing-fields
	opts = {
		background_colour = "#000000",
		stages = "static",
		timeout = 300,
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
	config = function(opts)
		require("notify").setup(vim.tbl_deep_extend("force", opts, {
			background_colour = "#000000",
		}))
	end,
})

packadd({
	"folke/todo-comments.nvim",
	event = "VimEnter",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = { signs = false },
})

packadd({
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = conf.lualine,
})

packadd({
	"folke/which-key.nvim",
	event = "VimEnter",
	opts = {
		defaults = {
			mode = { "n", "v" },
			["g"] = { name = "+goto" },
			["gs"] = { name = "+surround" },
			["z"] = { name = "+fold" },
			["]"] = { name = "+next" },
			["["] = { name = "+prev" },
			["<leader><tab>"] = { name = "+tabs" },
			["<leader>b"] = { name = "+buffer" },
			["<leader>c"] = { name = "+code" },
			["<leader>f"] = { name = "+file/find" },
			["<leader>g"] = { name = "+git" },
			["<leader>gh"] = { name = "+hunks" },
			["<leader>q"] = { name = "+quit/session" },
			["<leader>s"] = { name = "+search" },
			["<leader>u"] = { name = "+ui" },
			["<leader>w"] = { name = "+windows" },
			["<leader>x"] = { name = "+diagnostics/quickfix" },
		},
	},
	config = conf.which_key,
})

packadd({ "rebelot/kanagawa.nvim" })
packadd({ "ellisonleao/gruvbox.nvim" })
packadd({ "nyoom-engineering/oxocarbon.nvim" })
packadd({ "folke/tokyonight.nvim" })
packadd({ "rose-pine/neovim", as = "rosepine" })
packadd({ "ray-x/aurora" })

-- packadd({
-- 	"cool-pants/themify",
-- 	-- if you want registry related features, uncomment this
-- 	-- import = "huez-manager.import"
-- 	branch = "main",
-- 	event = "UIEnter",
-- 	config = conf.themify,
-- })

packadd({
	"cool-pants/huez.nvim",
	branch = "add_theme_conf",
	event = "UIEnter",
	config = function()
		require("huez").setup({
			suppress_messages = true,
			theme_config_module = "modules.themes",
		})
	end,
})
