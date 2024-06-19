return {
	lsp = "gopls",
	lsp_cmd = { "gopls" },
	lsp_opts = {
		single_file_support = true,
	},
	ft = {
		"go",
		"gomod",
		"gowork",
		"gotmpl",
	},
	root = {
		"go.mod",
		"go.sum",
	},
	formatters = {
		"gofumpt",
	},
	format_files = {
		"golang",
	},
}
