packadd({
	"neovim/nvim-lspconfig",
	ft = _G.my_languages_ft,
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		-- Useful status updates for LSP.
		-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
		{ "j-hui/fidget.nvim", opts = {} },

		-- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
		-- used for completion, annotations and signatures of Neovim apis
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local i = "■"
		vim.diagnostic.config({ signs = { text = { i, i, i, i } } })
		require("modules.lsp.backend")
		require("modules.lsp.frontend")
	end,
})

-- packadd({
-- 	"ray-x/go.nvim",
-- 	dependencies = { -- optional packages
-- 		"ray-x/guihua.lua",
-- 		"neovim/nvim-lspconfig",
-- 		"nvim-treesitter/nvim-treesitter",
-- 	},
-- 	config = function()
-- 		require("go").setup()
-- 	end,
-- 	event = { "CmdlineEnter" },
-- 	ft = { "go", "gomod" },
-- 	build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
-- })

packadd({
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	config = function()
		require("lspsaga").setup({
			symbol_in_winbar = {
				enable = true,
			},
			lightbulb = {
				sign = false,
			},
			implement = {
				enable = true,
				sign = true,
				virtual_text = true,
				priority = 100,
			},
			outline = {
				layout = "float",
			},
		})
	end,
})

packadd({
	"hrsh7th/nvim-cmp",
	event = "LspAttach",
	dependencies = {
		{
			-- Snippet Engine & its associated nvim-cmp source
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					-- Build Step is needed for regex support in snippets.
					-- This step is not supported in many windows environments.
					-- Remove the below condition to re-enable on windows.
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				config = function()
					local ls = require("luasnip")
					ls.filetype_extend("javascript", { "jsdoc" })

					--- TODO: What is expand?
				end,
				dependencies = {
					-- `friendly-snippets` contains a variety of premade snippets.
					--    See the README about individual language/framework/plugin snippets:
					--    https://github.com/rafamadriz/friendly-snippets
					{
						"rafamadriz/friendly-snippets",
						config = function()
							require("luasnip.loaders.from_vscode").lazy_load()
						end,
					},
				},
			},
			"saadparwaiz1/cmp_luasnip",

			-- Adds other completion capabilities.
			--  nvim-cmp does not ship with all sources by default. They are split
			--  into multiple repos for maintenance purposes.
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-path",
			"f3fora/cmp-spell",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-emoji",
		},
	},
	config = function()
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
	end,
})

packadd({
	"kristijanhusak/vim-dadbod-completion",
	-- event = 'InsertEnter',
	ft = { "sql" },
	init = function()
		-- vim.cmd([[autocmd FileType sql setlocal omnifunc=vim_dadbod_completion#omni]])
		vim.cmd(
			[[autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }, {name = 'buffer'}, {name = 'treesitter'}} })]]
		)
	end,
})
