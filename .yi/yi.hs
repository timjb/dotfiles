import Yi
import Yi.Prelude
import Yi.UI.Vty (start)

myConfig = defaultVimConfig
  { startFrontEnd = start
  , configUI = myConfigUI
  }

myConfigUI = (configUI defaultConfig)
  { configFontSize = Nothing -- 'Just 10' for specifying the size.
  --, configTheme = configTheme defaultUIConfig, -- e.g. darkBlueTheme
  , configWindowFill = ' ' -- '~' - Typical for Vim
  }

main :: IO ()
main = yi myConfig
