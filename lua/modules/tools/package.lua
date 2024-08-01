local conf = require("modules.tools.config")

packadd({
	"tpope/vim-fugitive",
	cmd = { "Git" },
})

packadd({
	"tpope/vim-dadbod",
	event = "VeryLazy",
})

packadd({
	"kristijanhusak/vim-dadbod-completion",
	event = "VeryLazy",
})

packadd({
	"kristijanhusak/vim-dadbod-ui",
	event = "VeryLazy",
})

packadd({
	"lewis6991/gitsigns.nvim",
	config = conf.gitsigns,
	event = "BufEnter",
})

packadd({
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	event = "VeryLazy",
	config = conf.harpoon,
})
