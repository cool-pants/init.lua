local au = vim.api.nvim_create_autocmd
local group = vim.api.nvim_create_augroup("CoolpantsGroup", {})

au("TextYankPost", {
	group = group,
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 400 })
	end,
})

-- Inlay Hints nice
au("LspAttach", {
	group = group,
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client ~= nil and client.server_capabilities.inlayHintProvider then
			---@diagnostic disable-next-line: redundant-parameter
			vim.lsp.inlay_hint.enable(true, nil, args.buf)
		end
		-- whatever other lsp config you want
	end,
})

au("BufEnter", {
	callback = function()
		local opt = vim.opt

		-- tab behaviour
		local tabLen = {
			javascript = 2,
			javascriptreact = 2,
			json = 2,
			typescript = 2,
			typescriptreact = 2,
		}
		opt.smarttab = true
		opt.expandtab = true
		opt.autoindent = true

		opt.softtabstop = tabLen[vim.bo.filetype] or 4
		opt.shiftwidth = tabLen[vim.bo.filetype] or 4
	end,
})

-- Vim Fugitive Courtesy ThePrimeagen
au("BufWinEnter", {
	group = group,
	pattern = "*",
	callback = function()
		if vim.bo.ft ~= "fugitive" then
			return
		end

		local bufnr = vim.api.nvim_get_current_buf()
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>p", "<cmd>Git push<CR>", {})
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>P", "<cmd>Git pull --rebase<CR>", {})
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>t", ":Git push -u origin", {})
	end,
})
