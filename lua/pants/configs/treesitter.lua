local M = {}

M.opts = {
	ensure_installed = {
		{
			"python",
			"bash",
			"lua",
			"luadoc",
			"vim",
			"vimdoc",

			"go",
			"gomod",
			"gosum",
			"gowork",
			"gotmpl",
			"proto",

			"c",
			"cpp",
			"zig",
			"rust",

			"html",
			"typescript",
			"javascript",
			"css",
			"scss",
			"json",
			"jsonc",
			"tsx",
			"graphql",
			"markdown",
			"markdown_inline",
			"yaml",

			"diff",
			"gitignore",
			"cmake",
			"dockerfile",
			"sql",
		},
	},
	auto_install = true,
	autopairs = {
		enable = true,
	},
	autotag = {
		enable = false,
	},
	endwise = {
		enable = true,
	},
	incremental_selection = {
		enable = true, -- use textobjects
		-- disable = {"elm"},
		keymaps = {
			-- mappings for incremental selection (visual mappings)
			init_selection = "gn", -- maps in normal mode to init the node/scope selection
			scope_incremental = "gn", -- increment to the upper scope (as defined in locals.scm)
			node_incremental = "<TAB>", -- increment to the upper named parent
			node_decremental = "<S-TAB>", -- decrement to the previous node
		},
	},
	indent = { enable = true },
	highlight = {
		enable = true,
		use_languagetree = true,
		-- disable = function(_, buf)
		-- 	local max_filesize = 240 * 1024
		-- 	local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
		-- 	if ok and stats and stats.size > max_filesize then
		-- 		return true
		-- 	end
		-- end,
	},
}

M.config = function()
	require("nvim-treesitter.configs").setup(M.opts)
end

return M
