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

import XMonad.Layout.Maximize
import XMonad.Layout.Spacing
import XMonad.Layout.Hidden
import XMonad.Layout.Accordion
import XMonad.Layout.Fullscreen
import XMonad.Layout.Renamed

import XMonad.Actions.Search
import XMonad.Actions.Promote
import XMonad.Actions.CycleWS
import XMonad.Actions.SinkAll
import XMonad.Actions.FindEmptyWorkspace

import qualified XMonad.StackSet as W

------------------------------------------------------------------

main = xmonad . docks . ewmhFullscreen . ewmh $ def {
	terminal = my_terminal,
	modMask = my_mod_mask,
	borderWidth = my_border_width,
	layoutHook = my_layouts,
	focusFollowsMouse = my_focus_follows_mouse,
	manageHook = namedScratchpadManageHook scratchpads,
	clickJustFocuses = my_click_just_focuses
}
	`additionalKeysP` my_keys

my_terminal = "alacritty "
my_focus_follows_mouse = False
my_click_just_focuses = False
my_border_width = 0
my_mod_mask = mod4Mask
my_spacing = 7
my_layouts = tall ||| mirror_tall ||| full

tall = renamed [Replace "tall"] 
	$ maximizeWithPadding 0
	$ hiddenWindows
	$ avoidStruts
	$ smartSpacing my_spacing 
	$ Tall nmaster delta ratio

mirror_tall = renamed [Replace "mirror tall"] 
	$ maximizeWithPadding 0
	$ hiddenWindows
	$ avoidStruts
	$ smartSpacing my_spacing 
	$ Mirror 
	$ Tall nmaster delta ratio

full = renamed [Replace "full"] 
	$ maximizeWithPadding 0
	$ avoidStruts
	$ hiddenWindows 
	$ Full

nmaster = 1
ratio = 1 / 2
delta = 2 / 100

scratchpads = [
	NS "terminal" spawn_term find_term manage_term,
	NS "docs" spawn_docs find_docs manage_docs
	]
	where
		spawn_term = my_terminal ++ "--class scratch_terminal,scratch_terminal"
		find_term = className =? "scratch_terminal"
		manage_term = customFloating $ W.RationalRect l t w h
			where
				h = 1.00 -- height
				w = 1.00 -- width
				t = 0.00 -- distance from top edge
				l = 0.00 -- distance from left edge

		spawn_docs = "~/.local/bin/devdocs"
		find_docs = className =? "FFPWA-01FX9RNFXCWG4QS358C257Y11S"
		manage_docs = customFloating $ W.RationalRect l t w h
			where
				h = 0.96 -- height
				w = 1.00 -- width
				t = 0.05 -- distance from top edge
				l = 0.00 -- distance from left edge

my_keys = [
		("<XF86AudioLowerVolume>", spawn "pulseaudio-ctl down"),
		("<XF86AudioRaiseVolume>", spawn "pulseaudio-ctl up"),
		("<XF86AudioMute>", spawn "pulseaudio-ctl mute"),
		("M-r", spawn "firefox"),
		("M-w", kill),
		("M-q", spawn "rofi -matching fuzzy -modi combi -combi window,drun -show combi"),
		("M-f", withFocused $ sendMessage . maximizeRestore),
		("M--", spawn my_terminal),
		("M-d", withFocused hideWindow),
		("M-v", popOldestHiddenWindow),
		("M-<Return>", promote),
		("C-q", namedScratchpadAction scratchpads "terminal"),
		("M-e", namedScratchpadAction scratchpads "docs"),
		("M-g", selectSearch google),
		("M-l", moveTo Next $ hiddenWS :&: Not emptyWS :&: ignoringWSs [scratchpadWorkspaceTag]),
		("M-h", moveTo Prev $ hiddenWS :&: Not emptyWS :&: ignoringWSs [scratchpadWorkspaceTag]),
		("M-c", moveTo Next $ hiddenWS :&: emptyWS :&: ignoringWSs [scratchpadWorkspaceTag]),
		("M-\\", toggleWS' ["NSP"]),
		("M-[", sendMessage Shrink),
		("M-]", sendMessage Expand),
		("M-t", tagToEmptyWorkspace),
		("M-b", withFocused $ windows . W.sink),
		("M-'", decWindowSpacing 1),
		("M-;", incWindowSpacing 1),
		("M-p", spawn "scrot ~/Pictures/'%Y-%m-%d-%s_$wx$h.png' -q 100")
	]
