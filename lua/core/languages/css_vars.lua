return {
	lsp = "css_variables",
	lsp_cmd = { "css-variables-language-server", "--stdio" },
	lsp_opts = {
		settings = {
			cssVariables = {
				lookupFiles = { "**/*.less", "**/*.scss", "**/*.sass", "**/*.css" },
				blacklistFolders = {
					"**/.cache",
					"**/.DS_Store",
					"**/.git",
					"**/.hg",
					"**/.next",
					"**/.svn",
					"**/bower_components",
					"**/CVS",
					"**/dist",
					"**/node_modules",
					"**/tests",
					"**/tmp",
				},
			},
		},
	},
	ft = { "css", "scss", "less" },
	root = { "package.json" },
	check_buf_dir = true,
}
