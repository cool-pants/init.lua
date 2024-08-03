<<<<<<< HEAD
local conf = require("modules.editor.config")

packadd({
	"numToStr/Comment.nvim",
	config = "BufEnter",
	opts = {},
})

packadd({
	"willothy/nvim-cokeline",
	dependencies = {
		"stevearc/resession.nvim",
	},
	event = "BufEnter",
	config = conf.cokeline,
=======
packadd({
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	opts = require("pants.configs.telescope").opts,
	lazy = true,
	requires = { { "nvim-lua/plenary.nvim" } },
})

packadd({
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	lazy = true,
	cmd = "Neotree",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
>>>>>>> 4086e70 (feat(rewrite): super fast nvim config)
})

packadd({
	"stevearc/oil.nvim",
<<<<<<< HEAD
	cmd = "Oil",
	config = conf.oil,
})

packadd({
	"nvim-tree/nvim-tree.lua",
	cmd = { "NvimTreeToggle", "NvimTreeFocus" },
	config = conf.nvim_tree,
})

packadd({
	"folke/flash.nvim",
	event = "VeryLazy",
})

packadd({
	"echasnovski/mini.nvim",
	config = conf.mini,
})

packadd({
	"echasnovski/mini.hipatterns",
	ft = {
		_G.webdev_languages,
	},
	config = conf.mini_hi,
})

packadd({
	"folke/trouble.nvim",
	cmd = "Trouble",
})

packadd({
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	config = conf.telescope,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		{ -- If encountering errors, see telescope-fzf-native README for installation instructions
			"nvim-telescope/telescope-fzf-native.nvim",

			-- `build` is used to run some command when the plugin is installed/updated.
			-- This is only run then, not every time Neovim starts up.
			build = "make",

			-- `cond` is a condition used to determine whether this plugin should be
			-- installed and loaded.
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
	},
=======
	lazy = true,
	cmd = "Oil",
	opts = require("pants.configs.oil").opts,
>>>>>>> 4086e70 (feat(rewrite): super fast nvim config)
})

-- Treesitter fun

packadd({
	"nvim-treesitter/nvim-treesitter",
<<<<<<< HEAD
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
	build = ":TSUpdate",
	config = conf.nvim_treesitter,
=======
	lazy = true,
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
	build = ":TSUpdate",
	config = require("pants.configs.treesitter").config,
>>>>>>> 4086e70 (feat(rewrite): super fast nvim config)
})

packadd({
	"nvim-treesitter/nvim-treesitter-context",
<<<<<<< HEAD
	event = { "BufEnter", "BufNewFile", "BufReadPre" },
	config = conf.nvim_treesitter_context,
=======
	lazy = true,
	event = { "BufEnter", "BufNew", "BufReadPre" },
	opts = require("pants.configs.treesitter-context").opts,
>>>>>>> 4086e70 (feat(rewrite): super fast nvim config)
})

packadd({
	"windwp/nvim-ts-autotag",
<<<<<<< HEAD
	ft = {
		"ts",
		"tsx",
		"js",
		"jsx",
		"html",
		"vue",
	},
	config = conf.ts_autotag,
})

packadd({
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = conf.conform,
})

--@see https://github.com/nvim-treesitter/nvim-treesitter-textobjects/issues/507
packadd({
	"nvim-treesitter/nvim-treesitter-textobjects",
	ft = { "c", "rust", "go", "lua" },
	config = function()
		vim.defer_fn(function()
			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup({
				textobjects = {
					select = {
						enable = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = { query = "@class.inner" },
						},
					},
				},
			})
		end, 0)
	end,
=======
	lazy = true,
	event = "InsertEnter",
	config = true,
>>>>>>> 4086e70 (feat(rewrite): super fast nvim config)
})

-- Git utils

packadd({
	"lewis6991/gitsigns.nvim",
	lazy = true,
	event = "BufEnter",
	opts = require("pants.configs.gitsigns").opts,
})

packadd({
	"tpope/vim-fugitive",
	lazy = true,
	cmd = { "Git" },
})

-- Database integration

packadd({
	"tpope/vim-dadbod",
	event = "VeryLazy",
	lazy = true,
	cmd = { "DB", "DBUI" },
})

packadd({
	"kristijanhusak/vim-dadbod-ui",
	lazy = true,
	cmd = "DBUI",
})

-- Cool folke plugins

packadd({
	"folke/flash.nvim",
	lazy = true,
	event = "BufEnter",
})

packadd({
	"folke/todo-comments.nvim",
	lazy = true,
	event = "BufEnter",
	opts = { signs = false },
})

-- Folke neoconf
packadd({
	"folke/neoconf.nvim",
	priority = 900,
	opts = {},
})

-- Debug Adapter Protocol
packadd({
	"mfussenegger/nvim-dap",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"rcarriga/nvim-dap-ui",

		"leoluz/nvim-dap-go",
		"mfussenegger/nvim-dap-python",
	},
	lazy = true,
	event = "BufEnter",
	config = require("pants.configs.nvim-dap").config,
})
