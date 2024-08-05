packadd({
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	opts = require("pants.configs.catppuccin").opts,
	priority = 1000,
})

packadd({
	"echasnovski/mini.nvim",
	config = require("pants.configs.mini").config,
})

packadd({
	"echasnovski/mini.hipatterns",
	lazy = true,
	ft = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"html",
		"css",
		"scss",
		"sass",
		"vue",
	},
	config = require("pants.configs.mini").hipatterns,
})
