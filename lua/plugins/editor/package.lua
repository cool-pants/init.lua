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
})

packadd({
	"stevearc/oil.nvim",
	lazy = true,
	cmd = "Oil",
	opts = require("pants.configs.oil").opts,
})

-- Treesitter fun

packadd({
	"nvim-treesitter/nvim-treesitter",
	lazy = true,
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
	build = ":TSUpdate",
	config = require("pants.configs.treesitter").config,
})

packadd({
	"nvim-treesitter/nvim-treesitter-context",
	lazy = true,
	event = { "BufEnter", "BufNew", "BufReadPre" },
	opts = require("pants.configs.treesitter-context").opts,
})

packadd({
	"windwp/nvim-ts-autotag",
	lazy = true,
	event = "InsertEnter",
	config = true,
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
