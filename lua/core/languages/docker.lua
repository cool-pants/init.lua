return {
	lsp = "dockerls",
	lsp_cmd = { "docker-langserver", "--stdio" },
	lsp_opts = {
		single_file_support = true,
	},
	ft = { "dockerfile" },
	root = { "Dockerfile" },
}
