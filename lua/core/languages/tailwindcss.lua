return {
	lsp = "tailwindcss",
	lsp_cmd = { "tailwindcss-language-server", "--stdio" },
	lsp_opts = {
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
	},

	ft = {
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
	root = {
		"tailwind.config.js",
		"tailwind.config.cjs",
		"tailwind.config.mjs",
		"tailwind.config.ts",
		"postcss.config.js",
		"postcss.config.cjs",
		"postcss.config.mjs",
		"postcss.config.ts",
	},
}
