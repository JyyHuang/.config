local wezterm = require("wezterm")
local module = {}

function module.apply_to_config(config)
	local function get_random_entry(tbl)
		local keys = {}
		for key, _ in ipairs(tbl) do
			table.insert(keys, key)
		end
		local randomKey = keys[math.random(1, #keys)]
		return tbl[randomKey]
	end

	local function get_wallpaper(dir)
		local wallpapers = {}
		local dimmer = { brightness = 0.05 }
		for _, v in ipairs(wezterm.glob(dir)) do
			table.insert(wallpapers, v)
		end
		local wallpaper = get_random_entry(wallpapers)
		return {

			source = {
				File = {
					path = wallpaper,
				},
			},
			attachment = "Fixed",
			repeat_x = "NoRepeat",
			repeat_y = "NoRepeat",
			hsb = dimmer,
			vertical_align = "Middle",
			horizontal_align = "Center",
		}
	end

	local wallpaper_dir = wezterm.home_dir .. "/.config/wallpapers/*"
	config.background = {
		get_wallpaper(wallpaper_dir),
	}
end

return module
