# Font and Theme
## Windows Terminal

In order to use specific font into WSL it is need to be used by the terminal host on Windows:
1. Install font on Windows -> [https://www.nerdfonts.com/](https://www.nerdfonts.com/)
2. Configure the **Windows Terminal** to use the correct font: **Settings > Wanted profiles > Appearance > Font face**

Installation of [Catppuccin Frappe theme](https://github.com/catppuccin/windows-terminal)
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
        }
    ],
    }
    ```
4. Copy the contents of *flavourtheme*.json (example:-frappetheme.json) into the opened json file under **"themes"**:
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