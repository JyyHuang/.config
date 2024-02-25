local wezterm = require 'wezterm'

local module = {}

local act = wezterm.action

function module.apply_to_config(config)
    -- timeout_milliseconds defaults to 1000 and can be omitted
    config.leader = { key = 'LeftAlt', mods = 'ALT', timeout_milliseconds = 1000}
    config.keys = {

        {key = '|', mods = 'LEADER|SHIFT', action = act.SplitHorizontal{ domain = 'CurrentPaneDomain' }},
        {key = '-', mods = 'LEADER', action = act.SplitVertical{ domain = 'CurrentPaneDomain' }},
        {key = 'w', mods = 'LEADER', action = act.CloseCurrentPane{confirm = true }},
        {key = 'h', mods = 'LEADER', action = act.ActivatePaneDirection("Left")},
        {key = 'j', mods = 'LEADER', action = act.ActivatePaneDirection("Down")},
        {key = 'k', mods = 'LEADER', action = act.ActivatePaneDirection("Up")},
        {key = 'l', mods = 'LEADER', action = act.ActivatePaneDirection("Right")},
        {key = 'z', mods = 'LEADER', action = act.TogglePaneZoomState},
        {key = 'm', mods = 'LEADER', action = act.Hide},
        {key = 'Enter', mods = 'LEADER', action = act.ToggleFullScreen},
        {key = 'n', mods = 'LEADER', action = act.SpawnWindow},
        {key = 't', mods = 'LEADER', action = act.SpawnTab("CurrentPaneDomain")},
        {key = 'q', mods = 'LEADER', action = act.CloseCurrentTab{confirm = true}},
        {key = '1', mods = 'LEADER', action = act.ActivateTab(0)},
        {key = '2', mods = 'LEADER', action = act.ActivateTab(1)},
        {key = '3', mods = 'LEADER', action = act.ActivateTab(2)},
        {key = '4', mods = 'LEADER', action = act.ActivateTab(3)},
        {key = '5', mods = 'LEADER', action = act.ActivateTab(4)},
        {key = '6', mods = 'LEADER', action = act.ActivateTab(5)},
        {key = '7', mods = 'LEADER', action = act.ActivateTab(6)},
        {key = '8', mods = 'LEADER', action = act.ActivateTab(7)},
        {key = '9', mods = 'LEADER', action = act.ActivateTab(-1)},
        {key = 'f', mods = 'LEADER', action = act.Search{CaseSensitiveString=""}},
        {key = 'c', mods = 'LEADER', action = act.ActivateCopyMode},
        {key = 'LeftArrow', mods = 'LEADER', action = act.AdjustPaneSize{"Left", 5}},
        {key = 'RightArrow', mods = 'LEADER', action = act.AdjustPaneSize{"Right", 5}},
        {key = 'UpArrow', mods = 'LEADER', action = act.AdjustPaneSize{"Up", 5}},
        {key = 'DownArrow', mods = 'LEADER', action = act.AdjustPaneSize{"Down", 5}},



        


    }
        
end

return module
