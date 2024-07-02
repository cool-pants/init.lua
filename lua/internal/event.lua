local api = vim.api
local au = api.nvim_create_autocmd
local group = api.nvim_create_augroup("CoolpantsGroup", {})

au("BufWritePre", {
	group = group,
	pattern = { "/tmp/*", "COMMIT_EDITMSG", "MERGE_MSG", "*.tmp", "*.bak" },
	command = "setlocal noundofile",
})

au("TextYankPost", {
	group = group,
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 400 })
	end,
})

au("BufEnter", {
	group = group,
	once = true,
	callback = function()
		require("keymap")
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

		local bufnr = api.nvim_get_current_buf()
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>p", "<cmd>Git push<CR>", {})
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>P", "<cmd>Git pull --rebase<CR>", {})
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>t", ":Git push -u origin", {})
	end,
})

--disable diagnostic in neovim test file *_spec.lua
au("FileType", {
	group = group,
	pattern = "lua",
	callback = function(opt)
		local fname = api.nvim_buf_get_name(opt.buf)
		if fname:find("%w_spec%.lua") then
			vim.diagnostic.enable(not vim.diagnostic.is_enabled({ bufnr = opt.buf }))
		end
	end,
})

--for alacritty only
au("ExitPre", {
	group = group,
	command = "set guicursor=a:ver90",
	desc = "Set cursor back to beam when leaving Neovim.",
})

au("InsertEnter", {
	group = group,
	callback = function()
		require("internal.pairs").setup({})
	end,
})

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
