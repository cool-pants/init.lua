return {
	lsp = "rust_analyzer",
	lsp_cmd = { "rust-analyzer" },
	lsp_opts = {
		single_file_support = true,
	},
	ft = { "rust" },
	root = { "Cargo.toml", "rust-project.json" },
}
