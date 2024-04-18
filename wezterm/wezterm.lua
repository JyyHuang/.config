local wezterm = require("wezterm")
local appearance = require("appearance")
local keys = require("keys")
local wallpaper = require("wallpaper")
local mux = wezterm.mux

local config = {}
appearance.apply_to_config(config)
wallpaper.apply_to_config(config)
keys.apply_to_config(config)
--config.initial_cols = 120
--config.initial_rows = 30
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

config.default_domain = "WSL:Ubuntu"
config.wsl_domains = {
	{
		name = "WSL:Ubuntu",

		distribution = "Ubuntu",
		username = "joyjosr",
        default_cwd = "~"
	},
}

return config
