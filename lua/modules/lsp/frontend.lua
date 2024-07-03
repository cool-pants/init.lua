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
	init_options = {
		hostInfo = "neovim",
	},
	single_file_support = true,
	filetypes = {
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"javascript",
		"javascriptreact",
		"javascript.jsx",
	},
	root_dir = root_pattern({
		"tsconfig.json",
		"package.json",
		"jsconfig.json",
	}) or root_pattern({
		".git",
	}),
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
lspconfig.css_variables.setup({
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

-- npm i -g vscode-html-languageservice
lspconfig.html.setup({
	attach = _attach,
	capabilities = capabilities,
	init_options = {
		configurationSection = { "html", "css", "javascript" },
		embeddedLanguages = {
			css = true,
			javascript = true,
		},
		provideFormatter = true,
	},
	single_file_support = true,
	filetypes = {
		"html",
		"css",
		"javascript",
	},
})

-- npm install -g @tailwindcss/language-server
lspconfig.tailwindcss.setup({
	on_new_config = function(new_config)
		if not new_config.settings then
			new_config.settings = {}
		end
		if not new_config.settings.editor then
			new_config.settings.editor = {}
		end
		if not new_config.settings.editor.tabSize then
			-- set tab size for hover
			new_config.settings.editor.tabSize = vim.lsp.util.get_effective_tabstop()
		end
	end,
	init_options = {
		userLanguages = {
			eelixir = "html-eex",
			eruby = "erb",
			templ = "html",
		},
	},
	settings = {
		tailwindCSS = {
			classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
			lint = {
				cssConflict = "warning",
				invalidApply = "error",
				invalidConfigPath = "error",
				invalidScreen = "error",
				invalidTailwindDirective = "error",
				invalidVariant = "error",
				recommendedVariantOrder = "warning",
			},
			validate = true,
		},
	},
	filetypes = {
		"aspnetcorerazor",
		"astro",
		"astro-markdown",
		"blade",
		"clojure",
		"django-html",
		"htmldjango",
		"edge",
		"eelixir",
		"elixir",
		"ejs",
		"erb",
		"eruby",
		"gohtml",
		"gohtmltmpl",
		"haml",
		"handlebars",
		"hbs",
		"html",
		"html-eex",
		"heex",
		"jade",
		"leaf",
		"liquid",
		"markdown",
		"mdx",
		"mustache",
		"njk",
		"nunjucks",
		"php",
		"razor",
		"slim",
		"twig",
		"css",
		"less",
		"postcss",
		"sass",
		"scss",
		"stylus",
		"sugarss",
		"javascript",
		"javascriptreact",
		"javascript.tsx",
		"reason",
		"rescript",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"vue",
		"svelte",
		"templ",
	},
	root_dir = root_pattern({
		"tailwind.config.js",
		"tailwind.config.cjs",
		"tailwind.config.mjs",
		"tailwind.config.ts",
		"postcss.config.js",
		"postcss.config.cjs",
		"postcss.config.mjs",
		"postcss.config.ts",
	}),
})

lspconfig.marksman.setup({
	filetypes = {
		"markdown",
		"markdown.mdx",
	},
	single_file_support = true,
	root_dir = root_pattern(".git", ".marksman.toml"),
})
