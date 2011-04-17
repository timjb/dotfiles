import XMonad
import XMonad.Config.Gnome
import XMonad.Hooks.ManageDocks
import XMonad.Layout.IM
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Reflect

myWorkspaces = ["1:code", "2:web"] ++ map show [3..8] ++ ["9:gimp"]

myManageHook = composeAll
  [ className =? "Gimp" --> doShift "9:gimp" ]

main = xmonad gnomeConfig
  { workspaces = myWorkspaces
  , manageHook = manageDocks <+> myManageHook
  , layoutHook = onWorkspace "9:gimp" gimp $ layoutHook gnomeConfig
  , terminal = "xterm"
  }
  where
    gimp = withIM (0.18) (Role "gimp-toolbox") $
           reflectHoriz $
           withIM (0.22) (Role "gimp-dock") Full
