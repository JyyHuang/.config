local wezterm = require("wezterm")

local module = {}
function module.apply_to_config(config)
  -- --Color Scheme
  -- config.color_scheme = "Catppuccin Mocha"
  config.color_scheme = "tokyonight_night"

  config.window_decorations = "RESIZE"
  config.window_close_confirmation = "AlwaysPrompt"

  config.tab_max_width = 50
  config.scrollback_lines = 3000
  config.front_end = "OpenGL"

  config.enable_kitty_graphics = true
  config.window_background_opacity = 0.5
  -- Font
  config.font = wezterm.font("Hack Nerd Font Mono", { weight = "DemiBold" })
  config.font_size = 13
  config.use_fancy_tab_bar = false

  config.default_cursor_style = "BlinkingBlock"
  config.cursor_blink_ease_in = "Constant"
  config.cursor_blink_ease_out = "Constant"
  config.cursor_blink_rate = 750

  config.force_reverse_video_cursor = true
  config.colors = {
    tab_bar = {
      background = "rgba(26, 27, 38, 0.5)",
      active_tab = {
        bg_color = "#16161e",
        fg_color = "#7aa2f7",
        intensity = "Bold",
        underline = "None",
        italic = true,
        strikethrough = false,
      },
      inactive_tab = {
        bg_color = "#16161e",
        fg_color = "#545c7e",
        italic = true,
      },
      inactive_tab_hover = {
        bg_color = "#292e42",
        fg_color = "#7aa2f7",
        italic = true,
      },
      new_tab = {
        bg_color = "#16161e",
        fg_color = "#7aa2f7",
        intensity = "Bold",
      },
      new_tab_hover = {
        bg_color = "#292e42",
        fg_color = "#7aa2f7",
      },
    },
  }

  wezterm.on("update-status", function(window, pane)
    local cwd = pane:get_current_working_dir().file_path
    local time = wezterm.strftime("%a %b %-d %I:%M %p")

    window:set_right_status(wezterm.format({
      { Background = { Color = "rgba(26, 27, 38, 0.5)" } },
      { Foreground = { Color = "#15161e" } },
      { Text = "" },
      { Background = { Color = "#15161e" } },
      { Foreground = { Color = "#7aa2f7" } },
      { Text = " " .. wezterm.nerdfonts.custom_folder_open },
      { Text = " ~" },
      { Text = cwd .. " " },
      { Foreground = { Color = "#414868" } },
      { Text = "" },
      { Background = { Color = "#414868" } },
      { Foreground = { Color = "#bb9af7" } },
      { Text = " " .. wezterm.nerdfonts.fa_calendar .. " " .. time .. " " },
    }))
  end)

  wezterm.on("toggle-background", function(window, pane)
    local overrides = window:get_config_overrides() or {}
    if not overrides.window_background_opacity then
      overrides.window_background_opacity = 1.0
    else
      overrides.window_background_opacity = nil
    end
    window:set_config_overrides(overrides)
  end)

  config.inactive_pane_hsb = {
    saturation = 0.7,
    brightness = 0.5,
  }
end

return module
