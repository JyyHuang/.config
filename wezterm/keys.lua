local wezterm = require("wezterm")

local module = {}

local act = wezterm.action

function module.apply_to_config(config)
  -- timeout_milliseconds defaults to 1000 and can be omitted

  config.leader = { key = "LeftAlt", mods = "ALT", timeout_milliseconds = 1000 }
  config.keys = {
    { key = "|", mods = "LEADER|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
    { key = "-", mods = "LEADER",       action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
    { key = "w", mods = "LEADER",       action = act.CloseCurrentPane({ confirm = true }) },
    { key = "q", mods = "LEADER",       action = act.CloseCurrentTab({ confirm = true }) },

    {
      key = "a",
      mods = "LEADER",
      action = act.ActivateKeyTable({
        name = "activate_pane",
        one_shot = false,
        until_unknown = true,
        timeout_milliseconds = 1000,
        replace_current = true,
      }),
    },

    { key = "z",     mods = "LEADER", action = act.TogglePaneZoomState },
    { key = "Enter", mods = "LEADER", action = act.ToggleFullScreen },
    { key = "n",     mods = "LEADER", action = act.SpawnWindow },
    { key = "t",     mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
    { key = "1",     mods = "LEADER", action = act.ActivateTab(0) },
    { key = "2",     mods = "LEADER", action = act.ActivateTab(1) },
    { key = "3",     mods = "LEADER", action = act.ActivateTab(2) },
    { key = "4",     mods = "LEADER", action = act.ActivateTab(3) },
    { key = "5",     mods = "LEADER", action = act.ActivateTab(4) },
    { key = "6",     mods = "LEADER", action = act.ActivateTab(5) },
    { key = "7",     mods = "LEADER", action = act.ActivateTab(6) },
    { key = "8",     mods = "LEADER", action = act.ActivateTab(7) },
    { key = "9",     mods = "LEADER", action = act.ActivateTab(-1) },
    { key = "f",     mods = "LEADER", action = act.Search({ CaseSensitiveString = "" }) },
    { key = "x",     mods = "LEADER", action = act.ActivateCopyMode },

    {
      key = ";",
      mods = "LEADER",
      action = act.MoveTabRelative(-1),
    },

    {
      key = "'",
      mods = "LEADER",
      action = act.MoveTabRelative(1),
    },

    {
      key = "s",
      mods = "LEADER",
      action = act.ActivateKeyTable({
        name = "size_pane",
        one_shot = false,
        until_unknown = true,
        timeout_milliseconds = 1000,
        replace_current = true,
      }),
    },
    {
      key = "r",
      mods = "LEADER",
      action = wezterm.action.ReloadConfiguration,
    },
    {
      key = "b",
      mods = "LEADER",
      action = wezterm.action.EmitEvent("toggle-background"),
    },
  }

  config.key_tables = {
    activate_pane = {
      { key = "h",      action = act.ActivatePaneDirection("Left") },
      { key = "j",      action = act.ActivatePaneDirection("Down") },
      { key = "k",      action = act.ActivatePaneDirection("Up") },
      { key = "l",      action = act.ActivatePaneDirection("Right") },
      { key = "Escape", action = "PopKeyTable" },
    },
    size_pane = {
      { key = "h",      action = act.AdjustPaneSize({ "Left", 5 }) },
      { key = "l",      action = act.AdjustPaneSize({ "Right", 5 }) },
      { key = "k",      action = act.AdjustPaneSize({ "Up", 5 }) },
      { key = "j",      action = act.AdjustPaneSize({ "Down", 5 }) },
      { key = "Escape", action = "PopKeyTable" },
    },
  }
end

return module
