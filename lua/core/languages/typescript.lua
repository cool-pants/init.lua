return {
	lsp = "tsserver",
	lsp_cmd = { "typescript-language-server", "--stdio" },
	lsp_opts = {
		init_options = {
			hostInfo = "neovim",
		},
		single_file_support = true,
	},
	ft = {
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"javascript",
		"javascriptreact",
		"javascript.jsx",
	},
	root = {
		"tsconfig.json",
		"package.json",
		"jsconfig.json",
	},
	formatters = {
		"prettierd",
		"prettier",
	},
	format_files = {
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"vue",
	},
}
