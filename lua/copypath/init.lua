local config = require("copypath.config")
local api = require("copypath.api")
local M = {}

function M.setup(cfg)
	if cfg == nil then
		cfg = {}
	end

	config:set(cfg)

	vim.api.nvim_create_user_command("CopyPath", function()
		local path = api.copy_absolute_path(config:get())
		print("Copied " .. path)
	end, {
		desc = "Copy path of current file",
	})
end

return M
