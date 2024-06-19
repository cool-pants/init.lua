return {
	lsp = "html",
	lsp_cmd = { "vscode-html-language-server", "--stdio" },
	lsp_opts = {
		init_options = {
			configurationSection = { "html", "css", "javascript" },
			embeddedLanguages = {
				css = true,
				javascript = true,
			},
			provideFormatter = true,
		},
		single_file_support = true,
	},
	ft = { "html", "templ" },
	root = {},
	check_buf_dir = true,
	formatters = {
		"prettierd",
		"prettier",
	},
	format_files = { "html", "markdown", "yaml", "json", "jsonc" },
}
