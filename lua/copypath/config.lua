---@class CopypathConfig
---@field register? string Vim register to use (default: "+")
---@field default_path? "absolute"|"relative" Default path type (default: "absolute")
---@field keymap_default? string Keymap for default copy (default: "<leader>cp")
---@field keymap_absolute? string Keymap for absolute path (default: "<leader>cpa")
---@field keymap_relative? string Keymap for relative path (default: "<leader>cpr")

local Config = {}

---@type CopypathConfig
Config.config = {
	register = "+",
	keymap_default = "<leader>cpp",
	keymap_absolute = "<leader>cpa",
	keymap_relative = "<leader>cpr",
	default_path = "absolute",
}

function Config:get()
	return self.config
end

function Config:set(cfg)
	if cfg.default_path and cfg.default_path ~= "absolute" and cfg.default_path ~= "relative" then
		error("default must be 'absolute' or 'relative'")
	end
	self.config = vim.tbl_deep_extend("force", self.config, cfg)
end

return Config
