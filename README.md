# GETTING STARTED
Hey there! Thank you for using my library! You want to go into your executor and paste the following:
```lua
local RSV = loadstring(game:HttpGet("https://raw.githubusercontent.com/layziman/RSV-UI-LIBRARY/refs/heads/main/RSVGUI.lua"))()```
What that did is grab the core functions used for the UI.
![image](https://github.com/user-attachments/assets/41b8aa40-981a-4a2c-9e6f-aed5258c42f2)

# SETTING UP A WINDOW
To setup a window, under the loadstring variable, paste the following
You can change all the values in the script.
```lua 
local window = RSV:CreateWindow({
    Name = "MyGUI",  -- title you wanna use
    Theme = "Ocean",  -- ocean theme (my favorite!)
    Credits = "MyName"  -- your name
})```

# THEMES
We currently have 5 themes:
1. Dark               (black themed)
2. Light              (white themed)
3. Ocean              (navy blue themed)
4. Forest             (blackish-green)
5. Obsidian           (translucent theme)

You can change "Theme" in your window value to one of those!

**EXAMPLE:**
![image](https://github.com/user-attachments/assets/1dacaaff-c870-45a2-8c49-e469dc4182b2)


# CREATE A TAB

Ok, now is where it gets special. To create a tab, you want the paste the following under your window variable

```lua 
local tab = window:CreateTab("TabName", "TabDescription")```
You can change "tab" the variable name to anything! Same with description and TabName.
For now, I will call it "PlayerTab"
![image](https://github.com/user-attachments/assets/c7692b7c-a458-4100-a715-39bea462d128)


