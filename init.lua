vim.g.mapleader = " "

_G.my_languages_ft = {
	"c",
	"cpp",
	"rust",
	"go",
	"lua",
	"sh",
	"python",
	"javascript",
	"javascriptreact",
	"typescript",
	"typescriptreact",
	"json",
}
_G.webdev_languages = {
	"js",
	"jsx",
	"ts",
	"tsx",
	"html",
	"css",
	"scss",
	"sass",
	"lua",
	"vue",
}

require("core")
require("internal.event")
