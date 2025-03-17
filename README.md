# GETTING STARTED
Hey there! Thank you for using my library! You want to go into your executor and paste the following:
```lua
local RSV = loadstring(game:HttpGet("https://raw.githubusercontent.com/layziman/RSV-UI-LIBRARY/refs/heads/main/RSVGUI.lua"))()
```
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
})
```

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
local tab = window:CreateTab("TabName", "TabDescription")
```


You can change "tab" the variable name to anything! Same with description and TabName.
For now, I will call it "PlayerTab"
![image](https://github.com/user-attachments/assets/c7692b7c-a458-4100-a715-39bea462d128)



# adding sliders
Lets add a slider to our code. 


For all yall non skids, this is what you can use to make a normal slider
```lua
tab:CreateSlider({
    Name = "MySlider",  
    Min = 16,            
    Max = 100,           
    Default = 16,         
    Callback = function(value)  
        print(value)
    end
})
```
You can change values to prefered 

For example, his code is a slider to change walkspeed
```lua
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:FindFirstChild("Humanoid")
local currentWalkSpeed = 16
playerTab:CreateSlider({
    Name = "Walk Speed",  -- label for slider
    Min = 16,             -- min on slider
    Max = 100,            -- max on slider
    Default = 16,         -- start on
    Callback = function(value)  
        currentWalkSpeed = value  
        if humanoid then
            humanoid.WalkSpeed = value  
        end
    end
})
```

# Create a text Label!
I dont know why anyone would use this but here
```lua
tab:CreateLabel({
    Name = "MyNameForLabel",  -- name for label (not shown on the UI)
    Text = "My text!"  -- text
})
```

# lets create a textbox!

This is for non skids:
```lua
tab:CreateTextBox({
    Name = "SampleTextBox", -- text beside
    Default = "Enter text here", -- default text in textbox
    Callback = function(text)
        print("Text entered: " .. text) -- put your function here
    end
})
```


This is an example to teleport to a specific username:
```lua
tab:CreateTextBox({
    Name = "Teleport to Player",
    Default = "Enter player name",
    Callback = function(text)
        print("Teleporting to: " .. text)
        local targetPlayer = Players:FindFirstChild(text)
        if targetPlayer and targetPlayer.Character then
            player.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
        else
            print("Player not found: " .. text)
        end
    end
})
```


# CREATE A TOGGLE
```lua
tab:CreateToggle({
    Name = "MyToggle", -- name of toggle
    Default = false, -- leave this, dont change true
    Callback = function(state)
        print("Toggle state changed to: " .. tostring(state)) -- your function when true (AKA when toggled on)
    end
})
```

# AND FINALLY, CREATING A BUTTON
```lua
tab:CreateButton({
    Name = "SampleButton", -- button name
    Size = "Large", -- large, small
    Callback = function()
        print("Button clicked!") -- function when putton clicked
    end
})
```
# WHAT CAN BE EXPECTED IN THE FUTURE? 
-drop down
-color picker


[JOIN THE DISCORD](https://discord.gg/FRTku6V8DS)
[ADD ME ON DISCORD!](https://discord.com/users/1104948638570004553)
