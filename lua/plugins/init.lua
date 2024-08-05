-- Preload dependencies like plenary and web-devicons

packadd({
	"nvim-lua/plenary.nvim",
	lazy = false,
	priority = 1000, -- plenary is a dependency for a lot of others, so needs to load first
})

packadd({
	"nvim-tree/nvim-web-devicons",
	lazy = false,
	priority = 900, -- needs to be loaded as priority 2
})

--- Needs to be loaded post others
--- Themes to use for Huez
packadd({
	"rebelot/kanagawa.nvim",
	lazy = false,
	priority = 800,
})
packadd({
	"ellisonleao/gruvbox.nvim",
	lazy = false,
	priority = 800,
})
packadd({
	"nyoom-engineering/oxocarbon.nvim",
	lazy = false,
	priority = 800,
})
packadd({
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 800,
})
packadd({
	"rose-pine/neovim",
	as = "rosepine",
	lazy = false,
	priority = 800,
})
packadd({
	"ray-x/aurora",
	lazy = false,
	priority = 800,
})
packadd({
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 800,
})

-- Mason
-- NOTE: Must be loaded before dependants
packadd({
	"williamboman/mason.nvim",
	event = "VimEnter",
	config = true,
})
