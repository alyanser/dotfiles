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
import XMonad.Layout.Accordion
import XMonad.Layout.Tabbed

import XMonad.Actions.Search
import XMonad.Actions.Promote
import XMonad.Actions.CycleWS
import XMonad.Actions.SinkAll
import XMonad.Actions.FindEmptyWorkspace

import qualified XMonad.StackSet as W

------------------------------------------------------------------

main = xmonad . docks . ewmh $ def {
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
my_spacing = 8
my_lock_screen = "slock"
my_layouts = tall ||| mirror_tall ||| mirror_accordion ||| accordion ||| full

tall = renamed [Replace "tall"] 
	$ maximizeWithPadding 0
	$ hiddenWindows
	$ avoidStruts
	$ spacing my_spacing 
	$ Tall nmaster delta ratio

mirror_tall = renamed [Replace "mirror tall"] 
	$ maximizeWithPadding 0
	$ hiddenWindows
	$ avoidStruts
	$ spacing my_spacing 
	$ Mirror 
	$ Tall nmaster delta ratio

accordion = renamed [Replace "accordion"]
	$ maximizeWithPadding 0
	$ hiddenWindows
	$ avoidStruts
	$ spacing my_spacing
	$ Accordion

mirror_accordion = renamed [Replace "mirror accordion"]
	$ maximizeWithPadding 0
	$ hiddenWindows
	$ avoidStruts
	$ spacing my_spacing
	$ Mirror
	$ Accordion

full = renamed [Replace "full"] 
	$ maximizeWithPadding 0
	$ avoidStruts
	$ hiddenWindows 
	$ Full

nmaster = 1
ratio = 1 / 2
delta = 2 / 100

scratchpads = [
	NS "terminal" spawn_term find_term manage_term
	]
	where
		spawn_term = my_terminal ++ "--class scratch_terminal,scratch_terminal"
		find_term = className =? "scratch_terminal"
		manage_term = customFloating $ W.RationalRect l t w h
			where
				h = 0.78 -- height
				w = 0.9 -- width
				t = 0.13 -- distance from top edge
				l = 0.05 -- distance from left edge

my_keys = [
		("<XF86AudioLowerVolume>", spawn "pulseaudio-ctl down"),
		("<XF86AudioRaiseVolume>", spawn "pulseaudio-ctl up"),
		("<XF86AudioMute>", spawn "pulseaudio-ctl mute"),
		("M-r", spawn "firefox"),
		("M-w", kill),
		("M-g", spawn "rofi -matching fuzzy -modi drun -show drun"),
		("M-f", withFocused $ sendMessage . maximizeRestore),
		("M--", spawn my_terminal),
		("M-d", withFocused hideWindow),
		("M-v", popOldestHiddenWindow),
		("M-<Return>", promote),
		("C-q", namedScratchpadAction scratchpads "terminal"),
		("M-l", moveTo Next $ hiddenWS :&: Not emptyWS :&: ignoringWSs [scratchpadWorkspaceTag]),
		("M-h", moveTo Prev $ hiddenWS :&: Not emptyWS :&: ignoringWSs [scratchpadWorkspaceTag]),
		("M-c", moveTo Next $ hiddenWS :&: emptyWS :&: ignoringWSs [scratchpadWorkspaceTag]),
		("M-b", moveTo Prev $ hiddenWS :&: emptyWS :&: ignoringWSs [scratchpadWorkspaceTag]),
		("M-\\", toggleWS' ["NSP"]),
		("M-[", sendMessage Shrink),
		("M-]", sendMessage Expand),
		("M-t", tagToEmptyWorkspace),
		("M-y", withFocused $ windows . W.sink),
		("M-'", decWindowSpacing 2),
		("M-;", incWindowSpacing 2),
		("M-m", spawn my_lock_screen),
		("M-p", spawn "scrot ~/pics/'%Y-%m-%d-%s_$wx$h.png' -q 100"),
		("M-S-p", spawn "scrot -s ~/pics/'%Y-%m-%d-%s_$wx$h.png' -q 100")
	]
