import XMonad

import XMonad.Prompt
import XMonad.ManageHook

import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import XMonad.Util.NamedScratchpad
import XMonad.Util.WorkspaceCompare

import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ShowWName
import XMonad.Hooks.DynamicLog

import XMonad.Layout.Maximize
import XMonad.Layout.Spacing
import XMonad.Layout.Hidden
import XMonad.Layout.Tabbed
import XMonad.Layout.Accordion
import XMonad.Layout.Fullscreen
import XMonad.Layout.Renamed

import XMonad.Actions.Search
import XMonad.Actions.Promote
import XMonad.Actions.CycleWS
import XMonad.Actions.SinkAll

import qualified XMonad.StackSet as W

------------------------------------------------------------------

main = xmonad . ewmhFullscreen . ewmh $ def {
	terminal = my_terminal,
	modMask = my_mod_mask,
	borderWidth = my_border_width,
	normalBorderColor = my_normal_border_color, 
	focusedBorderColor = my_focused_border_color,
	layoutHook = my_layout_hook,
	focusFollowsMouse = my_focus_follows_mouse,
	manageHook = namedScratchpadManageHook scratchpads,
	logHook = showWNameLogHook my_swn_config,
	clickJustFocuses = my_click_just_focuses
}
	`additionalKeysP` my_keys

my_terminal = "kitty -1"
my_normal_border_color = "#3b4252"
my_focused_border_color = "#bc96da"
my_focus_follows_mouse = False
my_click_just_focuses = False
my_border_width = 0
my_mod_mask = mod4Mask
my_spacing = 4
my_font = "xft:sf pro rounded:size=9:antialias=true:hinting=true"
my_layout_hook = tall ||| accordion ||| mirror_accordion ||| tab ||| full

background_color = "#282a36"
current_line_color = "#44475a"
selection_color = "#44475a"
foreground_color = "#f8f8f2"
comment_color = "#6272a4"
cyan_color = "#8be9fd"
green_color = "#50fa7b"
orange_color = "#ffb86c"
pinkColor = "#ff79c6"
purple_color = "#bd93f9"
red_color = "#ff5555"
yellowColor = "#f1fa8c"

my_tab_theme = def { 
	fontName = my_font,
	activeColor = my_focused_border_color,
	inactiveColor = my_normal_border_color,
	activeBorderColor = my_focused_border_color,
	inactiveBorderColor = my_normal_border_color,
	activeTextColor = my_normal_border_color,
	inactiveTextColor = purple_color
}

mirror_accordion = renamed [Replace "mirror accor"] 
	$ maximizeWithPadding 0
	$ hiddenWindows 
	$ spacing my_spacing 
	$ Mirror Accordion 

tall = renamed [Replace "tall"] 
	$ maximizeWithPadding 0
	$ hiddenWindows 
	$ spacing my_spacing 
	$ addTabs shrinkText my_tab_theme 
	$ Tall nmaster delta ratio

accordion = renamed [Replace "accor"] 
	$ maximizeWithPadding 0
	$ hiddenWindows 
	$ spacing my_spacing 
	$ Accordion

full = renamed [Replace "full"] 
	$ maximizeWithPadding 0
	$ hiddenWindows 
	$ Full

tab = renamed [Replace "tabbed"] 
	$ maximizeWithPadding 0
	$ hiddenWindows
	$ tabbed shrinkText my_tab_theme
	 
nmaster = 1
ratio = 1 / 2
delta = 2 / 100

my_swn_config = def { 
	swn_font = "xft:Ubuntu:bold:size=60",
	swn_fade = 0.3,
	swn_bgcolor = "#1c1f24",
	swn_color = "#ffffff"
}

scratchpads = [
	NS "terminal" spawn_term find_term manage_term,
	NS "docs" spawn_docs find_docs manage_docs
	]
	where
		spawn_term = "kitty -1 --class scratch_terminal"
		find_term = className =? "scratch_terminal"
		manage_term = customFloating $ W.RationalRect l t w h
			where
				h = 0.90 -- height
				w = 0.97 -- width
				t = 0.05 -- distance from top edge
				l = 0.015-- distance from left edge

		spawn_docs = "~/.local/bin/devdocs"
		find_docs = className =? "FFPWA-01FX9RNFXCWG4QS358C257Y11S"
		manage_docs = customFloating $ W.RationalRect l t w h
			where
				h = 0.90 -- height
				w = 0.97 -- width
				t = 0.05 -- distance from top edge
				l = 0.015 -- distance from left edge

my_tab_config = def {
	activeColor = "#556064",
	inactiveColor = "#2F3D44",
	urgentColor = "#FDF6E3",
	activeBorderColor = "#454948",
	inactiveBorderColor = "#454948",
	urgentBorderColor = "#268BD2",
	activeTextColor = "#80FFF9",
	inactiveTextColor = "#1ABC9C",
	urgentTextColor = "#1ABC9C",
	fontName = "xft:ubuntu:size=0"
}

my_keys = [
		("<XF86AudioLowerVolume>", spawn "pulseaudio-ctl down"),
		("<XF86AudioRaiseVolume>", spawn "pulseaudio-ctl up"),
		("<XF86AudioMute>", spawn "pulseaudio-ctl mute"),
		("<XF86Tools>", spawn "kitty -1 -e calc"),
		("M-r", spawn "firefox"),
		("M-w", kill),
		("M-t", spawn "rofi -matching fuzzy -modi combi -combi window,drun -show combi"),
		("M-f", withFocused $ sendMessage . maximizeRestore),
		("M--", spawn my_terminal),
		("M-d", withFocused hideWindow),
		("M-S-d", popOldestHiddenWindow),
		("M-<Return>", promote),
		("C-q", namedScratchpadAction scratchpads "terminal"),
		("M-e", namedScratchpadAction scratchpads "docs"),
		("M-g", selectSearch google),
		("M-l", next_non_empty_ws),
		("M-h", prev_non_empty_ws),
		("M-\\", toggleWS' ["NSP"]),
		("M-c", moveTo Next emptyWS),
		("M-[", sendMessage Shrink),
		("M-]", sendMessage Expand),
		("M-b", withFocused $ windows . W.sink),
		("M-S-r", spawn "xmonad --recompile && xmonad --restart")
	]

-- yoinked from somewhere
not_sp = (return $ ("NSP" /=) . W.tag) :: X (WindowSpace -> Bool)
shift_and_view dir = findWorkspace getSortByIndex dir (WSIs not_sp) 1 >>= \t -> (windows . W.shift $ t) >> (windows . W.greedyView $ t)
shift_and_view' dir = findWorkspace get_sort_by_index_no_sp dir HiddenNonEmptyWS 1 >>= \t -> (windows . W.shift $ t) >> (windows . W.greedyView $ t)
next_non_empty_ws = findWorkspace get_sort_by_index_no_sp Next HiddenNonEmptyWS 1 >>= \t -> (windows . W.view $ t)
prev_non_empty_ws = findWorkspace get_sort_by_index_no_sp Prev HiddenNonEmptyWS 1 >>= \t -> (windows . W.view $ t)
get_sort_by_index_no_sp = fmap (.namedScratchpadFilterOutWorkspace) getSortByIndex
