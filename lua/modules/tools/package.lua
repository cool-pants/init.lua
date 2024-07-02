local conf = require("modules.tools.config")

packadd({
	"tpope/vim-fugitive",
})

packadd({
	"tpope/vim-dadbod",
})

packadd({
	"kristijanhusak/vim-dadbod-completion",
})

packadd({
	"kristijanhusak/vim-dadbod-ui",
})

packadd({
	"lewis6991/gitsigns.nvim",
	config = conf.gitsigns,
})

packadd({
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	config = conf.harpoon,
})
