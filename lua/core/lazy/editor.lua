return {
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			local tsc = require("treesitter-context")
			tsc.setup({
				enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
				max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
				min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
				line_numbers = true,
				multiline_threshold = 20, -- Maximum number of lines to show for a single context
				trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
				mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
				-- Separator between context and content. Should be a single character string, like '-'.
				-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
				separator = nil,
				zindex = 20, -- The Z-index of the context window
				on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
			})
		end,
		keys = {
			{
				"<leader>ut",
				function()
					local tsc = require("treesitter-context")
					tsc.toggle()
				end,
				desc = "Toggle Treesitter Context",
			},
		},
	},
	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				default_file_explorer = true,
				columns = {
					"icon",
					"permission",
					"size",
				},
				preview = {
					-- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
					-- min_width and max_width can be a single value or a list of mixed integer/float types.
					-- max_width = {100, 0.8} means "the lesser of 100 columns or 80% of total"
					max_width = 0.9,
					-- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
					min_width = { 40, 0.4 },
					-- optionally define an integer/float for the exact width of the preview window
					width = nil,
					-- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
					-- min_height and max_height can be a single value or a list of mixed integer/float types.
					-- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
					max_height = 0.9,
					-- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
					min_height = { 5, 0.1 },
					-- optionally define an integer/float for the exact height of the preview window
					height = nil,
					border = "rounded",
					win_options = {
						winblend = 0,
					},
					-- Whether the preview window is automatically updated when the cursor is moved
					update_on_cursor_moved = true,
				},
			})
			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		end,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
        -- stylua: ignore
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
	},
	{
		"nvim-telescope/telescope.nvim",
		optional = true,
		opts = function(_, opts)
			local function flash(prompt_bufnr)
				require("flash").jump({
					pattern = "^",
					label = { after = { 0, 0 } },
					search = {
						mode = "search",
						exclude = {
							function(win)
								return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "TelescopeResults"
							end,
						},
					},
					action = function(match)
						local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
						picker:set_selection(match.pos[1] - 1)
					end,
				})
			end
			opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
				mappings = { n = { s = flash }, i = { ["<c-s>"] = flash } },
			})
		end,
	},
}
