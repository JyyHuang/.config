local wezterm = require("wezterm")
local module = {}

module.get_random_entry = function(tbl)
    local keys = {}
    for key, _ in ipairs(tbl) do
        table.insert(keys, key)
    end
    local randomKey = keys[math.random(1, #keys)]
    return tbl[randomKey]
end

module.get_wallpaper = function(dir)
    local wallpapers = {}
    local dimmer = { brightness = 0.1 }
    for _, v in ipairs(wezterm.glob(dir)) do
        table.insert(wallpapers, v)
    end
    local wallpaper = module.get_random_entry(wallpapers)
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

return module
