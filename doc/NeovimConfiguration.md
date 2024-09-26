# Neovim Configuration
## Keymaps

Some keymaps have been added to ease the utilization of Neovim:
* `Ctrl + movement` for the windows navigation
* `Ctrl + arrows` for resizing of the windows
* `Shift + m|i` for switching of current files
* `Alt + n|e` for moving line up and down
* `qq` to exit insert mode
* Pasting in visual mode do not change the yanked text

### Keyboard layouts

The Neovim configuration is compatible with two layouts: QWERTY and my custom Planck Colemak Wide mod-DH.
To access either configuration, the nvim executable has been replaced by a script that accepts two options:
* `--qwerty`: to set keymaps QWERTY compatible
* `--colemak` (default): to set keymaps compatible with my Planck keyboard

> Example: `nvim --qwerty path/to/file`

### Colemak adjustment

The Neovim keymap configuration requires some adjustments, in the **Normal** mode, for the Colemak layout:

|  Key  | Previous | Action                                         |
| :---: | :------: |:---------------------------------------------- |
| **m** |     h    | `<Left>`                                       |
| **n** |     j    | `<Down>`                                       |
| **e** |     k    | `<Up>`                                         |
| **i** |     l    | `<Right>`                                      |
| **j** |     n    | Repeat the latest "/" or "?" [count] times     |
| **k** |     e    | Forward to the end of the word (@todo replace) |
| **l** |     i    | Insert text before cursor                      |