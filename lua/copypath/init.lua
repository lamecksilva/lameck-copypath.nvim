local config = require("copypath.config")
local api = require("copypath.api")
local M = {}

function M.setup(cfg)
	if cfg == nil then
		cfg = {}
	end

	config:set(cfg)

	vim.api.nvim_create_user_command("CopyAbsolutePath", function()
		local path = api.copy_absolute_path(config:get())
		print("Copied absolute: " .. path)
	end, {
		desc = "Copy absolute path of current file",
	})

	vim.api.nvim_create_user_command("CopyRelativePath", function()
		local path = api.copy_relative_path(config:get())
		print("Copied relative: " .. path)
	end, {
		desc = "Copy relative path of current file",
	})

	vim.api.nvim_create_user_command("CopyPath", function()
		local cf = config:get()

		local path = api.copy_relative_path(cf)
		if cf.default_path == "absolute" then
			path = api.copy_absolute_path(cf)
		end

		print("Copied: " .. path)
	end, {
		desc = "Copy path to clipboard",
	})

	local cfg_final = config:get()

	vim.keymap.set("n", cfg_final.keymap_default, "<cmd>CopyPath<cr>", { desc = "Copy path" })
	vim.keymap.set("n", cfg_final.keymap_absolute, "<cmd>CopyAbsolutePath<cr>", { desc = "Copy absolute path" })
	vim.keymap.set("n", cfg_final.keymap_relative, "<cmd>CopyRelativePath<cr>", { desc = "Copy relative path" })
end

return M
