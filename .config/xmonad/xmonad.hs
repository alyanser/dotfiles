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
import XMonad.Hooks.SetWMName

import XMonad.Layout.Maximize
import XMonad.Layout.Spacing
import XMonad.Layout.Hidden
import XMonad.Layout.Accordion
import XMonad.Layout.Fullscreen
import XMonad.Layout.Renamed
import XMonad.Layout.Accordion

import XMonad.Actions.Search
import XMonad.Actions.GridSelect
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
	manageHook = namedScratchpadManageHook scratchpads <+> manage_hook,
	clickJustFocuses = my_click_just_focuses,
	startupHook = setWMName "LG3D"
}
	`additionalKeysP` my_keys

my_terminal = "alacritty "
my_focus_follows_mouse = True
my_click_just_focuses = False
my_border_width = 0
my_mod_mask = mod4Mask
my_spacing = 25
my_lock_screen = "slock"
my_layouts = tall ||| mirror_tall ||| full

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
	$ spacing my_spacing
	$ Full

nmaster = 1
ratio = 1 / 2
delta = 2 / 100

manage_hook = composeAll [
		className =? "firefox" --> doShift "1",
		className =? "discord" --> doShift "2"
	]

scratchpads = [
	NS "terminal" spawn_term find_term manage_term
	]
	where
		spawn_term = my_terminal ++ "--class scratch_terminal,scratch_terminal"
		find_term = className =? "scratch_terminal"
		manage_term = customFloating $ W.RationalRect l t w h
			where
				h = 0.895 -- height
				w = 0.965 -- width
				t = 0.078 -- distance from top edge
				l = 0.019 -- distance from left edge

my_keys = [
		("M-r", spawn "firefox"),
		("M-w", kill),
		("M-g", spawn "rofi -modi combi -combi run,window,drun -show combi"),
		("M-f", withFocused $ sendMessage . maximizeRestore),
		("M--", promote),
		("M-d", withFocused hideWindow),
		("M-v", popOldestHiddenWindow),
		("M-<Return>", spawn my_terminal),
		("C-q", namedScratchpadAction scratchpads "terminal"),
		("M-l", moveTo Next $ hiddenWS :&: Not emptyWS :&: ignoringWSs [scratchpadWorkspaceTag]),
		("M-h", moveTo Prev $ hiddenWS :&: Not emptyWS :&: ignoringWSs [scratchpadWorkspaceTag]),
		("M-c", moveTo Next $ hiddenWS :&: emptyWS :&: ignoringWSs [scratchpadWorkspaceTag]),
		("M-b", moveTo Prev $ hiddenWS :&: emptyWS :&: ignoringWSs [scratchpadWorkspaceTag]),
		("M-\\", toggleWS' ["NSP"]),
		("M-[", sendMessage Shrink),
		("M-]", sendMessage Expand),
		("M-t", tagToEmptyWorkspace),
		("M-i", goToSelected def),
		("M-y", withFocused $ windows . W.sink),
		("M-'", decWindowSpacing 2),
		("M-;", incWindowSpacing 2),
		("M-e", promptSearch def google),
		("M-m", spawn my_lock_screen),
		("M-p", spawn "scrot ~/Pictures/'%Y-%m-%d-%s_$wx$h.png' -q 100"),
		("M-S-p", spawn "scrot -s ~/Pictures/'%Y-%m-%d-%s_$wx$h.png' -q 100")
	]
