local map = require("core.keymap")
local cmd = map.cmd

map.n({
	-- basics
	["<Esc>"] = cmd("nohlsearch"),
	["<C-s>"] = cmd("write"),

	-- disable arrow keys in normal mode
	["<Left>"] = cmd('echo "Use h to move!!"'),
	["<Right>"] = cmd('echo "Use l to move!!"'),
	["<Up>"] = cmd('echo "Use k to move!!"'),
	["<Down>"] = cmd('echo "Use j to move!!"'),

	-- window
	["<C-h>"] = "<C-w><C-h>",
	["<C-l>"] = "<C-w><C-l>",
	["<C-j>"] = "<C-w><C-j>",
	["<C-k>"] = "<C-w><C-k>",
	["<A-[>"] = cmd("vertical resize -5"),
	["<A-]>"] = cmd("vertical resize +5"),

	-- Magic motions to move stuff around
	["<A-j>"] = cmd("m .+1"),
	["<A-k>"] = cmd("m .-2"),

	-- Move around with cursor at center
	["<A-d>"] = "<C-d>zz",
	["<A-u>"] = "<C-u>zz",

	-- Search around with search term at center
	["n"] = "nzzzv",
	["N"] = "Nzzzv",

	-- Greatest remap courtesy : asbjornHaland. Yank to clipboard
	["<leader>Y"] = [["+Y]],

	-- cool replace all occurances of word in file
	["<leader>s"] = [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Lf>]],

	-- source current file
	["<leader><leader>"] = cmd("so"),

	-- highlights under cursor
	["<leader>ui"] = vim.show_pos,
	["<leader>uI"] = "<cmd>InspectTree<cr>",
})

map.nv({
	-- Greatest remap courtesy : asbjornHaland. Yank to clipboard
	["<leader>y"] = [["+y]],
})

map.i({
	["<C-s>"] = cmd("write"),

	["<C-d>"] = "<C-o>ciw",
	-- insert down/up
	["<C-j>"] = "<C-o>o",
	["<C-k>"] = "<C-o>O",
	--@see https://github.com/neovim/neovim/issues/16416
	["<C-C>"] = "<C-C>",

	-- Magic motions to move stuff around
	["<A-j>"] = "<esc><cmd>m .+1<cr>==gi",
	["<A-k>"] = "<esc><cmd>m .-2<cr>==gi",
})

map.v({
	["<A-j>"] = ":m '>+1<cr>gv=gv",
	["<A-k>"] = ":m '<-2<cr>gv=gv",
	["<"] = "<gv",
	[">"] = ">gv",
})

map.x({
	-- Greatest remap ever!! Paste while keeping current data in bufr
	["<leader>p"] = [["_dP]],
})
local ls = require("luasnip")
ls.filetype_extend("javascript", { "jsdoc" })

--- TODO: What is expand?
---
map.i("<C-s>e", function()
	ls.expand()
end, { silent = true })

map.is("<C-s>", function()
	ls.jump(1)
end, { silent = true })

map.is("<C-s>,", function()
	ls.jump(-1)
end, { silent = true })

map.is("<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { silent = true })

local cmp = require("cmp")
map.i({
	-- Select the [n]ext item
	["<C-n>"] = cmp.mapping.select_next_item(),
	-- Select the [p]revious item
	["<C-p>"] = cmp.mapping.select_prev_item(),

	-- Scroll the documentation window [b]ack / [f]orward
	["<C-b>"] = cmp.mapping.scroll_docs(-4),
	["<C-f>"] = cmp.mapping.scroll_docs(4),

	-- Accept ([y]es) the completion.
	--  This will auto-import if your LSP supports it.
	--  This will expand snippets if the LSP sent a snippet.
	-- ["<C-y>"] = cmp.mapping.confirm({ select = true }),

	-- If you prefer more traditional completion keymaps,
	-- you can uncomment the following lines
	["<A-CR>"] = cmp.mapping.confirm({ select = true }),
	-- ["<Tab>"] = cmp.mapping.select_next_item(),
	-- ["<S-Tab>"] = cmp.mapping.select_prev_item(),

	-- Manually trigger a completion from nvim-cmp.
	--  Generally you don't need this, because nvim-cmp will display
	--  completions whenever it has completion options available.
	["<C-Space>"] = cmp.mapping.complete({}),

	-- Think of <c-l> as moving to the right of your snippet expansion.
	--  So if you have a snippet that's like:
	--  function $name($args)
	--    $body
	--  end
	--
	-- <c-l> will move you to the right of each of the expansion locations.
	-- <c-h> is similar, except moving you backwards.

	-- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
	--    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
})

map.ix({
	["<C-l>"] = function()
		if ls.expand_or_locally_jumpable() then
			ls.expand_or_jump()
		end
	end,
	["<C-h>"] = function()
		if ls.locally_jumpable(-1) then
			ls.jump(-1)
		end
	end,
})
