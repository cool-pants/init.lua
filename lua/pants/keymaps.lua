local cmd = function(str)
    return "<Cmd>" .. str .. "<cr>"
end

local fn = function(exec)
    return function()
        exec()
    end
end

local map = function(mode, mappings, opts)
    for key, value in pairs(mappings) do
        if type(value) == "table" then
            vim.keymap.set(mode, key, value[1], opts)
        else
            vim.keymap.set(mode, key, value --[[@as string|function]], opts)
        end
    end
end

local teleBuiltins = require("telescope.builtin")
local diagnostic_goto = function(next, severity)
    local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
    severity = severity and vim.diagnostic.severity[severity] or nil
    return function()
        go({ severity = severity })
    end
end

local flash = require("flash")
local dap = require("dap")

map({ "n", "v" }, {
    -- Greatest remap courtesy : asbjornHaland. Yank to clipboard
    ["<leader>y"] = [["+y]],
})

map("n", {
    ["<leader><leader>"] = { cmd("so") },

    -- basic
    ["<Esc>"] = { cmd("nohlsearch") }, -- remove search highlights
    ["<C-s>"] = { cmd("write") },

    -- Editing
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

    -- Treesitter
    -- highlights under cursor
    ["<leader>ui"] = vim.show_pos,
    ["<leader>uI"] = "<cmd>InspectTree<cr>",

    -- Lazy
    ["<leader>l"] = { cmd("Lazy") },

    -- Telescope
    ["<leader>ff"] = { cmd("Telescope find_files find_command=rg,--ignore,--hidden,--files") },
    ["<leader>fa"] = { cmd("Telescope live_grep") },
    ["<leader>fs"] = { cmd("Telescope grep_string") },
    ["<leader>th"] = { cmd("Telescope help_tags") },

    -- Neotree
    ["<C-n>"] = { cmd("Neotree filesystem reveal right toggle") },
    ["<leader>e"] = { cmd("Neotree reveal focus right") },

    -- Oil
    ["-"] = { cmd("Oil") },

    -- LSP
    ["gd"] = teleBuiltins.lsp_definitions,
    ["gR"] = teleBuiltins.lsp_references,
    ["gI"] = teleBuiltins.lsp_implementations,
    ["<Leader>rn"] = vim.lsp.buf.rename,
    ["<Leader>ca"] = vim.lsp.buf.code_action,
    ["<Leader>dw"] = cmd("show_workspace_diagnostics"),
    ["<leader>q"] = vim.diagnostic.setloclist,
    ["<leader>cd"] = vim.diagnostic.open_float,
    ["]d"] = diagnostic_goto(true),
    ["[d"] = diagnostic_goto(false),
    ["]e"] = diagnostic_goto(true, "ERROR"),
    ["[e"] = diagnostic_goto(false, "ERROR"),
    ["]w"] = diagnostic_goto(true, "WARN"),
    ["[w"] = diagnostic_goto(false, "WARN"),

    -- Lspsaga
    ["K"] = cmd("Lspsaga hover_doc"),
    ["ga"] = cmd("Lspsaga code_action"),
    ["grn"] = cmd("Lspsaga rename"),
    ["gD"] = cmd("Lspsaga peek_definition"),
    ["gr"] = cmd("Lspsaga finder"),
    ["gri"] = cmd("Lspsaga finder imp"),
    ["<Leader>o"] = cmd("Lspsaga outline"),
    ["<localleader>db"] = cmd("Lspsaga show_buf_diagnostics"),

    -- Trouble
    ["<Leader>xx"] = cmd("Trouble diagnostics toggle"),
    ["<Leader>xX"] = cmd("Trouble diagnostics toggle filter.buf=0"),
    ["<Leader>cs"] = cmd("Trouble symbols toggle focus=false"),
    ["<Leader>cl"] = cmd("Trouble lsp toggle focus=false win.position=right"),
    ["<Leader>xL"] = cmd("Trouble loclist toggle"),
    ["<Leader>xQ"] = cmd("Trouble qflist toggle"),

    -- Fugitive
    ["<Leader>gs"] = cmd("Git"),
    ["gu"] = cmd("diffget //2"),
    ["gh"] = cmd("diffget //3"),

    -- Gitsigns
    ["<Leader>gn"] = cmd("Gitsigns next_hunk"),
    ["<Leader>gp"] = cmd("Gitsigns prev_hunk"),
    ["<Leader>gP"] = cmd("Gitsigns preview_hunk_inline"),

    -- Harpoon
    ["<Leader>H"] = function()
        require("harpoon"):list():add()
    end,
    ["<Leader>h"] = function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
    end,

    -- Dadbod DB
    ["<Leader>db"] = cmd("DBUI"),

    -- NVIM DAP
    ["<Leader>b"] = dap.toggle_breakpoint,
    ["<Leader>B"] = dap.set_breakpoint,
    ["<Leader>lp"] = function()
        require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
    end,
    ["<F5>"] = fn(dap.continue),
    ["<F10>"] = fn(dap.step_over),
    ["<F11>"] = fn(dap.step_into),
    ["<F12>"] = fn(dap.step_out),

    -- Flash
    ["s"] = function()
        flash.jump()
    end,
    ["S"] = function()
        flash.treesitter()
    end,
})

local harpoonKeys = {}
local harpoon = require("harpoon")

for i = 1, 5 do
    harpoonKeys["<Leader>" .. i] = function()
        harpoon:list():select(i)
    end
end

map("n", harpoonKeys)

map("i", {
    ["<C-s>"] = cmd("write"),

    ["<C-d>"] = "<C-o>ciw",
    -- insert down/up
    ["<C-j>"] = "<C-o>o",
    ["<C-k>"] = "<C-o>O",
    --@see https://github.com/neovim/neovim/issues/16416
    ["<C-C>"] = "<C-C>", -- exit insert mode usin Ctrl-c

    -- Magic motions to move stuff around
    ["<A-j>"] = "<esc><cmd>m .+1<cr>==gi",
    ["<A-k>"] = "<esc><cmd>m .-2<cr>==gi",
})

map("v", {
    ["<A-j>"] = ":m '>+1<cr>gv=gv",
    ["<A-k>"] = ":m '<-2<cr>gv=gv",
    ["<"] = "<gv",
    [">"] = ">gv",
})

map("x", {
    -- Greatest remap ever!! Paste while keeping current data in bufr
    ["<leader>p"] = [["_dP]],
})

-- Completion
local cmp = require("cmp")

map("i", {
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

local ls = require("luasnip")
map({ "i", "x" }, {
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
