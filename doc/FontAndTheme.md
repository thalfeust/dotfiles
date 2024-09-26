# Font and Theme
## Neovim

There is a Catppuccin theme selected by default, but it can be changed using the following command:
```bash
:Catppuccin <latte, frappe, macchiato, mocha>
```
> Every time you open Neovim, the theme will be the default.

## Windows Terminal

In order to use specific font into WSL it is need to be used by the terminal host on Windows:
1. Install font on Windows -> [https://www.nerdfonts.com/](https://www.nerdfonts.com/)
2. Configure the **Windows Terminal** to use the correct font: **Settings > Wanted profiles > Appearance > Font face**

Installation of [Catppuccin themes](https://github.com/catppuccin/windows-terminal)
1. Open **Windows Terminal** settings panel
2. Open **JSON file** at bottom left corner
3. Copy the contents of *flavour*.json (example: frappe.json) into the opened JSON file under **"schemes"**:
    ```
    {
    ..default layout
    "schemes":
    [
        {
            "name": "Catppuccin Frappe",
        
            "cursorColor": "#F2D5CF",
            "selectionBackground": "#626880",
        
            "background": "#303446",
            "foreground": "#C6D0F5",
        
            "black": "#51576D",
            "red": "#E78284",
            "green": "#A6D189",
            "yellow": "#E5C890",
            "blue": "#8CAAEE",
            "purple": "#F4B8E4",
            "cyan": "#81C8BE",
            "white": "#B5BFE2",
        
            "brightBlack": "#626880",
            "brightRed": "#E78284",
            "brightGreen": "#A6D189",
            "brightYellow": "#E5C890",
            "brightBlue": "#8CAAEE",
            "brightPurple": "#F4B8E4",
            "brightCyan": "#81C8BE",
            "brightWhite": "#A5ADCE"
        },
        {
            "name": "Catppuccin Latte",

            "cursorColor": "#DC8A78",
            "selectionBackground": "#ACB0BE",

            "background": "#EFF1F5",
            "foreground": "#4C4F69",

            "black": "#5C5F77",
            "red": "#D20F39",
            "green": "#40A02B",
            "yellow": "#DF8E1D"
            "blue": "#1E66F5",
            "purple": "#EA76CB",
            "cyan": "#179299",
            "white": "#ACB0BE",
            
            "brightBlack": "#ACB0BE",
            "brightRed": "#D20F39",
            "brightGreen": "#40A02B",
            "brightYellow": "#DF8E1D",
            "brightBlue": "#1E66F5",
            "brightPurple": "#EA76CB",
            "brightCyan": "#179299",
            "brightWhite": "#BCC0CC",
        }
    ],
    }
    ```
4. Copy the contents of *flavourtheme*.json (example: frappeTheme.json) into the opened json file under **"themes"**:
	```
    {
    ..default layout
    "themes":
    [
        {
            "name": "Catppuccin Frappe",
            "tab": {
                "background": "#303446FF",
                "showCloseButton": "always",
                "unfocusedBackground": null
            },
            "tabRow": {
                "background": "#292C3CFF",
                "unfocusedBackground": "#232634FF"
            },
            "window": {
                "applicationTheme": "dark"
            }
        }
    ],
    }
    ```
5. Save and exit
6. In the **Settings** panel under Profiles, select the profile you want to apply the theme to. **Defaults** will apply theme to all profiles.
7. Select **Appearance**
8. Choose **Frappe** in the **Color scheme** drop down menu