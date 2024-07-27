local LinesOfCoke = {}

local ns = vim.api.nvim_create_namespace("cokeline_diagnostics")

local Icons = require("core.icons")

LinesOfCoke.Colors = {
	active_bg = "#f4b8e4",
	active_fg = "#000000",
	inactive_bg = "#303446",
	inactive_fg = "#ffffff",
	error_fg = "#d20f39",
	warning_fg = "#e5c890",
	corners_bg = require("cokeline.hlgroups").get_hl_attr("Normal", "bg"),
}

LinesOfCoke.UniquePrefix = {
	text = function(buffer)
		return buffer.unique_prefix
	end,
	truncation = {
		priority = 3,
		direction = "left",
	},
}
LinesOfCoke.Filename = {
	text = function(buffer)
		return buffer.filename .. " "
	end,
	bold = function(buffer)
		return buffer.is_focused
	end,
	underline = function(buffer)
		return buffer.is_hovered and not buffer.is_focused
	end,
	-- bg = groups.bg,
	truncation = {
		priority = 2,
		direction = "right",
	},
}

local function create_popup()
	local Popup = require("nui.popup")

	return Popup({
		enter = false,
		focusable = false,
		border = {
			style = { " ", " ", " ", " ", " ", " ", " ", " " },
		},
		position = {
			row = 1,
			col = 0,
		},
		relative = "editor",
		size = {
			width = 20,
			height = 1,
		},
	})
end

---@type Component
local Diagnostics
Diagnostics = {
	text = function(buffer)
		return (buffer.diagnostics.errors ~= 0 and Icons.diagnostics.errors .. " " .. buffer.diagnostics.errors .. " ")
			or (buffer.diagnostics.warnings ~= 0 and Icons.diagnostics.warnings .. " " .. buffer.diagnostics.warnings .. " ")
			or ""
	end,
	fg = function(buffer)
		return (buffer.diagnostics.errors ~= 0 and LinesOfCoke.Colors.error_fg)
			or (buffer.diagnostics.warnings ~= 0 and LinesOfCoke.Colors.warning_fg)
			or ""
	end,
	on_mouse_enter = function(buffer, mouse_col)
		local text = {}
		local width = 0
		if buffer.diagnostics.errors > 0 then
			table.insert(text, {
				Icons.diagnostics.errors .. " " .. buffer.diagnostics.errors .. " ",
				"DiagnosticSignError",
			})
			width = width + #tostring(buffer.diagnostics.errors) + 3
		end
		if buffer.diagnostics.warnings > 0 then
			table.insert(text, {
				Icons.diagnostics.warnings .. " " .. buffer.diagnostics.warnings .. " ",
				"DiagnosticSignWarn",
			})
			width = width + #tostring(buffer.diagnostics.warnings) + 3
		end
		if buffer.diagnostics.infos > 0 then
			table.insert(text, {
				Icons.diagnostics.info .. " " .. buffer.diagnostics.infos .. " ",
				"DiagnosticSignInfo",
			})
			width = width + #tostring(buffer.diagnostics.infos) + 3
		end
		if buffer.diagnostics.hints > 0 then
			table.insert(text, {
				Icons.diagnostics.hints .. " " .. buffer.diagnostics.hints .. " ",
				"DiagnosticSignpint",
			})
			width = width + #tostring(buffer.diagnostics.hints) + 3
		end
		Diagnostics.popup = Diagnostics.popup or create_popup()
		Diagnostics.popup.win_config.width = width - 1
		Diagnostics.popup.win_config.col = mouse_col - 1
		Diagnostics.popup:mount()
		if not Diagnostics.popup.bufnr then
			return
		end
		vim.api.nvim_buf_set_extmark(Diagnostics.popup.bufnr, ns, 0, 0, {
			id = 1,
			virt_text = text,
			virt_text_pos = "overlay",
		})
	end,
	on_mouse_leave = function()
		if Diagnostics.popup then
			Diagnostics.popup:unmount()
		end
	end,
}

LinesOfCoke.Diagnostics = Diagnostics

return LinesOfCoke
