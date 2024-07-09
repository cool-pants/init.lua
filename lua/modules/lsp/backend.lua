local M = {}
local lspconfig = require("lspconfig")
local util = require("lspconfig.util")
local root_pattern = util.root_pattern

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = vim.tbl_deep_extend("force", M.capabilities, require("cmp_nvim_lsp").default_capabilities())

function M._attach(client, _)
	vim.opt.omnifunc = "v:lua.vim.lsp.omnifunc"
	-- vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
	client.server_capabilities.semanticTokensProvider = nil
end

lspconfig.gopls.setup({
	cmd = { "gopls", "serve" },
	on_attach = M._attach,
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = root_pattern({ "go.mod", "go.sum" }),
	capabilities = M.capabilities,
	single_file_support = true,
	settings = {
		gopls = {
			gofumpt = true,
			codelenses = {
				gc_details = false,
				generate = true,
				regenerate_cgo = true,
				run_govulncheck = true,
				test = true,
				tidy = true,
				upgrade_dependency = true,
				vendor = true,
			},
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
			analyses = {
				fieldalignment = true,
				nilness = true,
				unusedparams = true,
				unusedwrite = true,
				useany = true,
			},
			usePlaceholders = true,
			completeUnimported = true,
			staticcheck = true,
			directoryFilters = {
				"-.git",
				"-.vscode",
				"-.idea",
				"-.vscode-test",
				"-node_modules",
			},
			semanticTokens = true,
		},
	},
})

lspconfig.lua_ls.setup({
	on_attach = M._attach,
	capabilities = M.capabilities,
	settings = {
		Lua = {
			diagnostics = {
				unusedLocalExclude = { "_*" },
				globals = { "vim" },
				disable = {
					"luadoc-miss-see-name",
					"undefined-field",
				},
			},
			runtime = {
				version = "LuaJIT",
				-- path = vim.split(package.path, ';'),
			},
			workspace = {
				library = {
					vim.env.VIMRUNTIME .. "/lua",
					"${3rd}/busted/library",
					"${3rd}/luv/library",
				},
				checkThirdParty = "Disable",
			},
			completion = {
				callSnippet = "Replace",
			},
		},
	},
})

lspconfig.clangd.setup({
	cmd = { "clangd", "--background-index" },
	on_attach = M._attach,
	capabilities = M.capabilities,
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

lspconfig.rust_analyzer.setup({
	on_attach = M._attach,
	capabilities = M.capabilities,
	settings = {
		["rust-analyzer"] = {
			imports = {
				granularity = {
					group = "module",
				},
				prefix = "self",
			},
			cargo = {
				buildScripts = {
					enable = true,
				},
			},
			procMacro = {
				enable = true,
			},
		},
	},
})

lspconfig.pyright.setup({
	on_attach = M._attach,
	capabilities = M.capabilities,
	root_dir = function(filename)
		return util.root_pattern({ ".git" })(filename) or util.path.dirname(filename)
	end,
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "workspace",
				useLibraryCodeForTypes = true,
			},
		},
	},
	single_file_support = true,
})

lspconfig.ruff_lsp.setup({
	cmd = { "ruff-lsp" },
	filetypes = { "python" },
	root_dir = function(filename)
		return util.root_pattern({ ".git" })(filename) or util.path.dirname(filename)
	end,
	single_file_support = true,
})

local servers = {
	"bashls",
	"sqlls",
	"zls",
	"dockerls",
}
-- lspconfig.pylsp.setup({ settings = { pylsp = { plugins = { pylint = { enabled = true } } } } })

for _, server in ipairs(servers) do
	lspconfig[server].setup({
		on_attach = M._attach,
		capabilities = M.capabilities,
	})
end

vim.lsp.handlers["workspace/diagnostic/refresh"] = function(_, _, ctx)
	local ns = vim.lsp.diagnostic.get_namespace(ctx.client_id)
	local bufnr = vim.api.nvim_get_current_buf()
	vim.diagnostic.reset(ns, bufnr)
	return true
end

return M
