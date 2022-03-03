import XMonad

import XMonad.Prompt
import XMonad.ManageHook
import XMonad.StackSet as W
import Data.Ratio

import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import XMonad.Util.NamedScratchpad
import XMonad.Util.Loggers
import XMonad.Util.WorkspaceCompare

import XMonad.Hooks.RefocusLast (refocusLastLogHook)
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
my_layout_hook = my_layout
my_focus_follows_mouse = False
my_click_just_focuses = False
my_border_width = 0

my_layout = named "Tabbed" (tab) ||| named "Tall" (tall) ||| named "Mirror Tall" (avoidStruts (Mirror tall)) ||| named "Accordion" (accordion) ||| named "Full" (full)
	where
		tall = maximizeWithPadding 0 $ magnifiercz 1.0 $ hiddenWindows $ avoidStruts $ spacing 7 $ smartBorders $ ResizableTall nmaster delta ratio []
		nmaster = 1
		ratio = 1 / 2
		delta = 3 / 100
		accordion = maximizeWithPadding 0 $ magnifiercz 1.0 $ hiddenWindows $ avoidStruts $ spacing 5 $ noBorders $ Accordion
		tab = maximizeWithPadding 0 $ hiddenWindows $ avoidStruts $ spacing 0 $ noBorders $ tabbed shrinkText my_tab_config
		full = hiddenWindows $ spacing 0 $ noBorders $ Full


my_xp_config = def {
	height = 50,	
	promptBorderWidth = 0
}

scratchpads = [ NS "terminal" spawn_term find_term manage_term
                , NS "docs" spawn_docs find_docs manage_docs
                ]
  where
    spawn_term  = "kitty --class scratch_terminal"
    find_term   = className =? "scratch_terminal"
    manage_term = customFloating $ W.RationalRect 0 0 1 1
    spawn_docs  = "~/.local/bin/devdocs"
    find_docs   = className =? "FFPWA-01FX54EAF00Y306Z6B5767WM85"
    manage_docs = customFloating $ W.RationalRect 0 0 1 1

my_manage_hook = composeAll
	[ 
		isFullscreen -->  doFullFloat
	] <+> namedScratchpadManageHook scratchpads

my_pretty_print = def {
	ppCurrent = wrap "<fc=#afff33>" "</fc>",
	ppHidden = wrap "<fc=#ff9260>" "</fc>",
	ppSep = "         |||         ",
	ppWsSep = "         ",
	ppTitle = wrap "<fc=#59a8ff>" "</fc>" . shorten 20,
	ppLayout = wrap "<fc=#c1ff59>" "</fc>",
	ppOrder  = \(ws : l : _ : _ ) -> [ws,l]
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
		("M-r", spawn "rofi -no-lazy-grab -modi run -show run"),
		("M-f", withFocused $ sendMessage . maximizeRestore),
		("M-<Return>", promote),
		("M-]", sendMessage MagnifyLess),
		("M-[", sendMessage MagnifyMore),
		("M-d", withFocused hideWindow),
		("M-a", popOldestHiddenWindow),
		("M--", spawn "kitty -1"),
		("M-t", spawn "firefox"),
		("C-q", namedScratchpadAction scratchpads "terminal"),
		("M-e", namedScratchpadAction scratchpads "docs"),
		("M-s", promptSearch my_xp_config google),
		("M-C-s", selectSearch google),
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
	logHook = refocusLastLogHook >> nsHideOnFocusLoss scratchpads,
	manageHook = my_manage_hook }
	`additionalKeysP` my_keys
