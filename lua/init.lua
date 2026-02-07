local config = require("config")
local M = {}

function M.setup(cfg)
	if cfg == nil then
		cfg = {}
	end

	config:set(cfg)

	print("config loaded")
end

return M
