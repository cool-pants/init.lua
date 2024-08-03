local M = {}

M.config = function()
	require("mini.diff").setup()
	require("mini.statusline").setup()
end

M.hipatterns = function()
	local hipatterns = require("mini.hipatterns")
	---@param h number?
	---@param s number?
	---@param l number?
	local hslToHex = function(h, s, l)
		local r, g, b

		if s == 0 then
			r, g, b = l, l, l -- achromatic
		else
			local function hue2rgb(p, q, t)
				if t < 0 then
					t = t + 1
				end
				if t > 1 then
					t = t - 1
				end
				if t < 1 / 6 then
					return p + (q - p) * 6 * t
				end
				if t < 1 / 2 then
					return q
				end
				if t < 2 / 3 then
					return p + (q - p) * (2 / 3 - t) * 6
				end
				return p
			end

			local q
			if l < 0.5 then
				q = l * (1 + s)
			else
				q = l + s - l * s
			end
			local p = 2 * l - q

			r = hue2rgb(p, q, h + 1 / 3)
			g = hue2rgb(p, q, h)
			b = hue2rgb(p, q, h - 1 / 3)
		end

		return string.format("#%02x%02x%02x", r * 255, g * 255, b * 255)
	end
	hipatterns.setup({
		highlighters = {
			-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
			fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
			hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
			todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
			note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

			-- Highlight hex color strings using that color
			-- Highlight test: Catpuccin theme RGB
			-- #f2d5cf #eebebe #f4b8e4 #ca9ee6
			-- #e78284 #ea999c #ef9f76 #e5c890
			-- #a6d189 #81c8be #99d1db #85c1dc
			-- #8caaee #babbf1 #c6d0f5 #b5bfe2
			hex_color = hipatterns.gen_highlighter.hex_color(),
			-- Compute short hexes
			-- #fff, #f0f, #00f, #000
			short_hex_color = {
				pattern = "#%x%x%x%f[%X]",
				group = function(_, match)
					local r, g, b = match:sub(2, 2), match:sub(3, 3), match:sub(4, 4)
					local hex = string.format("#%s%s%s%s%s%s", r, r, g, g, b, b)
					return MiniHipatterns.compute_hex_color_group(hex, "bg")
				end,
			},
			-- Highlight on hsl color strings
			-- Highlight test: Catpuccin theme hsl
			-- hsl(10, 57, 88) hsl(0, 59, 84) hsl(316deg, 73%, 84%) hsl(277deg, 59%, 76%)
			-- hsl(359deg, 68%, 71%) hsl(358deg, 66%, 76%) hsl(20deg, 79%, 70%) hsl(40deg, 62%, 73%)
			-- hsl(96deg, 44%, 68%) hsl(172deg, 39%, 65%) hsl(189deg, 48%, 73%) hsl(199deg, 55%, 69%)
			-- hsl(222deg, 74%, 74%) hsl(239deg, 66%, 84%) hsl(227deg, 70%, 87%) hsl(227deg, 44%, 80%)
			hsl_color = {
				pattern = "hsl%(%d+d?e?g?,? %d+%%?,? %d+%%?%)",
				group = function(_, match)
					---@type string, string, string
					local nh, ns, nl = match:match("hsl%((%d+)d?e?g?,? (%d+)%%?,? (%d+)%%?%)")
					---@type number?, number?, number?hsl%(%d+,? %d+,? %d+%)
					local h, s, l = tonumber(nh), tonumber(ns), tonumber(nl)
					---@type string
					local hex_color = hslToHex(h / 360, s / 100, l / 100)
					return MiniHipatterns.compute_hex_color_group(hex_color, "bg")
				end,
			},
		},
	})
end

return M
