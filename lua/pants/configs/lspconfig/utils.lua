local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = vim.tbl_deep_extend("force", M.capabilities, require("cmp_nvim_lsp").default_capabilities())

function M._attach(client, _)
	vim.opt.omnifunc = "v:lua.vim.lsp.omnifunc"
	-- vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
	client.server_capabilities.semanticTokensProvider = nil
end

return M
