vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = vim.keymap.set

-- [[ Basic Keymaps ]]
--  See `:help map()`
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Exit Remap
map("i", "jj", "<Esc>")

-- Diagnostic keymaps

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
map("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
map("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
map("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
map("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')
-- map("n", "w", "k")
-- map("n", "s", "j")
-- map("n", "a", "h")
-- map("n", "d", "l")

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

map("n", "<C-a>", "ggVG")
map({ "n", "i", "x", "s" }, "<C-s>", "<cmd>w<CR>")

map("n", "<leader>l", "<cmd>Lazy<CR>")

vim.api.nvim_create_user_command("Conf", "edit $HOME/.config/nvim/init.lua", { bang = true })

-- Keymap magic move stuff into indents
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- While Moving keep cursor in middle of page
map("n", "<A-d>", "<C-d>zz")
map("n", "<A-u>", "<C-u>zz")

-- While searching keep cursor in middle of page
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Greatest remap ever: Paste while keeping the data in the zero buffer
map("x", "<leader>p", [["_dP]], { desc = "Paste while retaining buffer data" })

-- next greatest remap ever : asbjornHaland Copy to +register
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to + register" })
map("n", "<leader>Y", [["+Y]], { desc = "Yank cursor line to + register" })

-- cool replace all occurances of word in file
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Lf>]])

-- diagnostic
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
local diagnostic_goto = function(next, severity)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ severity = severity })
	end
end
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- better indenting from lazy.nvim
map("v", "<", "<gv")
map("v", ">", ">gv")

map("n", "<leader><leader>", function()
	vim.cmd("so")
end)

-- highlights under cursor
map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
map("n", "<leader>uI", "<cmd>InspectTree<cr>", { desc = "Inspect Tree" })
