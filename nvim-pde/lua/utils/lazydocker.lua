local M = {}

local Terminal = require("toggleterm.terminal").Terminal

local docker_tui = "lazydocker"
local docker_tui_client = Terminal:new({
	cmd = docker_tui,
	hidden = true,
	direction = "float",
	float_opts = {
		border = "double",
	},
})

function M.lazydocker_toggle()
	docker_tui_client:toggle()
end

return M
