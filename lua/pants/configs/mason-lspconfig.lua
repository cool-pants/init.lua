local M = {}

M.config = function()
	require("mason").setup()
	require("mason-lspconfig").setup({
		ensure_installed = {
			-- lua
			"lua_ls",

			-- bash
			"bashls",

			-- webdev
			--- mardown
			"marksman",

			--- json
			"jsonls",

			--- css
			"cssls",
			"css_variables",
			"tailwindcss",

			--- html
			"html",

			--- react
			--- typescript
			"tsserver",
			"eslint",
			-- python
			"pyright",
			"ruff",
			"ruff_lsp",
			"basedpyright",

			-- go
			"gopls",

			-- cpp
			"clangd",

			-- sql
			"sqlls",

			-- yaml
			"yamlls",

			-- docker
			"dockerls",
			"docker_compose_language_service",
		},
	})
end

return M
