packadd({
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
	config = require("pants.configs.mason-lspconfig").config,
})

packadd({
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		{ "j-hui/fidget.nvim", opts = {} },

		{ "folke/neodev.nvim", opts = {} },
	},
	lazy = true,
	ft = _G.languages, -- only load package for defined filetypes
	config = function()
		-- need to load it like this, otherwise require("lspconfig") fails
		-- TODO: find out why
		require("pants.configs.lspconfig")
	end,
})

packadd({
	-- linting and other good stuff
	"nvimtools/none-ls.nvim",
})

packadd({
	"folke/trouble.nvim",
	lazy = true,
	cmd = "Trouble",
	opts = {},
})

packadd({
	-- hypercharge LSP
	"nvimdev/lspsaga.nvim",
	lazy = true,
	event = "LspAttach",
	opts = require("pants.configs.lspsaga").opts,
})

packadd({
	-- Format on save
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	opts = require("pants.configs.conform").opts,
})
