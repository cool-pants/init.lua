local lspconfig = require("lspconfig")
local _attach = require("modules.lsp.backend")._attach
local capabilities = require("modules.lsp.backend").capabilities
local root_pattern = require("lspconfig").util.root_pattern

lspconfig.jsonls.setup({
	on_attach = _attach,
})

-- npm i -g typescript
-- npm i -g typescript-langauge-server
lspconfig.tsserver.setup({
	on_attach = _attach,
	capabilities = capabilities,
})

-- npm i -g vscode-css-languageservice
lspconfig.cssls.setup({
	filetypes = {
		"css",
		"scss",
		"less",
	},
	on_attach = _attach,
	capabilities = capabilities,
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
	root_dir = root_pattern({ "package.json" }) or vim.fn.getcwd(),
})

-- npm i -g css-variable-ls
lspconfig.cssvar.setup({
	filetypes = {
		"css",
		"scss",
		"less",
	},
	on_attach = _attach,
	capabilities = capabilities,
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
	root_dir = root_pattern({ "package.json" }) or vim.fn.getcwd(),
})

-- npm i -g vscode-langservers-extracted
lspconfig.eslint.setup({
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"vue",
		"svelte",
		"astro",
	},
	settings = {
		codeAction = {
			disableRuleComment = {
				enable = true,
				location = "separateLine",
			},
			showDocumentation = {
				enable = true,
			},
		},
		codeActionOnSave = {
			enable = false,
			mode = "all",
		},
		experimental = {
			useFlatConfig = false,
		},
		format = true,
		nodePath = "",
		onIgnoredFiles = "off",
		problems = {
			shortenToSingleLine = false,
		},
		quiet = false,
		rulesCustomizations = {},
		run = "onType",
		useESLintClass = false,
		validate = "on",
		workingDirectory = {
			mode = "location",
		},
	},
	on_attach = function(client, bufnr)
		_attach(client)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			command = "EslintFixAll",
		})
	end,
})
