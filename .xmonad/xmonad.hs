import XMonad

import XMonad.Prompt
import XMonad.ManageHook

import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import XMonad.Util.NamedScratchpad
import XMonad.Util.WorkspaceCompare

import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers

import XMonad.Layout.Maximize
import XMonad.Layout.Spacing
import XMonad.Layout.Hidden
import XMonad.Layout.Tabbed
import XMonad.Layout.Accordion
import XMonad.Layout.Fullscreen
import XMonad.Layout.Simplest
import XMonad.Layout.MultiToggle

import XMonad.Actions.Search
import XMonad.Actions.Promote
import XMonad.Actions.CycleWS
import XMonad.Actions.SinkAll

import qualified XMonad.StackSet as W

------------------------------------------------------------------

main::IO()
main = xmonad . ewmh $ def {
	terminal = my_terminal,
         modMask = my_mod_mask,
	borderWidth = my_border_width,
	normalBorderColor = my_normal_border_color, 
	focusedBorderColor = my_focused_border_color,
	layoutHook = my_layout_hook,
	focusFollowsMouse = my_focus_follows_mouse,
	clickJustFocuses = my_click_just_focuses }
	`additionalKeysP` my_keys

my_terminal = "kitty -1"
my_normal_border_color = "#3b4252"
my_focused_border_color = "#bc96da"
my_layout_hook = my_layout
my_focus_follows_mouse = False
my_click_just_focuses = False
my_border_width = 0
my_mod_mask = mod4Mask

my_layout = maximizeWithPadding 0 
         $ fullscreenFloat
         $ hiddenWindows 
         $ tall ||| accordion ||| tab ||| full
	where
		tall = spacing 3 $ Tall nmaster delta ratio
		accordion = spacing 3 $ Accordion
		full = Full
		tab = tabbed shrinkText my_tab_config
		nmaster = 1
		ratio = 1 / 2
		delta = 2 / 100

my_xp_config = def {
	height = 50,
	promptBorderWidth = 0
}

scratchpads = [ NS "terminal" spawn_term find_term manage_term
                , NS "docs" spawn_docs find_docs manage_docs
                ]
         where
                  spawn_term  = "kitty -1 --class scratch_terminal"
                  find_term   = className =? "scratch_terminal"
                  manage_term = customFloating $ W.RationalRect l t w h
                           where
                                    h = 0.90 -- terminal height
                                    w = 0.95 -- terminal width
                                    t = 0.05 -- distance from top edge
                                    l = 0.025 -- distance from left edge
                  spawn_docs  = "~/.local/bin/devdocs"
                  find_docs   = className =? "FFPWA-01FX9RNFXCWG4QS358C257Y11S"
                  manage_docs = customFloating $ W.RationalRect l t w h
                           where
                                    h = 0.1 -- height, 10%
                                    w = 1 -- width, 100%
                                    t = 1 - h -- distance from top edge
                                    l = (1 - w)/2 -- distance from left edge

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
		("M-l", nextNonEmptyWS),
                  ("M-h", prevNonEmptyWS),
		("M-\\", toggleWS' ["NSP"]),
		("M-c", moveTo Next EmptyWS),
		("M-S-r", spawn "xmonad --recompile && xmonad --restart")
	]
		
-- any workspace but scratchpad
notSP = (return $ ("NSP" /=) . W.tag) :: X (WindowSpace -> Bool)
shiftAndView dir = findWorkspace getSortByIndex dir (WSIs notSP) 1
        >>= \t -> (windows . W.shift $ t) >> (windows . W.greedyView $ t)

-- hidden, non-empty workspaces less scratchpad
shiftAndView' dir = findWorkspace getSortByIndexNoSP dir HiddenNonEmptyWS 1
        >>= \t -> (windows . W.shift $ t) >> (windows . W.greedyView $ t)
nextNonEmptyWS = findWorkspace getSortByIndexNoSP Next HiddenNonEmptyWS 1
        >>= \t -> (windows . W.view $ t)
prevNonEmptyWS = findWorkspace getSortByIndexNoSP Prev HiddenNonEmptyWS 1
        >>= \t -> (windows . W.view $ t)
getSortByIndexNoSP =
        fmap (.namedScratchpadFilterOutWorkspace) getSortByIndex

-- toggle any workspace but scratchpad
myToggle = windows $ W.view =<< W.tag . head . filter 
        ((\x -> x /= "NSP" && x /= "SP") . W.tag) . W.hidden