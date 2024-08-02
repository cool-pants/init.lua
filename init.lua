vim.g.mapleader = " "
<<<<<<< HEAD

_G.my_languages_ft = {
	"c",
	"cpp",
	"rust",
	"go",
	"lua",
	"sh",
	"python",
=======
vim.g.maplocalleader = ","

require("pants.options")

_G.languages = {
	"lua",
	"go",
	"gomod",
	"gowork",
	"gotmpl",
	"c",
	"cpp",
	"python",
	"sh",

>>>>>>> 4086e70 (feat(rewrite): super fast nvim config)
	"javascript",
	"javascriptreact",
	"typescript",
	"typescriptreact",
	"json",
<<<<<<< HEAD
}
_G.webdev_languages = {
	"js",
	"jsx",
	"ts",
	"tsx",
=======

>>>>>>> 4086e70 (feat(rewrite): super fast nvim config)
	"html",
	"css",
	"scss",
	"sass",
<<<<<<< HEAD
	"lua",
	"vue",
}

require("core")
require("internal.event")
=======
}

vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		require("pants.keymaps")
		require("pants.autocommands")
	end,
})

-- Loading shada is SLOW, so we're going to load it manually,
-- after UI-enter so it doesn't block startup.
local shada = vim.o.shada
vim.o.shada = ""
vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		vim.o.shada = shada
		pcall(vim.cmd.rshada, { bang = true })
	end,
})

require("core.pack"):boot_strap()

vim.cmd("colorscheme catppuccin-macchiato")
>>>>>>> 4086e70 (feat(rewrite): super fast nvim config)
