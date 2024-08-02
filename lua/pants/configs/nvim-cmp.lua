local M = {}

M.config = function()
	local cmp = require("cmp")
	local luasnip = require("luasnip")
	luasnip.config.setup({})

	local sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "buffer" },
	}

	local kind_icons = {
		Text = "",
		Method = "󰆧",
		Function = "󰊕",
		Constructor = "",
		Field = "󰇽",
		Variable = "󰂡",
		Class = "󰠱",
		Interface = "",
		Module = "",
		Property = "󰜢",
		Unit = "",
		Value = "󰎠",
		Enum = "",
		Keyword = "󰌋",
		Snippet = "",
		Color = "󰏘",
		File = "󰈙",
		Reference = "",
		Folder = "󰉋",
		EnumMember = "",
		Constant = "󰏿",
		Struct = "",
		Event = "",
		Operator = "󰆕",
		TypeParameter = "󰅲",
	}

	if vim.o.ft == "sql" then
		vim.notify("entered buffer of type sql", "INFO", { data = "CMP" })
		table.insert(sources, { name = "vim-dadbod-completion" })
		print(vim.inspect(sources))
	end

	cmp.setup({
		sources = sources,
		---@diagnostic disable-next-line: missing-fields
		formatting = {
			format = function(entry, vim_item)
				-- print(vim.inspect(vim_item.kind))

				-- if cmp_kind ~= nil and not vim.wo.diff then
				-- 	cmp_kind = require("navigator.lspclient.lspkind").cmp_kind
				-- 	local ok, cmp_kind = pcall(require, "navigator")
				-- 	if ok then
				-- 		cmp_kind = require("navigator.lspclient.lspkind").cmp_kind
				-- 		vim_item.kind = cmp_kind(vim_item.kind)
				-- 	end
				-- end
				vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
				vim_item.menu = ({
					buffer = "",
					nvim_lsp = " ",
					luasnip = " 🐍",
					treesitter = " ",
					nvim_lua = " ",
					spell = "󰓆",
					emoji = "󰞅",
					latex_symbols = "󰿉",
					["vim-dadbod-completion"] = "",
					-- copilot = '🤖',
					-- cmp_tabnine = '🤖',
					look = "",
				})[entry.source.name]
				return vim_item
			end,
		},
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		completion = {
			completeopt = "menu,menuone,noinsert",
			autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged },
		},

		-- For an understanding of why these mappings were
		-- chosen, you will need to read `:help ins-completion`
		--
		-- No, but seriously. Please read `:help ins-completion`, it is really good!
	})

	-- for vim dadbod
	cmp.setup.filetype({ "sql" }, {
		sources = {
			{ name = "vim-dadbod-completion" },
			{ name = "buffer" },
		},
	})
end

return M
