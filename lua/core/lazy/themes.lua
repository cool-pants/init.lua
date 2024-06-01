return {
	{
		"cool-pants/themify",
		-- "themify",
		-- dir = "~/personal/themify",
		dependencies = {
			"rebelot/kanagawa.nvim",
			"ellisonleao/gruvbox.nvim",
			"nyoom-engineering/oxocarbon.nvim",
			"folke/tokyonight.nvim",
			"rose-pine/neovim",
		},
		config = function()
			local themes = require("themify").setup({
				modDir = os.getenv("HOME") .. "/.config/nvim/lua/themes/",
				themesModPath = "themes.",
				cachePath = "/tmp/nvim.mainak/current.th",
				defaultTheme = "gruvbox",
			})
			themes.get_current_theme()
			vim.keymap.set(
				"n",
				"<leader>T",
				themes.select_theme_telescope,
				{ desc = "Select [T]heme from installed and configured" }
			)
			vim.api.nvim_create_user_command("ThemifySync", "lua require('themify').reload_config()", { bang = true })
		end,
	},
}
