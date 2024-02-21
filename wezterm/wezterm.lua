local wezterm = require 'wezterm'
local appearance = require 'appearance'

local config = {}
appearance.apply_to_config(config)
config.default_domain = 'WSL:Ubuntu'
config.wsl_domains = {
    {
        name = 'WSL:Ubuntu',

        distribution = 'Ubuntu',
        username = "joyjosr",
        
        default_cwd = "/mnt/c/Users/Joey",
        
    },
}




return config
