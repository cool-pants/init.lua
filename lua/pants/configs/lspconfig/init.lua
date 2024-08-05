local utils = require("pants.configs.lspconfig.utils")
local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
	on_attach = utils._attach,
	capabilities = utils.capabilities,
	filetypes = { "lua" },
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
					"${3rd}/luv/library",
					unpack(vim.api.nvim_get_runtime_file("", true)),
				},
				checkThirdParty = "Disable",
			},
			completion = {
				callSnippet = "Replace",
			},
		},
	},
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
		on_attach = utils._attach,
		capabilities = utils.capabilities,
	})
end

require("pants.configs.lspconfig.cpp")
require("pants.configs.lspconfig.golang")
require("pants.configs.lspconfig.python")
require("pants.configs.lspconfig.frontend")
