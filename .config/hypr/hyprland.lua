hl.monitor({
	output = "eDP-1",
	mode = "1920x1080@144",
	scale = 1.20
})

hl.on("hyprland.start", function()
	hl.exec_cmd("hyprsunset -t 7500 --gamma_max 150 --gamma 125")
	hl.exec_cmd("noctalia")
	hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 15")
	hl.exec_cmd("clipse -listen")
	hl.exec_cmd("easyeffects -w")
	hl.exec_cmd("xremap ~/.config/xremap/xremap.conf")
end)

hl.config({
	general = {
		gaps_in = 6,
		gaps_out = 13,
		layout = "dwindle",
		border_size = 0,
	},

	dwindle = {
		force_split = 2,
		split_width_multiplier = 1.5
	},

	cursor = {
		inactive_timeout = 1,
		persistent_warps = true
	},

	decoration = {
		-- screen_shader = "~/.config/hypr/shaders/vibrance.glsl",
		dim_special = 0.5,
		rounding = 12,

		shadow = {
			range = 18
		},

		blur = {
			enabled = 1,
			xray = 1,
			ignore_opacity = true,
			size = 6,
			passes = 3
		}
	},

	binds = {
		allow_workspace_cycles = true,
		hide_special_on_workspace_change = true,
		workspace_back_and_forth = false
	},

	debug = {
		disable_logs = true,
		disable_time = true,
	},

	misc = {
		disable_hyprland_logo = 1,
		disable_splash_rendering = 1,
		initial_workspace_tracking = 0,
		vrr = 0
	},

	render = {
		direct_scanout = 1,
		-- non_shader_cm_interop = 0,
		-- non_shader_cm = 0
	},

	xwayland = {
		force_zero_scaling = true
	},

	input = {
		kb_layout = "us",
		follow_mouse = 0,
		scroll_factor = 0.4,
		scroll_method = "2fg",
		numlock_by_default = true,

		touchpad = {
			natural_scroll = true,
			clickfinger_behavior = true,
			disable_while_typing = true
		}
	}
})

-- ENVS
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1.20")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("_JAVA_AWT_WM_NONEREPARENTING", "1")
hl.env("_JAVA_OPTIONS", "'-Dawt.useSystemAAFontSettings=on'")
hl.env("WLR_DRM_NO_ATOMIC", "1")

-- ANIMATIONS

hl.curve("realsmooth", {
	type = "bezier",
	points = { {0.28, 0.29}, {0.69, 1.00} }
})

hl.animation({
	leaf = "windows",
	enabled = true,
	speed = 3,
	bezier = "realsmooth"
})

hl.animation({
	leaf = "layers",
	enabled = true,
	speed = 3,
	bezier = "realsmooth"
})

hl.animation({
	leaf = "workspaces",
	enabled = true,
	speed = 3,
	bezier = "realsmooth",
	style = "slide"
})

-- DEVICES

hl.device({
	name = "yjx-chip-usb-mouse-mouse",
	accel_profile = "flat",
})

-- WINDOW RULES

hl.window_rule({
	match = { class = "BeamNG.drive" },
	fullscreen = 1,
	workspace = 11
})

hl.window_rule({
	match = { class = "dev.noctalia.Noctalia" },
	float = 1
})

hl.window_rule({
	match = { class = "Alacritty" },
	opacity = 0.93
})

hl.window_rule({
	match = { class = "scratch_1" },
	opacity = 0.93
})

hl.window_rule({
	match = { class = "scratch_2" },
	opacity = 0.93
})

hl.window_rule({
	match = { class = "nvidia-settings" },
	float = true
})

hl.window_rule({
	match = { class = "blender" },
	workspace = 9
})

hl.window_rule({
	match = { class = "xdg-desktop-portal-gtk" },
	opacity = 0.9,
	size = "(monitor_w*0.70) (monitor_w*0.4)",
	move = "(monitor_w*0.15) (monitor_h*0.15)"
})

hl.window_rule({
	match = { class = "discord" },
	opacity = 0.95,
	workspace = 17
})

hl.window_rule({
	match = { class = "^md.obsidian.Obsidian" },
	opacity = 0.95,
	workspace = 19
})

hl.window_rule({
	match = { class = "spotify" },
	opacity = 0.92,
	workspace = 20
})

hl.window_rule({
	match = { class = "com.github.wwmm.easyeffects" },
	float = true
})

hl.window_rule({
	match = { initial_title = "clipboard" },
	float = true,
	size = "(monitor_w*0.5) (monitor_w*0.4)",
	move = "(monitor_w*0.25) (monitor_h*0.15)",
	stay_focused = true,
	dim_around = true
})

hl.window_rule({
	match = { initial_title = "^(Library)$" },
	float = true,
	size = "(monitor_w*0.5) (monitor_w*0.4)",
	move = "(monitor_w*0.25) (monitor_h*0.15)"
})

