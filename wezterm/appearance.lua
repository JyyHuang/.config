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

	--config.window_background_opacity = 0.8
	local dimmer = { brightness = 0.1 }
	config.background = {
		{
			source = {
 	  			File = wezterm.home_dir .. "/.config/wallpapers/power1.jpg",
			},
            attachment = "Fixed",
            repeat_x = "NoRepeat",
            repeat_y = "NoRepeat",
			hsb = dimmer,
            vertical_align = "Middle",
            horizontal_align = "Center",
		},
	}
	config.window_decorations = "RESIZE"
	config.window_close_confirmation = "AlwaysPrompt"

	config.tab_max_width = 30
	config.scrollback_lines = 3000

	-- Font
	config.font = wezterm.font("MesloLGS NF")

	config.force_reverse_video_cursor = true

	config.colors = {
		tab_bar = {
			background = "rgba(0,0,0,0)",
		},
	}
	-- Equivalent to POSIX basename(3)
	-- Given "/foo/bar" returns "bar"
	-- Given "c:\\foo\\bar" returns "bar"
	function basename(s)
		return string.gsub(s, "(.*[/\\])(.*)", "%2")
	end

	-- This function returns the suggested title for a tab.
	-- It prefers the title that was set via `tab:set_title()`
	-- or `wezterm cli set-tab-title`, but falls back to the
	-- title of the active pane in that tab.
	function tab_title(tab_info)
		local title = tab_info.tab_title
		-- if the tab title is explicitly set, take that
		if title and #title > 0 then
			return title
		end
		-- Otherwise, use the title from the active pane
		-- in that tab
		local pane = tab_info.active_pane
		local cwd = pane.current_working_dir
		local cwd_string = tostring(cwd)
		return string.format("zsh: %s", basename(cwd_string))
	end

	wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
		local background = "#1e1e2e"
		local foreground = "#f38ba8"

		if tab.is_active then
			background = "#45475a"
		elseif hover then
			background = "#313244"
			foreground = "#b4befe"
		end

		local title = tab_title(tab)

		return {
			{ Background = { Color = background } },
			{ Foreground = { Color = bg_color} },
			{ Text = " " },
			{ Background = { Color = background } },
			{ Foreground = { Color = foreground } },
			{ Text = title },
			{ Background = { Color = background } },
			{ Foreground = { Color = bg_color } },
			{ Text = " " },
		}
	end)

	config.use_fancy_tab_bar = false

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

	config.inactive_pane_hsb = {
		saturation = 0.7,
		brightness = 0.5,
	}
end

return module
