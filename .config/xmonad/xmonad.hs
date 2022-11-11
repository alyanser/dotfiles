import XMonad
import XMonad.Prompt
import XMonad.ManageHook

import XMonad.Util.EZConfig

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

import XMonad.Actions.Promote
import XMonad.Actions.CycleWS
import XMonad.Actions.CycleRecentWS
import XMonad.Actions.SinkAll
import XMonad.Actions.FindEmptyWorkspace

import Control.Monad (liftM2)
import qualified XMonad.StackSet as W

main = xmonad . docks . ewmhFullscreen . ewmh $ def {
	terminal = my_terminal,
	modMask = my_mod_mask,
	borderWidth = my_border_width,
	layoutHook = my_layouts,
	focusFollowsMouse = my_focus_follows_mouse,
	clickJustFocuses = my_click_just_focuses,
	manageHook = my_manage_hook,
	startupHook = setWMName "LG3D"
}
	`additionalKeysP` my_keys

my_terminal = "alacritty "
my_focus_follows_mouse = False
my_click_just_focuses = False
my_border_width = 0
my_mod_mask = mod4Mask
my_spacing = 5
my_lock_screen = "slock"
my_layouts = mirror_tall ||| full ||| tall

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

accordion = renamed [Replace "accordion"]
	$ maximizeWithPadding 0
	$ hiddenWindows
	$ avoidStruts
	$ smartSpacing my_spacing
	$ Accordion

mirror_accordion = renamed [Replace "mirror accordion"]
	$ maximizeWithPadding 0
	$ hiddenWindows
	$ avoidStruts
	$ smartSpacing my_spacing
	$ Mirror
	$ Accordion

full = renamed [Replace "full"]
	$ maximizeWithPadding 0
	$ avoidStruts
	$ hiddenWindows 
	$ smartSpacing my_spacing
	$ Full

nmaster = 1
ratio = 1 / 2
delta = 2 / 100

my_manage_hook = composeAll [
		className =? "firefox" --> viewShift "1",
		className =? "Alacritty" --> viewShift "2",
		className =? "discord" --> viewShift "3",
		className =? "obsidian" --> viewShift "4",
		className =? "Upwork" --> viewShift "5"
	]
	where viewShift = doF . liftM2 (.) W.greedyView W.shift

my_keys = [
		("M-r", spawn "firefox"),
		("M-w", kill),
		("M-g", spawn "rofi -modi combi -combi run,window,drun -show combi"),
		("M-f", withFocused $ sendMessage . maximizeRestore),
		("M--", promote),
		("M-d", withFocused hideWindow),
		("M-v", popOldestHiddenWindow),
		("M-i", spawn my_terminal),
		("M-l", moveTo Next $ hiddenWS :&: Not emptyWS),
		("M-h", moveTo Prev $ hiddenWS :&: Not emptyWS),
		("M-c", moveTo Next $ hiddenWS :&: emptyWS),
		("M-b", moveTo Prev $ hiddenWS :&: emptyWS),
		("M-\\", toggleRecentNonEmptyWS),
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
