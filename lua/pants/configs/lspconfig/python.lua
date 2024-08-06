local lspconfig = require("lspconfig")
local utils = require("pants.configs.lspconfig.utils")
local util = require("lspconfig.util")

lspconfig.pyright.setup({
	on_attach = utils._attach,
	capabilities = utils.capabilities,
	root_dir = function(filename)
		return util.root_pattern({ ".git" })(filename) or util.path.dirname(filename)
	end,
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "workspace",
				useLibraryCodeForTypes = true,
			},
		},
	},
	single_file_support = true,
})

lspconfig.ruff_lsp.setup({
	cmd = { "ruff-lsp" },
	filetypes = { "python" },
	root_dir = function(filename)
		return util.root_pattern({ ".git" })(filename) or util.path.dirname(filename)
	end,
	single_file_support = true,
})

lspconfig.pylsp.setup({
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					ignore = { "W391" },
					maxLineLength = 100,
				},
			},
		},
	},
})
