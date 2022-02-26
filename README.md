## How to run
Download `layout.ahk` and run it using either `autohotkey layout.ahk` or a double-click.
Or simply download `layout.exe` from Releases tab.

## How to use
The script uses 
* `LShift` + `LAlt` to switch between `MAIN` group of layouts.
* `LShift` + `LCtrl` to switch between `EXTRA` group of layouts.
* `RWin + 0` to `RWin + 9` to imitate Numkeys, therefore completely overwriting behaviour of `RWin` (i just don't need it, idk maybe you do)

When switching to another group, your system will use the first layout of it.

## How to modify
Edit `MAIN_LANGUAGES` and `EXTRA_LANGUAGES` variables, following the syntax `LayoutNumber: LayoutHexadecimalId, `, where
* Layouts are in the order you want to switch them.
* LayoutNumber starts at 1.
* LayoutHexadecimalId is an id of any [layout](https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/windows-language-pack-default-values?view=windows-10), installed on your system.
* Trailing zeroes can be omitted (`0x420` instead of `0x00000420`).

## Known issues
* I was unable to switch layouts while in the Start Menu.
