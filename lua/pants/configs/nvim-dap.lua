local M = {}

function M.config()
	local dap = require("dap")
	local dapui = require("dapui")

	local neoconf = require("neoconf")

	dapui.setup()
	require("dap-go").setup()
	local python_src = neoconf.get("dap.python", "python")
	require("dap-python").setup(python_src)

	dap.listeners.before.attach.dapui_config = function()
		dapui.open()
	end
	dap.listeners.before.launch.dapui_config = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated.dapui_config = function()
		dapui.close()
	end
	dap.listeners.before.event_exited.dapui_config = function()
		dapui.close()
	end
end

return M
