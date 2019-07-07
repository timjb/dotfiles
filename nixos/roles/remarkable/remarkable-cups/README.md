# Usage

The first time `rmapi` is run, it asks you for a registration code, which it then uses to obtain authentication information from reMarkable cloud and stores that in `$HOME/.rmapi`. Copy that file to the directory of this README with the name `rmapi-config`.

Then rebuild NixOS.

Then add the printer using

```bash
lpadmin -L 'Cloud Printer' -D 'My reMarkable' -p "reMarkable" -E -v 'remarkable:/Print'
```

You may have to associate the PPD (which has layout information) using your system's print configuration.