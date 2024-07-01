return {
	name = "aurora",
	style = { "default" },
	transparent = false,
	activate = function(_, _)
		vim.cmd.colorscheme("aurora")
	end,
}
