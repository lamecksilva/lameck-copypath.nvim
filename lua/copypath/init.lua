local config = require("copypath.config")
local api = require("copypath.api")
local M = {}

---@param cfg CopypathConfig?
function M.setup(cfg)
	if cfg == nil then
		cfg = {}
	end

	config:set(cfg)
	local cf = config:get()

	vim.api.nvim_create_user_command("CopyAbsolutePath", function()
		local path = api.copy_absolute_path(cf)
		print("Copied absolute: " .. path)
	end, {
		desc = "Copy absolute path of current file",
	})

	vim.api.nvim_create_user_command("CopyRelativePath", function()
		local path = api.copy_relative_path(cf)
		print("Copied relative: " .. path)
	end, {
		desc = "Copy relative path of current file",
	})

	vim.api.nvim_create_user_command("CopyPath", function()
		local current_cfg = config:get()
		local path = current_cfg.default_path == "absolute" and api.copy_absolute_path(current_cfg)
			or api.copy_relative_path(current_cfg)
		print("Copied: " .. path)
	end, {
		desc = "Copy path to clipboard",
	})

	vim.keymap.set("n", cf.keymap_default, "<cmd>CopyPath<cr>", { desc = "Copy path" })
	vim.keymap.set("n", cf.keymap_absolute, "<cmd>CopyAbsolutePath<cr>", { desc = "Copy absolute path" })
	vim.keymap.set("n", cf.keymap_relative, "<cmd>CopyRelativePath<cr>", { desc = "Copy relative path" })
end

return M
