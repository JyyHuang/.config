local wezterm = require("wezterm")

local module = {}
function module.apply_to_config(config)
  local bg_color = "#11111B"
  --Color Scheme
  local MEOW = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
  MEOW.background = bg_color
  config.color_schemes = {
    ["Meow"] = MEOW,
  }
  config.color_scheme = "Meow"

  config.window_decorations = "RESIZE"
  config.window_close_confirmation = "AlwaysPrompt"

  config.tab_max_width = 50
  config.scrollback_lines = 3000
  config.front_end ='WebGpu'

  -- Font
  config.font = wezterm.font("MesloLGS NF")
  config.use_fancy_tab_bar = false

  config.default_cursor_style = "BlinkingBlock"
  config.cursor_blink_ease_in = "Constant"
  config.cursor_blink_ease_out = "Constant"
  config.cursor_blink_rate = 750

  config.force_reverse_video_cursor = true
  config.colors = {
    tab_bar = {
      background = "rgba(0,0,0,0)",
      active_tab = {
        bg_color = "#1e1e2e",
        fg_color = "#b4befe",
        intensity = "Bold",
        underline = "None",
        italic = true,
        strikethrough = false,
      },
      inactive_tab = {
        bg_color = "#1e1e2e",
        fg_color = "#cba6f7",
        italic = true,
      },
      inactive_tab_hover = {
        bg_color = "#313244",
        fg_color = "#b4befe",
        italic = true,
      },
      new_tab = {
        bg_color = "#1e1e2e",
        fg_color = "#cba6f7",
      },
      new_tab_hover = {
        bg_color = "#313244",
        fg_color = "#b4befe",
      },
    },
  }

  wezterm.on("update-status", function(window, pane)
    local cwd = pane:get_current_working_dir().file_path
    local time = wezterm.strftime("%a %b %-d %I:%M %p")

    window:set_right_status(wezterm.format({
      { Background = { Color = "rgba(0,0,0,0)" } },
      { Foreground = { Color = "#1e1e2e" } },
      { Text = "" },
      { Background = { Color = "#1e1e2e" } },
      { Foreground = { Color = "#cba6f7" } },
      { Text = " " .. wezterm.nerdfonts.custom_folder_open },
      { Text = " ~" },
      { Text = cwd .. " " },
      { Foreground = { Color = "#313244" } },
      { Text = "" },
      { Background = { Color = "#313244" } },
      { Foreground = { Color = "#f2cdcd" } },
      { Text = " " .. wezterm.nerdfonts.fa_calendar .. " " .. time .. " " },
    }))
  end)

  wezterm.on("toggle-background", function(window, pane)
    local overrides = window:get_config_overrides() or {}
    if not overrides.background then
      overrides.background = { nil }
    else
      overrides.background = nil
    end
    window:set_config_overrides(overrides)
  end)

  config.inactive_pane_hsb = {
    saturation = 0.7,
    brightness = 0.5,
  }
end

return module
