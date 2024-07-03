local config = {}

function config.gitsigns()
	require("gitsigns").setup({
		signs = {
			add = { text = "┃" },
			change = { text = "┃" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		signs_staged = {
			add = { text = "┃" },
			change = { text = "┃" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
	})
end

function config.harpoon()
	require("harpoon"):setup({
		menu = {
			width = vim.api.nvim_win_get_buf(0) - 4,
		},
		settings = {
			save_on_toggle = true,
		},
	})
end

return config