hl.window_rule({
	match = { class = "^(blueman-manager)$" },
	float = true,
	size = "(monitor_w*0.5) (monitor_w*0.4)",
	move = "(monitor_w*0.25) (monitor_h*0.15)",
	dim_around = true
})

hl.window_rule({
	match = { class = "^(ristretto)$" },
	float = true,
	size = "(monitor_w*0.5) (monitor_w*0.4)",
	move = "(monitor_w*0.25) (monitor_h*0.15)",
	dim_around = true
})

hl.window_rule({
	match = { class = "^(clipboard)$" },
	dim_around = true
})

hl.window_rule({
	match = { class = "^(nemo)$" },
	float = true,
	size = "(monitor_w*0.5) (monitor_w*0.4)",
	move = "(monitor_w*0.25) (monitor_h*0.15)",
	stay_focused = true,
	decorate = false,
	dim_around = true
})

-- LAYERS

hl.layer_rule({
	match = { namespace = "rofi" },
	dim_around = true,
	xray = true
})

-- BINDS

hl.bind("SUPER + space",
	hl.dsp.exec_cmd("alacritty", { workspace = 2 })
)

hl.bind("mouse:276",
	function()
		local is_invisible = hl.get_config("cursor.invisible")
		hl.config({ cursor = { invisible = not is_invisible } })

		hl.device({
			name = "yjx-chip-usb-mouse-mouse",
		})
	end
)

hl.bind("SUPER + n",
	hl.dsp.focus({ workspace = 16 })
)

hl.bind("SUPER + e",
	hl.dsp.exec_cmd("bash -c 'g=$(slurp) || exit 0; grim -l 0 -g \"$g\" - | tee ~/pics/$(date +%Y-%m-%d-%H%M%S).png | wl-copy'")
)

hl.bind("SUPER + b",
	hl.dsp.exec_cmd("alacritty -T clipboard -e clipse")
)

hl.bind("SUPER + r",
	hl.dsp.exec_cmd("firefox", { workspace = 1 })
)

hl.bind("SUPER + m",
	hl.dsp.focus({ workspace = 17 })
)

hl.bind("SUPER + i",
	hl.dsp.focus({ workspace = 18 })
)

hl.bind("SUPER + o",
	hl.dsp.focus({ workspace = 19 })
)

hl.bind("SUPER + p",
	hl.dsp.focus({ workspace = 20 })
)

hl.bind("SUPER + w",
	hl.dsp.window.close()
)

hl.bind("SUPER + h",
	hl.dsp.group.prev()
)

hl.bind("SUPER + l",
	hl.dsp.group.next()
)

hl.bind("XF86Launch2",
	hl.dsp.exec_cmd("hyprlock")
)

hl.bind("XF86Calculator",
	hl.dsp.exec_cmd("blueman-manager")
)

hl.bind("SUPER + J",
	hl.dsp.exec_cmd("toggle-game")
)

hl.bind("XF86MonBrightnessUp",
	hl.dsp.exec_cmd("brightnessctl s 1000+"),
	{ locked = true, repeating = true }
)

hl.bind("XF86MonBrightnessDown",
	hl.dsp.exec_cmd("brightnessctl s 1000-"),
	{ locked = true, repeating = true }
)

hl.bind("XF86AudioLowerVolume",
	hl.dsp.exec_cmd("pulsemixer --change-volume -5"),
	{ locked = true, repeating = true }
)

hl.bind("XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("pulsemixer --change-volume +5"),
	{ locked = true, repeating = true }
)

hl.bind("XF86AudioMute",
	hl.dsp.exec_cmd("pulsemixer --toggle-mute"),
	{ locked = true, repeating = true }
)

hl.bind("SUPER + g",
	hl.dsp.exec_cmd("rofi -show-icons -mode drun -show drun")
)

hl.bind("SUPER + f",
	hl.dsp.window.fullscreen({ toggle = true })
)

hl.bind("SUPER + q",
	hl.dsp.window.float({ action = "toggle" })
)

hl.bind("ALT_L + Kp_Multiply",
	hl.dsp.exec_cmd("bash -c 'if [ $(hyprctl hyprsunset temperature) -lt 10000 ]; then hyprctl hyprsunset temperature +500; fi'")
)

hl.bind("ALT_L + Kp_Subtract",
	hl.dsp.exec_cmd("hyprctl hyprsunset temperature -500")
)

hl.bind("SHIFT + Kp_Multiply",
	hl.dsp.exec_cmd("hyprctl hyprsunset gamma +5")
)

hl.bind("SHIFT + Kp_Subtract",
	hl.dsp.exec_cmd("hyprctl hyprsunset gamma -5")
)

-- movefocus (vim keys)

hl.bind("SUPER + h",
	hl.dsp.focus({ direction = "left" })
)

hl.bind("SUPER + l",
	hl.dsp.focus({ direction = "right" })
)

