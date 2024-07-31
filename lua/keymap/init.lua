require("keymap.remap")
local map = require("core.keymap")
local flash = require("flash")
local cmd = map.cmd

local diagnostic_goto = function(next, severity)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ severity = severity })
	end
end

map.n({
	-- Lazy
	["<Leader>l"] = cmd("Lazy"),

	-- nvimtree
	["<leader>tf"] = cmd("NvimTreeFocus"),
	["<leader>tt"] = cmd("NvimTreeToggle"),

	-- Lspsaga
	["<leader>q"] = vim.diagnostic.setloclist,
	["<leader>cd"] = vim.diagnostic.open_float,
	["]d"] = diagnostic_goto(true),
	["[d"] = diagnostic_goto(false),
	["]e"] = diagnostic_goto(true, "ERROR"),
	["[e"] = diagnostic_goto(false, "ERROR"),
	["]w"] = diagnostic_goto(true, "WARN"),
	["[w"] = diagnostic_goto(false, "WARN"),
	["K"] = cmd("Lspsaga hover_doc"),
	["ga"] = cmd("Lspsaga code_action"),
	["grn"] = cmd("Lspsaga rename"),
	["gD"] = cmd("Lspsaga peek_definition"),
	["gr"] = cmd("Lspsaga finder"),
	["gri"] = cmd("Lspsaga finder imp"),
	-- Tab navigation
	["te"] = cmd("tabedit"),
	["<C-n>"] = cmd("tabNext"),
	["<C-p>"] = cmd("tabprevious"),

	-- Bufferline Nav
	["<Tab>"] = function()
		require("cokeline.mappings").by_step("focus", 1)
	end,
	["<S-Tab>"] = function()
		require("cokeline.mappings").by_step("focus", -1)
	end,
	-- Dadbod
	["<Leader>b"] = cmd("DBUI"),
	-- Telescope builtin
	["gd"] = require("telescope.builtin").lsp_definitions,
	["gR"] = require("telescope.builtin").lsp_references,
	["gI"] = require("telescope.builtin").lsp_implementations,
	["<Leader>rn"] = vim.lsp.buf.rename,
	["<Leader>ca"] = vim.lsp.buf.code_action,

	-- huez
	-- ["<leader>co"] = require("themify.pickers").themes,
	["<leader>co"] = require("huez.pickers").themes,

	-- Notify
	["<Leader>xn"] = function()
		require("notify").dismiss({ pending = true, silent = true })
	end,

	["<Leader>o"] = cmd("Lspsaga outline"),
	["<Leader>dw"] = cmd("show_workspace_diagnostics"),
	["<Leader>db"] = cmd("Lspsaga show_buf_diagnostics"),
	-- Telescope
	["<Leader>fa"] = cmd("Telescope live_grep"),
	["<Leader>fs"] = cmd("Telescope grep_string"),
	["<Leader>ff"] = cmd("Telescope find_files find_command=rg,--ignore,--hidden,--files"),
	["<Leader>fm"] = cmd("Telescope marks"),
	["<Leader>fg"] = cmd("Telescope git_files"),
	["<Leader>T"] = cmd("Telescope colorscheme"),
	-- find in workspace folder which is project dir
	["<Leader>fw"] = cmd("Telescope find_files cwd=$HOME/personal" .. "find_command=rg,--ignore,--hidden,--files"),
	["<Leader>fh"] = cmd("Telescope help_tags"),
	["<Leader>gc"] = cmd("Telescope git_commits"),
	["<Leader>fd"] = cmd("Telescope dotfiles"),
	-- Huez
	["<Leader>th"] = cmd("Huez"),
	-- Oil
	["-"] = cmd("Oil"),
	-- Trouble
	["<Leader>xx"] = cmd("Trouble diagnostics toggle"),
	["<Leader>xX"] = cmd("Trouble diagnostics toggle filter.buf=0"),
	["<Leader>cs"] = cmd("Trouble symbols toggle focus=false"),
	["<Leader>cl"] = cmd("Trouble lsp toggle focus=false win.position=right"),
	["<Leader>xL"] = cmd("Trouble loclist toggle"),
	["<Leader>xQ"] = cmd("Trouble qflist toggle"),
	-- Harpoon
	["<Leader>H"] = function()
		require("harpoon"):list():add()
	end,
	["<Leader>h"] = function()
		local harpoon = require("harpoon")
		harpoon.ui:toggle_quick_menu(harpoon:list())
	end,

	-- Fugitive
	["<Leader>gs"] = cmd("Git"),
	["gu"] = cmd("diffget //2"),
	["gh"] = cmd("diffget //3"),
})

local harpoonKeys = {}

for i = 1, 5 do
	harpoonKeys["<Leader>" .. i] = function()
		require("harpoon"):list():select(i)
	end
end

map.n(harpoonKeys)

map.nxo({
	["s"] = function()
		flash.jump()
	end,
	["S"] = function()
		flash.treesitter()
	end,
})
