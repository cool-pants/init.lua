-- =========================================
-- Cross-Platform Keymaps
-- Universal bindings for Linux/macOS/Windows
-- =========================================

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- =========================================
-- Basic Editor
-- =========================================

-- Clear search highlights
map("n", "<Esc>", "<cmd>nohlsearch<cr>", opts)

-- Save file
map({ "n", "i" }, "<C-s>", "<cmd>write<cr>", opts)

-- Quit
map("n", "<leader>q", "<cmd>quit<cr>", opts)
map("n", "<leader>Q", "<cmd>qall<cr>", opts)

-- Select all
map("n", "<C-a>", "ggVG", opts)

-- =========================================
-- Movement & Navigation
-- =========================================

-- Window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Resize windows
map("n", "<C-Up>", "<cmd>resize +2<cr>", opts)
map("n", "<C-Down>", "<cmd>resize -2<cr>", opts)
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", opts)
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", opts)

-- Better scrolling - keep cursor centered
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- Move lines up/down
map("n", "<A-j>", "<cmd>m .+1<cr>==", opts)
map("n", "<A-k>", "<cmd>m .-2<cr>==", opts)
map("v", "<A-j>", ":m '>+1<cr>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<cr>gv=gv", opts)

-- =========================================
-- Editing
-- =========================================

-- Better indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Paste without overwriting register
map("x", "<leader>p", [["_dP]], opts)

-- Delete without yanking
map({ "n", "v" }, "<leader>d", [["_d]], opts)

-- Yank to system clipboard
map({ "n", "v" }, "<leader>y", [["+y]], opts)
map("n", "<leader>Y", [["+Y]], opts)

-- Replace word under cursor
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)

-- =========================================
-- File Management
-- =========================================

-- File explorer
map("n", "<C-n>", "<cmd>Oil<cr>", opts)
map("n", "<leader>e", "<cmd>Oil<cr>", opts)

-- =========================================
-- Search & Telescope
-- =========================================

-- Find files
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", opts)
map("n", "<leader>fs", "<cmd>Telescope grep_string<cr>", opts)

-- Git integration
map("n", "<leader>gf", "<cmd>Telescope git_files<cr>", opts)
map("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", opts)
map("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", opts)
map("n", "<leader>gs", "<cmd>Telescope git_status<cr>", opts)

-- =========================================
-- LSP Keymaps (set in lsp.lua)
-- =========================================

-- Note: LSP keymaps are defined in lsp.lua when LSP attaches
-- to avoid conflicts and ensure they're only active when LSP is available

-- =========================================
-- Buffer Management
-- =========================================

-- Buffer navigation
map("n", "<leader>bn", "<cmd>bnext<cr>", opts)
map("n", "<leader>bp", "<cmd>bprevious<cr>", opts)
map("n", "<leader>bd", "<cmd>bdelete<cr>", opts)

-- =========================================
-- Utility
-- =========================================

-- Toggle wrap
map("n", "<leader>w", "<cmd>set wrap!<cr>", opts)

-- Reload configuration
map("n", "<leader>r", "<cmd>source %<cr>", opts)

-- Open Lazy plugin manager
map("n", "<leader>l", "<cmd>Lazy<cr>", opts)

-- Open Mason
map("n", "<leader>m", "<cmd>Mason<cr>", opts)

-- =========================================
-- Insert Mode Improvements
-- =========================================

-- Exit insert mode
map("i", "jk", "<Esc>", opts)
map("i", "kj", "<Esc>", opts)

-- Insert mode navigation
map("i", "<C-h>", "<Left>", opts)
map("i", "<C-j>", "<Down>", opts)
map("i", "<C-k>", "<Up>", opts)
map("i", "<C-l>", "<Right>", opts)

-- Insert new lines
map("i", "<C-o>", "<C-o>o", opts)

-- =========================================
-- Command Mode
-- =========================================

-- Command mode navigation
map("c", "<C-h>", "<Left>", opts)
map("c", "<C-l>", "<Right>", opts)
map("c", "<C-j>", "<Down>", opts)
map("c", "<C-k>", "<Up>", opts)
