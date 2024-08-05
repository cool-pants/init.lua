local lspconfig = require("lspconfig")
local utils = require("pants.configs.lspconfig.utils")

lspconfig.clangd.setup({
	cmd = { "clangd", "--background-index" },
	on_attach = utils._attach,
	capabilities = utils.capabilities,
	root_dir = function(fname)
		return lspconfig.util.root_pattern(unpack({
			--reorder
			"compile_commands.json",
			".clangd",
			".clang-tidy",
			".clang-format",
			"compile_flags.txt",
			"configure.ac", -- AutoTools
		}))(fname) or lspconfig.util.find_git_ancestor(fname)
	end,
})
