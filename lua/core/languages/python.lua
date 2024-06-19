return {
	lsp = "pyright",
	lsp_cmd = { "pyright-langserver", "--stdio" },
	lsp_opts = {
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
	},
	ft = {
		"python",
		"py",
	},
	root = {},
	formatters = {
		"isort",
		"black",
	},
	format_files = { "python" },
}
