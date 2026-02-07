local Config = {}

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
