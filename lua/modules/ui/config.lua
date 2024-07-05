local config = {}

function config.lualine()
	require("lualine").setup({
		options = {
			icons_enabled = true,
			theme = "palenight",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = {
				statusline = {},
				winbar = {},
			},
			ignore_focus = {},
			always_divide_middle = true,
			globalstatus = false,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			},
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = { "filename" },
			lualine_x = { "encoding", "fileformat", "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {},
	})
end

function config.which_key(_, opts)
	require("which-key").setup()

	-- Document existing key chains
	require("which-key").register({
		["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
		["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
		["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
		["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
		["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
		["<leader>t"] = { name = "[T]oggle", _ = "which_key_ignore" },
	})
	-- visual mode
	require("which-key").register({
		["<leader>h"] = { "Git [H]unk" },
	}, { mode = "v" })
	require("which-key").register(opts.defaults)
end

function config.themify()
	require("themify").setup({})
	local themifyconf = require("themify.config")

	themifyconf["rose-pine"] = require("modules.themes.rosepine").get_conf(true)
	themifyconf["rose-pine-moon"] = require("modules.themes.rosepine").get_conf(true)
	themifyconf["rose-pine-main"] = require("modules.themes.rosepine").get_conf(true)
	themifyconf["rose-pine-dawn"] = require("modules.themes.rosepine").get_conf(false)

	themifyconf["tokyonight"] = require("modules.themes.tokyonight").get_conf()
	themifyconf["tokyonight-day"] = require("modules.themes.tokyonight").get_conf()
	themifyconf["tokyonight-moon"] = require("modules.themes.tokyonight").get_conf()
	themifyconf["tokyonight-night"] = require("modules.themes.tokyonight").get_conf()
	themifyconf["tokyonight-storm"] = require("modules.themes.tokyonight").get_conf()

	themifyconf.handle_theme_on_setup()
end

return config