hl.bind("SUPER + k",
	hl.dsp.focus({ direction = "up" })
)

hl.bind("SUPER + j",
	hl.dsp.focus({ direction = "down" })
)

function set_workspace_num_binds()
	for i = 0, 9 do
		local ws = (i == 0) and 10 or i

		hl.bind("SUPER + " .. i,
			hl.dsp.focus({ workspace = ws })
		)

		hl.bind("SUPER + SHIFT + " .. i,
			hl.dsp.window.move({ workspace = ws })
		)
	end
end

set_workspace_num_binds()

hl.bind("SUPER + TAB",
	hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle-gaps.sh")
)

hl.bind("CTRL + Q",
	hl.dsp.workspace.toggle_special("primary")
)

hl.bind("CTRL + backslash",
	hl.dsp.workspace.toggle_special("bg")
)

hl.bind("SUPER + return",
	hl.dsp.workspace.toggle_special("raw")
)

hl.bind("SUPER + SHIFT + return",
	hl.dsp.window.move({ workspace = "special:raw" })
)

hl.bind("SUPER + u",
	hl.dsp.layout("orientationcycle left top")
)

hl.bind("SUPER + s",
	hl.dsp.focus({ workspace = "e-1" })
)

hl.bind("SUPER + d",
	hl.dsp.focus({ workspace = "e+1" })
)

hl.bind("SUPER + y",
	hl.dsp.exec_cmd("~/.local/bin/toggle-bluetooth.sh")
)

hl.bind("SUPER + SHIFT + d",
	hl.dsp.window.move({ direction = "right" })
)

hl.bind("SUPER + SHIFT + a",
	hl.dsp.window.move({ direction = "left" })
)

hl.bind("SUPER + SHIFT + w",
	hl.dsp.window.move({ direction = "up" })
)

hl.bind("SUPER + SHIFT + s",
	hl.dsp.window.move({ direction = "down" })
)

hl.bind("SUPER + SHIFT + L",
	hl.dsp.window.resize({ x = 30, y = 0, relative = true })
)

hl.bind("SUPER + SHIFT + H",
	hl.dsp.window.resize({ x = -30, y = 0, relative = true })
)

hl.bind("SUPER + SHIFT + K",
	hl.dsp.window.resize({ x = 0, y = -30, relative = true })
)

hl.bind("SUPER + SHIFT + J",
	hl.dsp.window.resize({ x = 0, y = 30, relative = true })
)

hl.bind("SUPER + c",
	hl.dsp.window.move({ workspace = "emptyn" })
)

hl.bind("ALT_L + TAB",
	hl.dsp.focus({ workspace = "previous" })
)

hl.bind("XF86AudioPrev",
	hl.dsp.exec_cmd("playerctl previous"),
	{ locked = true }
)

hl.bind("XF86AudioNext",
	hl.dsp.exec_cmd("playerctl next"),
	{ locked = true }
)

hl.bind("XF86AudioPlay",
	hl.dsp.exec_cmd("playerctl play-pause"),
	{ locked = true }
)

hl.bind("SUPER + SHIFT + code:201",
	hl.dsp.exec_cmd("hyprlock")
)

hl.bind("SUPER + SHIFT + x",
	hl.dsp.exec_cmd("hyprshutdown")
)

hl.bind("SUPER + mouse:273",
	hl.dsp.window.resize(),
	{ mouse = true }
)

hl.bind("SUPER + mouse:272",
	hl.dsp.window.drag(),
	{ mouse = true }
)

-- WORKSPACE RULES

hl.workspace_rule({
	workspace = "special:primary",
	gaps_out = 200,
	gaps_in = 6,
	on_created_empty = "alacritty --class scratch_1"
})

hl.workspace_rule({
	workspace = "special:bg",
	gaps_out = 200,
	gaps_in = 6,
	on_created_empty = "alacritty --class scratch_2"
})

hl.workspace_rule({
	workspace = "special:raw",
	gaps_out = 200,
	gaps_in = 6
})

function unset_decor_workspaces(workspaces)
	for _, ws in ipairs(workspaces) do
		hl.workspace_rule({
			workspace = ws,
			gaps_out = 0,
			gaps_in = 0,
			no_shadow = true,
			decorate = false,
			no_rounding = true
		})
	end
end

unset_decor_workspaces({1, 3, 11})

hl.workspace_rule({
	workspace = 2,
	on_created_empty = "alacritty"
})

hl.workspace_rule({
	workspace = 16,
	on_created_empty = "thunderbird"
})

hl.workspace_rule({
	workspace = 17,
	on_created_empty = "discord --enable-features=UseOzonePlatform --ozone-platform=wayland"
})

hl.workspace_rule({
	workspace = 18,
	on_created_empty = "foliate"
})

hl.workspace_rule({
	workspace = 19,
	on_created_empty = "obsidian"
})

hl.workspace_rule({
	workspace = 20,
	on_created_empty = "spotify-launcher"
})
