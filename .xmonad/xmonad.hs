import XMonad
import XMonad.Config.Gnome
import XMonad.Hooks.ManageDocks
import XMonad.Layout.IM
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Reflect
import XMonad.Util.EZConfig
import qualified XMonad.StackSet as W

myWorkspaces = ["1:code", "2:web"] ++ map show [3..8] ++ ["9:game","a:gimp","b:chat","c:media"]

myManageHook = composeAll
  [ className =? "Gimp" --> doShift "a:gimp"
  , className =? "Empathy" --> doShift "b:chat"
  , title     =? "Contact List" --> doShift "b:chat"
  , className =? "Rhythmbox" --> doShift "c:media"
  , className =? "Banshee Media Player" --> doShift "c:media"
  , className =? "Movie Player" --> doShift "c:media" ]

-- http://www.haskell.org/haskellwiki/Xmonad/General_xmonad.hs_config_tips#Binding_Workspaces_on_Function_Keys
myKeys = [ (otherModMasks ++ "M-" ++ key, action tag)
         | (tag, key) <- zip myWorkspaces (map (\x -> "<F" ++ show x ++ ">") [1..12])
         , (otherModMasks, action) <- [ ("", windows . W.greedyView) -- or W.view
                                      , ("S-", windows . W.shift)]
         ]

main = xmonad $ gnomeConfig
  { workspaces = myWorkspaces
  , manageHook = manageDocks <+> myManageHook
  , layoutHook = onWorkspace "a:gimp" gimp $ layoutHook gnomeConfig
  , terminal   = "xterm"
  } `additionalKeysP` myKeys
  where
    gimp = withIM (0.18) (Role "gimp-toolbox") $
           reflectHoriz $
           withIM (0.22) (Role "gimp-dock") Full
