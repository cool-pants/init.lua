return {
	lsp = "cssls",
	lsp_cmd = { "vscode-css-language-server", "--stdio" },
	lsp_opts = {
		settings = {
			css = {
				validate = true,
			},
			less = {
				validate = true,
			},
			scss = {
				validate = true,
			},
		},
	},
	ft = { "css", "scss", "less" },
	root = { "package.json" },
	check_buf_dir = true,
	formatters = {
		"prettierd",
		"prettier",
	},
	format_files = {
		"css",
		"scss",
		"less",
	},
}
