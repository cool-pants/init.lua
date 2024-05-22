return {
	{
		"vhyrro/luarocks.nvim",
		priority = 1000,
		config = function()
			require("luarocks-nvim").setup({})
		end,
	},
	{
		"nvim-neorg/neorg",
		dependencies = { "luarocks.nvim" },
		-- put any other flags you wanted to pass to lazy here!
		config = function()
			require("neorg").setup()
		end,
	},
}
