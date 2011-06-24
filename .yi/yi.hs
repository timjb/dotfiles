module Yi.Config.Users.TimB () where

import Prelude (map, lines)
import Yi
import Yi.Prelude
import Yi.UI.Vty (start)

myModeHook m = m
  { modeIndentSettings = IndentSettings { expandTabs = True
                                        , shiftWidth = 2
                                        , tabSize    = 2
                                        }
  }

myConfigUI = (configUI defaultConfig)
  { configFontSize = Nothing -- 'Just 10' for specifying the size.
  --, configTheme = configTheme defaultUIConfig, -- e.g. darkBlueTheme
  , configWindowFill = ' ' -- '~' - Typical for Vim
  }

myConfig = defaultVimConfig
  { startFrontEnd = start
  , modeTable = fmap (onMode myModeHook) (modeTable defaultVimConfig)
  , configUI = myConfigUI
  }

main :: IO ()
main = yi myConfig
