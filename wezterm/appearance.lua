local wezterm = require 'wezterm'

local module = {}

function module.apply_to_config(config)
    local bg_color = '#11111B'
    -- Color Scheme
    local MEOW = wezterm.color.get_builtin_schemes()['Catppuccin Mocha']
    MEOW.background = bg_color
    config.color_schemes = {
        ['Meow'] = MEOW
    }
    config.color_scheme = 'Meow'
    
    config.window_background_opacity = 0.8
    config.window_decorations = "RESIZE"
    config.window_close_confirmation = 'AlwaysPrompt'

    config.scrollback_lines = 3000

    -- Font
    config.font = wezterm.font('MesloLGS NF')
     
    config.force_reverse_video_cursor = true

    -- Tab Bar
    local SOLID_LEFT_ARROW = ''
    local SOLID_LEFT_MOST = utf8.char(0x2588)
    local SOLID_RIGHT_ARROW = utf8.char(0xe0bc)
    -- Equivalent to POSIX basename(3)
    -- Given "/foo/bar" returns "bar"
    -- Given "c:\\foo\\bar" returns "bar"
    function basename(s)
        return string.gsub(s, '(.*[/\\])(.*)', '%2')
    end

    wezterm.on(
        'format-tab-title',
        function(tab,tabs,panes,config, hover, max_width)
            
            local background = '#45475a'
            local foreground = '#f38ba8'

            if tab.is_active then
                background = '#1e1e2e'
            elseif hover then
                background = '#313244'
                foreground = '#b4befe'
            end

            local pane = tab.active_pane
            local title = basename(pane.foreground_process_name)
            -- ensure that the titles fit in the available space,
            -- and that we have room for the edges.
            title = wezterm.truncate_right(title, max_width - 2)

            return {
                {Background = {Color = background}},
                {Foreground = {Color = bg_color}},
                {Text = SOLID_RIGHT_ARROW .. ' '},
                {Background = {Color = background}},
                {Foreground = {Color = foreground}},
                {Text = title},
                {Background = {Color = background}},
                {Foreground = {Color = bg_color}},
                {Text = ' ' .. SOLID_LEFT_ARROW},
            }
        end)

    config.window_frame = {
        font = wezterm.font {family = 'MesloLGS NF'},
        font_size = 11.0,
        active_titlebar_bg = '#11111c',
        inactive_titlebar_bg = bg_color 
    }

    config.use_fancy_tab_bar = false


    wezterm.on("update-status", function(window, pane)
        
        local cwd = pane:get_current_working_dir().file_path
        local time = wezterm.strftime("%a %b %-d %I:%M %p")

        window:set_right_status(wezterm.format({
            { Background = {Color = bg_color} },
            { Foreground = {Color = '#1e1e2e' }},
            { Text = ''},
            { Background = {Color = '#1e1e2e' }},
            { Foreground = {Color = '#cba6f7' }},
            { Text = ' ' .. wezterm.nerdfonts.custom_folder_open},
            { Text = ' ~'},
            { Text = cwd .. ' '},
            { Foreground = {Color = '#313244' }},
            { Text = ''},
            { Background = {Color = '#313244'}},
            { Foreground = {Color = '#f2cdcd'}},   
            { Text = ' ' .. wezterm.nerdfonts.fa_calendar .. ' ' .. time .. ' '}
        }))
    
    end)

    config.inactive_pane_hsb = {
      saturation = 0.7,
      brightness = 0.5
    }



    
  end 

return module
