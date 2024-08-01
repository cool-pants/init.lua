local Knight = {}

Knight.draw = {
	[[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
	[[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡆⠀⠀⠀⠀⠀⠀⠀⠀ ]],
	[[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⢀⡤⡀⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀ ]],
	[[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠆⠆⡁⢛⣞⣯⣶⠀⠀⠀⠀⠀⠀⠀⠀ ]],
	[[ ⠀⠀⠀⠀⢾⠂⢠⣴⠀⠀⢀⡀⠠⣲⠿⣯⣜⠀⣠⠀⠀⠀⠀⠀⠀ ]],
	[[ ⠀⠀⠀⠀⢚⣖⡄⢀⢄⣼⣾⣿⡿⢷⡣⡩⡅⠀⠀⠀⠀⠀⠀⠀⠀ ]],
	[[ ⠀⠀⠀⠀⠀⠙⠋⢙⣿⠿⢿⣿⡀⠀⣷⢱⠁⠐⢠⡄⠀⠀⠀⠀⠀ ]],
	[[ ⠀⠀⠀⠀⠀⡤⢀⡈⠥⣀⣈⣿⡿⠟⠃⠠⡀⢻⡾⢇⠀⠀⠀⠀⠀ ]],
	[[ ⠀⠀⠀⢰⠾⠀⡈⢅⣘⠈⠉⠁⠀⠀⠀⠀⠐⢄⠀⢨⠀⠀⠀⠀⠀ ]],
	[[ ⠀⠀⠀⠀⠀⠸⢟⣀⠢⢠⡐⠁⠀⠀⠀⠂⡈⡀⠛⡇⠀⠀⠀⠀⠀ ]],
	[[ ⠀⠀⠀⠀⠀⠈⢸⢀⣱⡮⠃⢀⠊⣉⢄⠘⠈⡡⠀⠀⠀⠀⠀⠀⠀ ]],
	[[ ⠀⠀⠀⠀⠀⠀⠀⠘⠯⣿⡀⠙⠪⠝⠁⠢⠏⠷⢗⠀⠀⠀⠀⠀⠀ ]],
}
Knight.set_hl = function()
	vim.api.nvim_set_hl(0, "I2A0", { fg = "#000000" })
	vim.api.nvim_set_hl(0, "I2A1", { fg = "#46474b" })
	vim.api.nvim_set_hl(0, "I2A2", { fg = "#383940" })
	vim.api.nvim_set_hl(0, "I2A3", { fg = "#7f7f7f" })
	vim.api.nvim_set_hl(0, "I2A4", { fg = "#3e3e3e" })
	vim.api.nvim_set_hl(0, "I2A5", { fg = "#2c2e3c" })
	vim.api.nvim_set_hl(0, "I2A6", { fg = "#e8e8e8" })
	vim.api.nvim_set_hl(0, "I2A7", { fg = "#fefefe" })
	vim.api.nvim_set_hl(0, "I2A8", { fg = "#1a1b23" })
	vim.api.nvim_set_hl(0, "I2A9", { fg = "#020203" })
	vim.api.nvim_set_hl(0, "I2A10", { fg = "#20212b" })
	vim.api.nvim_set_hl(0, "I2A11", { fg = "#333546" })
	vim.api.nvim_set_hl(0, "I2A12", { fg = "#7b7e9b" })
	vim.api.nvim_set_hl(0, "I2A13", { fg = "#7b7e9c" })
	vim.api.nvim_set_hl(0, "I2A14", { fg = "#81828c" })
	vim.api.nvim_set_hl(0, "I2A15", { fg = "#393b4e" })
	vim.api.nvim_set_hl(0, "I2A16", { fg = "#393b4b" })
	vim.api.nvim_set_hl(0, "I2A17", { fg = "#c0c1c5" })
	vim.api.nvim_set_hl(0, "I2A18", { fg = "#ffffff" })
	vim.api.nvim_set_hl(0, "I2A19", { fg = "#1c1d26" })
	vim.api.nvim_set_hl(0, "I2A20", { fg = "#c9c9ce" })
	vim.api.nvim_set_hl(0, "I2A21", { fg = "#393a4a" })
	vim.api.nvim_set_hl(0, "I2A22", { fg = "#787b97" })
	vim.api.nvim_set_hl(0, "I2A23", { fg = "#b7bde3" })
	vim.api.nvim_set_hl(0, "I2A24", { fg = "#3f4151" })
	vim.api.nvim_set_hl(0, "I2A25", { fg = "#4d4e5d" })
	vim.api.nvim_set_hl(0, "I2A26", { fg = "#484a59" })
	vim.api.nvim_set_hl(0, "I2A27", { fg = "#7e7f8a" })
	vim.api.nvim_set_hl(0, "I2A28", { fg = "#b4b4ba" })
	vim.api.nvim_set_hl(0, "I2A29", { fg = "#aaaab1" })
	vim.api.nvim_set_hl(0, "I2A30", { fg = "#d0d0d4" })
	vim.api.nvim_set_hl(0, "I2A31", { fg = "#a8a8b0" })
	vim.api.nvim_set_hl(0, "I2A32", { fg = "#999dc1" })
	vim.api.nvim_set_hl(0, "I2A33", { fg = "#36394b" })
	vim.api.nvim_set_hl(0, "I2A34", { fg = "#5c5e6b" })
	vim.api.nvim_set_hl(0, "I2A35", { fg = "#bbbbc1" })
	vim.api.nvim_set_hl(0, "I2A36", { fg = "#9899a1" })
	vim.api.nvim_set_hl(0, "I2A37", { fg = "#60626f" })
	vim.api.nvim_set_hl(0, "I2A38", { fg = "#9898a0" })
	vim.api.nvim_set_hl(0, "I2A39", { fg = "#d4d4d8" })
	vim.api.nvim_set_hl(0, "I2A40", { fg = "#b9b9bf" })
	vim.api.nvim_set_hl(0, "I2A41", { fg = "#838599" })
	vim.api.nvim_set_hl(0, "I2A42", { fg = "#797c9a" })
	vim.api.nvim_set_hl(0, "I2A43", { fg = "#686b84" })
	vim.api.nvim_set_hl(0, "I2A44", { fg = "#343647" })
	vim.api.nvim_set_hl(0, "I2A45", { fg = "#191a23" })
	vim.api.nvim_set_hl(0, "I2A46", { fg = "#373849" })
	vim.api.nvim_set_hl(0, "I2A47", { fg = "#71737e" })
	vim.api.nvim_set_hl(0, "I2A48", { fg = "#e4e5e7" })
	vim.api.nvim_set_hl(0, "I2A49", { fg = "#868791" })
	vim.api.nvim_set_hl(0, "I2A50", { fg = "#c2c3c8" })
	vim.api.nvim_set_hl(0, "I2A51", { fg = "#6c6d78" })
	vim.api.nvim_set_hl(0, "I2A52", { fg = "#303242" })
	vim.api.nvim_set_hl(0, "I2A53", { fg = "#f5f5fe" })
	vim.api.nvim_set_hl(0, "I2A54", { fg = "#757896" })
	vim.api.nvim_set_hl(0, "I2A55", { fg = "#45475a" })
	vim.api.nvim_set_hl(0, "I2A56", { fg = "#6f728e" })
	vim.api.nvim_set_hl(0, "I2A57", { fg = "#7c7f9c" })
	vim.api.nvim_set_hl(0, "I2A58", { fg = "#36384b" })
	vim.api.nvim_set_hl(0, "I2A59", { fg = "#848590" })
	vim.api.nvim_set_hl(0, "I2A60", { fg = "#6e728c" })
	vim.api.nvim_set_hl(0, "I2A61", { fg = "#6e728d" })
	vim.api.nvim_set_hl(0, "I2A62", { fg = "#656673" })
	vim.api.nvim_set_hl(0, "I2A63", { fg = "#c8c9cd" })
	vim.api.nvim_set_hl(0, "I2A64", { fg = "#d0d1d4" })
	vim.api.nvim_set_hl(0, "I2A65", { fg = "#ecedff" })
	vim.api.nvim_set_hl(0, "I2A66", { fg = "#abadc8" })
	vim.api.nvim_set_hl(0, "I2A67", { fg = "#57596d" })
	vim.api.nvim_set_hl(0, "I2A68", { fg = "#353747" })
	vim.api.nvim_set_hl(0, "I2A69", { fg = "#616377" })
	vim.api.nvim_set_hl(0, "I2A70", { fg = "#646781" })
	vim.api.nvim_set_hl(0, "I2A71", { fg = "#7a7d99" })
	vim.api.nvim_set_hl(0, "I2A72", { fg = "#8e92b1" })
	vim.api.nvim_set_hl(0, "I2A73", { fg = "#717383" })
	vim.api.nvim_set_hl(0, "I2A74", { fg = "#383a4a" })
	vim.api.nvim_set_hl(0, "I2A75", { fg = "#7d7d7f" })
	vim.api.nvim_set_hl(0, "I2A76", { fg = "#46485e" })
	vim.api.nvim_set_hl(0, "I2A77", { fg = "#333647" })
	vim.api.nvim_set_hl(0, "I2A78", { fg = "#717491" })
	vim.api.nvim_set_hl(0, "I2A79", { fg = "#898cab" })
	vim.api.nvim_set_hl(0, "I2A80", { fg = "#c6c9f1" })
	vim.api.nvim_set_hl(0, "I2A81", { fg = "#424353" })
	vim.api.nvim_set_hl(0, "I2A82", { fg = "#545565" })
	vim.api.nvim_set_hl(0, "I2A83", { fg = "#606275" })
	vim.api.nvim_set_hl(0, "I2A84", { fg = "#313344" })
	vim.api.nvim_set_hl(0, "I2A85", { fg = "#303243" })
	vim.api.nvim_set_hl(0, "I2A86", { fg = "#333545" })
	vim.api.nvim_set_hl(0, "I2A87", { fg = "#8184a3" })
	vim.api.nvim_set_hl(0, "I2A88", { fg = "#333446" })
	vim.api.nvim_set_hl(0, "I2A89", { fg = "#646882" })
	vim.api.nvim_set_hl(0, "I2A90", { fg = "#494b60" })
	vim.api.nvim_set_hl(0, "I2A91", { fg = "#393b4d" })
	vim.api.nvim_set_hl(0, "I2A92", { fg = "#8083a2" })
	vim.api.nvim_set_hl(0, "I2A93", { fg = "#bcc0eb" })
	vim.api.nvim_set_hl(0, "I2A94", { fg = "#3a3c4c" })
	vim.api.nvim_set_hl(0, "I2A95", { fg = "#8184a2" })
	vim.api.nvim_set_hl(0, "I2A96", { fg = "#5c5e77" })
	vim.api.nvim_set_hl(0, "I2A97", { fg = "#3b3d50" })
	vim.api.nvim_set_hl(0, "I2A98", { fg = "#3c3e51" })
	vim.api.nvim_set_hl(0, "I2A99", { fg = "#7f82a0" })
	vim.api.nvim_set_hl(0, "I2A100", { fg = "#787b99" })
	vim.api.nvim_set_hl(0, "I2A101", { fg = "#333445" })
	vim.api.nvim_set_hl(0, "I2A102", { fg = "#5d5d5d" })
	vim.api.nvim_set_hl(0, "I2A103", { fg = "#717490" })
	vim.api.nvim_set_hl(0, "I2A104", { fg = "#aaadd5" })
	vim.api.nvim_set_hl(0, "I2A105", { fg = "#737693" })
	vim.api.nvim_set_hl(0, "I2A106", { fg = "#76788b" })
	vim.api.nvim_set_hl(0, "I2A107", { fg = "#424458" })
	vim.api.nvim_set_hl(0, "I2A108", { fg = "#ccd0fe" })
	vim.api.nvim_set_hl(0, "I2A109", { fg = "#656780" })
	vim.api.nvim_set_hl(0, "I2A110", { fg = "#5d5f78" })
	vim.api.nvim_set_hl(0, "I2A111", { fg = "#7e81a1" })
	vim.api.nvim_set_hl(0, "I2A112", { fg = "#2c2e3a" })
	vim.api.nvim_set_hl(0, "I2A113", { fg = "#717494" })
	vim.api.nvim_set_hl(0, "I2A114", { fg = "#404251" })
	vim.api.nvim_set_hl(0, "I2A115", { fg = "#22232e" })
	vim.api.nvim_set_hl(0, "I2A116", { fg = "#1e1f29" })
	vim.api.nvim_set_hl(0, "I2A117", { fg = "#1d1f29" })
	vim.api.nvim_set_hl(0, "I2A118", { fg = "#040506" })
	vim.api.nvim_set_hl(0, "I2A119", { fg = "#202027" })
	vim.api.nvim_set_hl(0, "I2A120", { fg = "#131317" })
	vim.api.nvim_set_hl(0, "I2A121", { fg = "#4a4a4a" })
	return {
		hl = {
			{
				{ "I2A0", 0, 3 },
				{ "I2A0", 3, 6 },
				{ "I2A0", 6, 9 },
				{ "I2A0", 9, 12 },
				{ "I2A0", 12, 15 },
				{ "I2A0", 15, 18 },
				{ "I2A0", 18, 21 },
				{ "I2A0", 21, 24 },
				{ "I2A0", 24, 27 },
				{ "I2A0", 27, 30 },
				{ "I2A0", 30, 33 },
				{ "I2A0", 33, 36 },
				{ "I2A0", 36, 39 },
				{ "I2A0", 39, 42 },
				{ "I2A0", 42, 45 },
				{ "I2A1", 45, 48 },
				{ "I2A0", 48, 51 },
				{ "I2A0", 51, 54 },
				{ "I2A0", 54, 57 },
				{ "I2A0", 57, 60 },
				{ "I2A0", 60, 63 },
				{ "I2A0", 63, 66 },
				{ "I2A0", 66, 69 },
				{ "I2A0", 69, 72 },
				{ "I2A0", 72, 75 },
			},
			{
				{ "I2A0", 0, 3 },
				{ "I2A0", 3, 6 },
				{ "I2A0", 6, 9 },
				{ "I2A0", 9, 12 },
				{ "I2A0", 12, 15 },
				{ "I2A0", 15, 18 },
				{ "I2A0", 18, 21 },
				{ "I2A0", 21, 24 },
				{ "I2A0", 24, 27 },
				{ "I2A0", 27, 30 },
				{ "I2A0", 30, 33 },
				{ "I2A0", 33, 36 },
				{ "I2A0", 36, 39 },
				{ "I2A0", 39, 42 },
				{ "I2A0", 42, 45 },
				{ "I2A2", 45, 48 },
				{ "I2A3", 48, 51 },
				{ "I2A0", 51, 54 },
				{ "I2A0", 54, 57 },
				{ "I2A0", 57, 60 },
				{ "I2A0", 60, 63 },
				{ "I2A0", 63, 66 },
				{ "I2A0", 66, 69 },
				{ "I2A0", 69, 72 },
				{ "I2A0", 72, 75 },
			},
			{
				{ "I2A0", 0, 3 },
				{ "I2A0", 3, 6 },
				{ "I2A0", 6, 9 },
				{ "I2A0", 9, 12 },
				{ "I2A0", 12, 15 },
				{ "I2A0", 15, 18 },
				{ "I2A0", 18, 21 },
				{ "I2A0", 21, 24 },
				{ "I2A0", 24, 27 },
				{ "I2A0", 27, 30 },
				{ "I2A0", 30, 33 },
				{ "I2A4", 33, 36 },
				{ "I2A5", 36, 39 },
				{ "I2A6", 39, 42 },
				{ "I2A0", 42, 45 },
				{ "I2A7", 45, 48 },
				{ "I2A8", 48, 51 },
				{ "I2A0", 51, 54 },
				{ "I2A0", 54, 57 },
				{ "I2A0", 57, 60 },
				{ "I2A0", 60, 63 },
				{ "I2A0", 63, 66 },
				{ "I2A0", 66, 69 },
				{ "I2A0", 69, 72 },
				{ "I2A0", 72, 75 },
			},
			{
				{ "I2A0", 0, 3 },
				{ "I2A0", 3, 6 },
				{ "I2A0", 6, 9 },
				{ "I2A0", 9, 12 },
				{ "I2A0", 12, 15 },
				{ "I2A0", 15, 18 },
				{ "I2A9", 18, 21 },
				{ "I2A10", 21, 24 },
				{ "I2A11", 24, 27 },
				{ "I2A12", 27, 30 },
				{ "I2A13", 30, 33 },
				{ "I2A14", 33, 36 },
				{ "I2A15", 36, 39 },
				{ "I2A16", 39, 42 },
				{ "I2A17", 42, 45 },
				{ "I2A18", 45, 48 },
				{ "I2A18", 48, 51 },
				{ "I2A19", 51, 54 },
				{ "I2A9", 54, 57 },
				{ "I2A0", 57, 60 },
				{ "I2A0", 60, 63 },
				{ "I2A0", 63, 66 },
				{ "I2A0", 66, 69 },
				{ "I2A0", 69, 72 },
				{ "I2A0", 72, 75 },
			},
			{
				{ "I2A0", 0, 3 },
				{ "I2A0", 3, 6 },
				{ "I2A0", 6, 9 },
				{ "I2A0", 9, 12 },
				{ "I2A20", 12, 15 },
				{ "I2A21", 15, 18 },
				{ "I2A22", 18, 21 },
				{ "I2A23", 21, 24 },
				{ "I2A24", 24, 27 },
				{ "I2A11", 27, 30 },
				{ "I2A25", 30, 33 },
				{ "I2A26", 33, 36 },
				{ "I2A27", 36, 39 },
				{ "I2A28", 39, 42 },
				{ "I2A29", 42, 45 },
				{ "I2A30", 45, 48 },
				{ "I2A31", 48, 51 },
				{ "I2A11", 51, 54 },
				{ "I2A32", 54, 57 },
				{ "I2A33", 57, 60 },
				{ "I2A0", 60, 63 },
				{ "I2A0", 63, 66 },
				{ "I2A0", 66, 69 },
				{ "I2A0", 69, 72 },
				{ "I2A0", 72, 75 },
			},
			{
				{ "I2A0", 0, 3 },
				{ "I2A0", 3, 6 },
				{ "I2A0", 6, 9 },
				{ "I2A0", 9, 12 },
				{ "I2A34", 12, 15 },
				{ "I2A35", 15, 18 },
				{ "I2A36", 18, 21 },
				{ "I2A37", 21, 24 },
				{ "I2A38", 24, 27 },
				{ "I2A18", 27, 30 },
				{ "I2A18", 30, 33 },
				{ "I2A18", 33, 36 },
				{ "I2A39", 36, 39 },
				{ "I2A40", 39, 42 },
				{ "I2A41", 42, 45 },
				{ "I2A42", 45, 48 },
				{ "I2A43", 48, 51 },
				{ "I2A11", 51, 54 },
				{ "I2A11", 54, 57 },
				{ "I2A44", 57, 60 },
				{ "I2A44", 60, 63 },
				{ "I2A0", 63, 66 },
				{ "I2A0", 66, 69 },
				{ "I2A0", 69, 72 },
				{ "I2A0", 72, 75 },
			},
			{
				{ "I2A0", 0, 3 },
				{ "I2A0", 3, 6 },
				{ "I2A0", 6, 9 },
				{ "I2A45", 9, 12 },
				{ "I2A46", 12, 15 },
				{ "I2A11", 15, 18 },
				{ "I2A11", 18, 21 },
				{ "I2A47", 21, 24 },
				{ "I2A48", 24, 27 },
				{ "I2A49", 27, 30 },
				{ "I2A50", 30, 33 },
				{ "I2A18", 33, 36 },
				{ "I2A51", 36, 39 },
				{ "I2A52", 39, 42 },
				{ "I2A53", 42, 45 },
				{ "I2A54", 45, 48 },
				{ "I2A11", 48, 51 },
				{ "I2A55", 51, 54 },
				{ "I2A56", 54, 57 },
				{ "I2A57", 57, 60 },
				{ "I2A11", 60, 63 },
				{ "I2A45", 63, 66 },
				{ "I2A0", 66, 69 },
				{ "I2A0", 69, 72 },
				{ "I2A0", 72, 75 },
			},
			{
				{ "I2A0", 0, 3 },
				{ "I2A0", 3, 6 },
				{ "I2A0", 6, 9 },
				{ "I2A45", 9, 12 },
				{ "I2A58", 12, 15 },
				{ "I2A59", 15, 18 },
				{ "I2A60", 18, 21 },
				{ "I2A61", 21, 24 },
				{ "I2A62", 24, 27 },
				{ "I2A63", 27, 30 },
				{ "I2A64", 30, 33 },
				{ "I2A65", 33, 36 },
				{ "I2A66", 36, 39 },
				{ "I2A67", 39, 42 },
				{ "I2A68", 42, 45 },
				{ "I2A69", 45, 48 },
				{ "I2A70", 48, 51 },
				{ "I2A71", 51, 54 },
				{ "I2A72", 54, 57 },
				{ "I2A73", 57, 60 },
				{ "I2A74", 60, 63 },
				{ "I2A45", 63, 66 },
				{ "I2A0", 66, 69 },
				{ "I2A0", 69, 72 },
				{ "I2A0", 72, 75 },
			},
			{
				{ "I2A0", 0, 3 },
				{ "I2A0", 3, 6 },
				{ "I2A0", 6, 9 },
				{ "I2A75", 9, 12 },
				{ "I2A76", 12, 15 },
				{ "I2A77", 15, 18 },
				{ "I2A78", 18, 21 },
				{ "I2A79", 21, 24 },
				{ "I2A80", 24, 27 },
				{ "I2A81", 27, 30 },
				{ "I2A82", 30, 33 },
				{ "I2A83", 33, 36 },
				{ "I2A84", 36, 39 },
				{ "I2A85", 39, 42 },
				{ "I2A85", 42, 45 },
				{ "I2A82", 45, 48 },
				{ "I2A86", 48, 51 },
				{ "I2A87", 51, 54 },
				{ "I2A88", 54, 57 },
				{ "I2A89", 57, 60 },
				{ "I2A90", 60, 63 },
				{ "I2A9", 63, 66 },
				{ "I2A0", 66, 69 },
				{ "I2A0", 69, 72 },
				{ "I2A0", 72, 75 },
			},
			{
				{ "I2A0", 0, 3 },
				{ "I2A0", 3, 6 },
				{ "I2A0", 6, 9 },
				{ "I2A0", 9, 12 },
				{ "I2A0", 12, 15 },
				{ "I2A91", 15, 18 },
				{ "I2A92", 18, 21 },
				{ "I2A93", 21, 24 },
				{ "I2A94", 24, 27 },
				{ "I2A95", 27, 30 },
				{ "I2A96", 30, 33 },
				{ "I2A85", 33, 36 },
				{ "I2A33", 36, 39 },
				{ "I2A97", 39, 42 },
				{ "I2A85", 42, 45 },
				{ "I2A98", 45, 48 },
				{ "I2A99", 48, 51 },
				{ "I2A100", 51, 54 },
				{ "I2A101", 54, 57 },
				{ "I2A78", 57, 60 },
				{ "I2A0", 60, 63 },
				{ "I2A0", 63, 66 },
				{ "I2A0", 66, 69 },
				{ "I2A0", 69, 72 },
				{ "I2A0", 72, 75 },
			},
			{
				{ "I2A0", 0, 3 },
				{ "I2A0", 3, 6 },
				{ "I2A0", 6, 9 },
				{ "I2A0", 9, 12 },
				{ "I2A0", 12, 15 },
				{ "I2A0", 15, 18 },
				{ "I2A102", 18, 21 },
				{ "I2A103", 21, 24 },
				{ "I2A104", 24, 27 },
				{ "I2A105", 27, 30 },
				{ "I2A85", 30, 33 },
				{ "I2A106", 33, 36 },
				{ "I2A107", 36, 39 },
				{ "I2A108", 39, 42 },
				{ "I2A109", 42, 45 },
				{ "I2A85", 45, 48 },
				{ "I2A110", 48, 51 },
				{ "I2A111", 51, 54 },
				{ "I2A112", 54, 57 },
				{ "I2A0", 57, 60 },
				{ "I2A0", 60, 63 },
				{ "I2A0", 63, 66 },
				{ "I2A0", 66, 69 },
				{ "I2A0", 69, 72 },
				{ "I2A0", 72, 75 },
			},
			{
				{ "I2A0", 0, 3 },
				{ "I2A0", 3, 6 },
				{ "I2A0", 6, 9 },
				{ "I2A0", 9, 12 },
				{ "I2A0", 12, 15 },
				{ "I2A0", 15, 18 },
				{ "I2A0", 18, 21 },
				{ "I2A0", 21, 24 },
				{ "I2A0", 24, 27 },
				{ "I2A113", 27, 30 },
				{ "I2A114", 30, 33 },
				{ "I2A115", 33, 36 },
				{ "I2A116", 36, 39 },
				{ "I2A117", 39, 42 },
				{ "I2A118", 42, 45 },
				{ "I2A0", 45, 48 },
				{ "I2A119", 48, 51 },
				{ "I2A120", 51, 54 },
				{ "I2A121", 54, 57 },
				{ "I2A0", 57, 60 },
				{ "I2A0", 60, 63 },
				{ "I2A0", 63, 66 },
				{ "I2A0", 66, 69 },
				{ "I2A0", 69, 72 },
				{ "I2A0", 72, 75 },
			},
		},
	}
end

return Knight
