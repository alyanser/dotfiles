import XMonad

import XMonad.Prompt
import XMonad.ManageHook

import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import XMonad.Util.NamedScratchpad
import XMonad.Util.Loggers
import XMonad.Util.WorkspaceCompare

import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Hooks.ManageHelpers

import XMonad.Layout.Maximize
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
import XMonad.Layout.Hidden
import XMonad.Layout.Magnifier
import XMonad.Layout.Tabbed
import XMonad.Layout.Accordion
import XMonad.Layout.ResizableTile

import XMonad.Actions.CycleSelectedLayouts -- todo: consider using single layouts for each key
import XMonad.Actions.FindEmptyWorkspace
import XMonad.Actions.Promote
import XMonad.Actions.Search
import XMonad.Layout.Named

------------------------------------------------------------------

my_terminal = "kitty"
my_normal_border_color = "#3b4252"
my_focused_border_color = "#bc96da"
my_layout_hook = maximizeWithPadding 0 $ magnifiercz 1.0 $ hiddenWindows $ avoidStruts $ spacingWithEdge 7 $ my_layout
my_focus_follows_mouse = False
my_click_just_focuses = False
my_border_width = 0

my_layout = tiled ||| Mirror tiled ||| accordion ||| tab ||| full
	where
		tiled = smartBorders $ ResizableTall nmaster delta ratio []
		nmaster = 1
		ratio = 1 / 2
		delta = 3 / 100
		accordion = noBorders $ Accordion
		tab = noBorders $ tabbed shrinkText my_tab_config
		full = noBorders $ Full


my_xp_config = def {
	height = 50,	
	promptBorderWidth = 0
}

scratchpads = [
		NS "terminal" "kitty -1 --class scratch_terminal" (className =? "scratch_terminal") nonFloating
	]

my_manage_hook = composeAll
	[ 
		isFullscreen -->  doFullFloat
	] <+> namedScratchpadManageHook scratchpads

my_pretty_print = def {
	ppCurrent = const "     ●     ",
	ppHidden = const "   ◉   ",
	ppHiddenNoWindows = const "   ○   ",
	ppUrgent = const "   ◼   ",
	ppSep = "     |||     ",
	-- ppWsSep = "   -   ",
	ppOrder = \(ws:_) -> [ws]
}

my_status_bar = statusBarProp "xmobar" (pure my_pretty_print)

my_tab_config = def { activeColor = "#556064"
                  , inactiveColor = "#2F3D44"
                  , urgentColor = "#FDF6E3"
                  , activeBorderColor = "#454948"
                  , inactiveBorderColor = "#454948"
                  , urgentBorderColor = "#268BD2"
                  , activeTextColor = "#80FFF9"
                  , inactiveTextColor = "#1ABC9C"
                  , urgentTextColor = "#1ABC9C"
                  , fontName = "xft:ubuntu:size=0"
                  }

my_keys = [
		("<XF86AudioLowerVolume>", spawn "pulseaudio-ctl down"),
		("<XF86AudioRaiseVolume>", spawn "pulseaudio-ctl up"),
		("<XF86AudioMute>", spawn "pulseaudio-ctl mute"),
		("<XF86Tools>", spawn "kitty -1 -e calc"),
		("M-C-j",sendMessage MirrorShrink),
		("M-C-k",sendMessage MirrorExpand),
		("M-w", kill),
		("M-r", spawn "rofi -no-lazy-grab -modi combi -combi window,drun -show combi"),
		("M-f", withFocused $ sendMessage . maximizeRestore),
		("M-<Return>", promote),
		("M-]", sendMessage MagnifyLess),
		("M-[", sendMessage MagnifyMore),
		("M-a", withFocused hideWindow),
		("M-C-a", popOldestHiddenWindow),
		("M--", spawn "kitty -1"),
		("M-C-w", spawn "qutebrowser"),
		("M-C-c", spawn "vscodium"),
		("M-q", namedScratchpadAction scratchpads "terminal"),
		("M-C-s", promptSearch my_xp_config google),
		("M-S-s", selectSearch google),
		("M-S-r", spawn "xmonad --recompile && xmonad --restart")
	]
		
main = xmonad . docks . ewmhFullscreen . ewmh $ withSB my_status_bar def {
	terminal = my_terminal,
	borderWidth = my_border_width,
	normalBorderColor = my_normal_border_color, 
	focusedBorderColor = my_focused_border_color,
	layoutHook = my_layout_hook,
	focusFollowsMouse = my_focus_follows_mouse,
        	clickJustFocuses = my_click_just_focuses,
	manageHook = my_manage_hook }
	`additionalKeysP` my_keys