local uv, api, fn = vim.uv, vim.api, vim.fn
local pack = {}
pack.__index = pack

function pack:load_modules_packages()
	---@diagnostic disable-next-line: param-type-mismatch
	local modules_dir = vim.fs.joinpath(self.config_path, "lua", "modules")
	self.repos = {}

<<<<<<< HEAD
	require(modules_dir:sub(#modules_dir - 6))

=======
>>>>>>> 4086e70 (feat(rewrite): super fast nvim config)
	local list = vim.fs.find("package.lua", { path = modules_dir, type = "file", limit = 10 })
	if #list == 0 then
		return
	end

	vim.iter(list):map(function(f)
		local _, pos = f:find(modules_dir)
		f = f:sub(pos - 6, #f - 4)
		require(f)
	end)
end

function pack:boot_strap()
	self.data_path = fn.stdpath("data")
	self.config_path = fn.stdpath("config")
	---@diagnostic disable-next-line: param-type-mismatch
	local lazy_path = vim.fs.joinpath(self.data_path, "lazy", "lazy.nvim")
	local state = uv.fs_stat(lazy_path)
	if not state then
		local cmd = "!git clone https://github.com/folke/lazy.nvim " .. lazy_path
		api.nvim_command(cmd)
	end
	vim.opt.runtimepath:prepend(lazy_path)
	self:load_modules_packages()

	require("lazy").setup(self.repos, {
		---@diagnostic disable-next-line: param-type-mismatch
		lockfile = vim.fs.joinpath(self.data_path, "lazy-lock.json"),
<<<<<<< HEAD
		dev = { path = "~/workspace" },
		change_detection = { notify = false },
		defaults = {
			lazy = true,
=======
		dev = { path = "~/personal/workspace" },
		change_detection = { notify = false },
		performance = {
			cache = {
				enabled = true,
			},
			reset_packpath = true, -- reset the package path to improve startup time
			rtp = {
				reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
				---@type string[]
				paths = {}, -- add any custom paths here that you want to includes in the rtp
				---@type string[] list any plugins you want to disable here
				disabled_plugins = {
					"gzip",
					"matchit",
					"matchparen",
					"netrwPlugin",
					"tarPlugin",
					"tohtml",
					-- "tutor",
					"zipPlugin",
				},
			},
>>>>>>> 4086e70 (feat(rewrite): super fast nvim config)
		},
		ui = {
			-- If you are using a Nerd Font: set icons to an empty table which will use the
			-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
			icons = vim.g.have_nerd_font and {} or {
				cmd = "⌘",
				config = "🛠",
				event = "📅",
				ft = "📂",
				init = "⚙",
				keys = "🗝",
				plugin = "🔌",
				runtime = "💻",
				require = "🌙",
				source = "📄",
				start = "🚀",
				task = "📌",
				lazy = "💤 ",
			},
		},
<<<<<<< HEAD
=======
		profiling = {
			-- Enables extra stats on the debug tab related to the loader cache.
			-- Additionally gathers stats about all package.loaders
			loader = true,
			-- Track each new require in the Lazy profiling tab
			require = true,
		},
>>>>>>> 4086e70 (feat(rewrite): super fast nvim config)
	})
end

_G.packadd = function(repo)
	if not pack.repos then
		pack.repos = {}
	end

	pack.repos[#pack.repos + 1] = repo
end

return pack
