local wezterm = require 'wezterm'

local module = {}

function module.apply_to_config(config)
 
    -- Color Scheme
    local MEOW = wezterm.color.get_builtin_schemes()['Catppuccin Mocha']
    MEOW.background = '#11111b'
    config.color_schemes = {
        ['Meow'] = MEOW
    }
    config.color_scheme = 'Meow'
    
    config.window_background_opacity = 0.8
    config.window_decorations = 'RESIZE'
    config.window_close_confirmation = 'AlwaysPrompt'

    config.scrollback_lines = 3000

    -- Font
    config.font = wezterm.font('MesloLGS NF')
     
    config.force_reverse_video_cursor = true

    -- Tab Bar

    config.window_frame = {
        font = wezterm.font {family = 'MesloLGS NF'},
        font_size = 10.0,
        active_titlebar_bg = '#11111c',
        inactive_titlebar_bg = '#11111b' 
    }
    
    config.use_fancy_tab_bar = false
    
    config.inactive_pane_hsb = {
      saturation = 0.7,
      brightness = 0.5
    }
  end 

return module
