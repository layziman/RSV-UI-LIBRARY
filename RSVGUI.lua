local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local MarketplaceService = game:GetService("MarketplaceService")
local player = Players.LocalPlayer

local RSV = {}

function RSV:CreateWindow(options)
    local name = options.Name or "MyGUI"
    local theme = options.Theme or "Dark"
    local credits = options.Credits or "RSV"

    local themes = {
        Dark = {
            MainFrameColor = Color3.fromRGB(25, 25, 30),
            MainGradient = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 30)), ColorSequenceKeypoint.new(1, Color3.fromRGB(35, 35, 40))},
            BottomBarColor = Color3.fromRGB(30, 30, 35),
            BottomBarGradient = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 35)), ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 40, 45))},
            HomeBackgroundColor = Color3.fromRGB(20, 20, 25),
            HomeGradient = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 20, 25)), ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 35))},
            SliderFrameColor = Color3.fromRGB(35, 35, 40),
            SliderGradient = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 45)), ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 35))},
            SliderBarColor = Color3.fromRGB(50, 50, 55),
            TextColor = Color3.fromRGB(255, 255, 255),
            SubTextColor = Color3.fromRGB(150, 150, 150),
            Transparency = 0
        },
        Light = {
            MainFrameColor = Color3.fromRGB(240, 240, 240),
            MainGradient = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(240, 240, 240)), ColorSequenceKeypoint.new(1, Color3.fromRGB(220, 220, 220))},
            BottomBarColor = Color3.fromRGB(200, 200, 200),
            BottomBarGradient = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 200, 200)), ColorSequenceKeypoint.new(1, Color3.fromRGB(180, 180, 180))},
            HomeBackgroundColor = Color3.fromRGB(230, 230, 230),
            HomeGradient = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(230, 230, 230)), ColorSequenceKeypoint.new(1, Color3.fromRGB(210, 210, 210))},
            SliderFrameColor = Color3.fromRGB(220, 220, 220),
            SliderGradient = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(230, 230, 230)), ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 200, 200))},
            SliderBarColor = Color3.fromRGB(180, 180, 180),
            TextColor = Color3.fromRGB(0, 0, 0),
            SubTextColor = Color3.fromRGB(100, 100, 100),
            Transparency = 0
        },
        Ocean = {
            MainFrameColor = Color3.fromRGB(40, 70, 100),
            MainGradient = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 70, 100)), ColorSequenceKeypoint.new(1, Color3.fromRGB(50, 90, 120))},
            BottomBarColor = Color3.fromRGB(50, 80, 110),
            BottomBarGradient = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 80, 110)), ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 100, 130))},
            HomeBackgroundColor = Color3.fromRGB(30, 60, 90),
            HomeGradient = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 60, 90)), ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 80, 110))},
            SliderFrameColor = Color3.fromRGB(50, 90, 120),
            SliderGradient = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(60, 100, 130)), ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 80, 110))},
            SliderBarColor = Color3.fromRGB(70, 110, 140),
            TextColor = Color3.fromRGB(255, 255, 255),
            SubTextColor = Color3.fromRGB(180, 210, 240),
            Transparency = 0
        },
        Forest = {
            MainFrameColor = Color3.fromRGB(34, 45, 34),
            MainGradient = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(34, 45, 34)), ColorSequenceKeypoint.new(1, Color3.fromRGB(44, 55, 44))},
            BottomBarColor = Color3.fromRGB(40, 50, 40),
            BottomBarGradient = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 50, 40)), ColorSequenceKeypoint.new(1, Color3.fromRGB(50, 60, 50))},
            HomeBackgroundColor = Color3.fromRGB(30, 40, 30),
            HomeGradient = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 40, 30)), ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 50, 40))},
            SliderFrameColor = Color3.fromRGB(44, 55, 44),
            SliderGradient = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 60, 50)), ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 50, 40))},
            SliderBarColor = Color3.fromRGB(60, 70, 60),
            TextColor = Color3.fromRGB(255, 255, 255),
            SubTextColor = Color3.fromRGB(150, 180, 150),
            Transparency = 0
        },
        Obsidian = {
            MainFrameColor = Color3.fromRGB(10, 10, 15),
            MainGradient = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(10, 10, 15)), ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 25))},
            BottomBarColor = Color3.fromRGB(15, 15, 20),
            BottomBarGradient = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 15, 20)), ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 30))},
            HomeBackgroundColor = Color3.fromRGB(5, 5, 10),
            HomeGradient = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(5, 5, 10)), ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 20))},
            SliderFrameColor = Color3.fromRGB(20, 20, 25),
            SliderGradient = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 30)), ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 20))},
            SliderBarColor = Color3.fromRGB(30, 30, 35),
            TextColor = Color3.fromRGB(255, 255, 255),
            SubTextColor = Color3.fromRGB(200, 200, 200),
            Transparency = 0.5
        }
    }

    local selectedTheme = themes[theme] or themes.Dark

    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = player:WaitForChild("PlayerGui")
    screenGui.ResetOnSpawn = false
    screenGui.Name = name .. "_UI"
    screenGui.Enabled = true 

    local topFrame = Instance.new("Frame")
    topFrame.Parent = screenGui
    topFrame.Size = UDim2.new(1, 0, 0.07, 0)
    topFrame.Position = UDim2.new(0, 0, 0, 0)
    topFrame.BackgroundColor3 = Color3.fromRGB(255, 147, 0)
    topFrame.BackgroundTransparency = 1
    topFrame.BorderSizePixel = 0

    local mainText = Instance.new("TextLabel")
    mainText.Parent = topFrame
    mainText.Size = UDim2.new(0.2, 0, 0.04, 0)
    mainText.Position = UDim2.new(0.5, 0, 0.015, 0)
    mainText.BackgroundTransparency = 1
    mainText.Text = name
    mainText.TextColor3 = Color3.fromRGB(0, 0, 0)
    mainText.Font = Enum.Font.SourceSansBold
    mainText.TextSize = 24
    mainText.TextScaled = true

    local subText = Instance.new("TextLabel")
    subText.Parent = topFrame
    subText.Size = UDim2.new(0.2, 0, 0.03, 0)
    subText.Position = UDim2.new(0.5, 0, 0.045, 0)
    subText.BackgroundTransparency = 1
    subText.Text = "made by " .. credits
    subText.TextColor3 = Color3.fromRGB(255, 255, 255)
    subText.Font = Enum.Font.SourceSansBold
    subText.TextSize = 16
    subText.TextScaled = true

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0.35, 0, 0.5, 0)
    mainFrame.Position = UDim2.new(-0.35, 0, 0.07, 0)
    mainFrame.BackgroundColor3 = selectedTheme.MainFrameColor
    mainFrame.BackgroundTransparency = selectedTheme.Transparency
    mainFrame.BorderSizePixel = 0
    mainFrame.ClipsDescendants = true
    mainFrame.Parent = screenGui
    mainFrame.ZIndex = 1

    local mainCorner = Instance.new("UICorner")
    mainCorner.CornerRadius = UDim.new(0.03, 0)
    mainCorner.Parent = mainFrame

    local mainGradient = Instance.new("UIGradient")
    mainGradient.Color = selectedTheme.MainGradient
    mainGradient.Rotation = 90
    mainGradient.Parent = mainFrame

    local mainStroke = Instance.new("UIStroke")
    mainStroke.Thickness = 2
    mainStroke.Color = Color3.fromRGB(50, 50, 60)
    mainStroke.Transparency = 0.7
    mainStroke.Parent = mainFrame

    local bottomBar = Instance.new("Frame")
    bottomBar.Size = UDim2.new(0.0875, 0, 0.07, 0)
    bottomBar.Position = UDim2.new(0.5, 0, 0.93, 0)
    bottomBar.BackgroundColor3 = selectedTheme.BottomBarColor
    bottomBar.BackgroundTransparency = selectedTheme.Transparency
    bottomBar.BorderSizePixel = 0
    bottomBar.Parent = screenGui
    bottomBar.ZIndex = 2

    local bottomBarCorner = Instance.new("UICorner")
    bottomBarCorner.CornerRadius = UDim.new(0.02, 0)
    bottomBarCorner.Parent = bottomBar

    local bottomBarGradient = Instance.new("UIGradient")
    bottomBarGradient.Color = selectedTheme.BottomBarGradient
    bottomBarGradient.Rotation = 90
    bottomBarGradient.Parent = bottomBar

    local highlight = Instance.new("Frame")
    highlight.Size = UDim2.new(0.0875, 0, 1, 0)
    highlight.Position = UDim2.new(0, 0, 0, 0)
    highlight.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
    highlight.BorderSizePixel = 0
    highlight.Parent = bottomBar
    highlight.ZIndex = 3

    local highlightCorner = Instance.new("UICorner")
    highlightCorner.CornerRadius = UDim.new(0.015, 0)
    highlightCorner.Parent = highlight

    local highlightGradient = Instance.new("UIGradient")
    highlightGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 150, 200))}
    highlightGradient.Rotation = 45
    highlightGradient.Parent = highlight

    local window = {
        MainFrame = mainFrame,
        ScreenGui = screenGui,
        Tabs = {},
        CurrentTab = nil,
        BottomBar = bottomBar,
        Highlight = highlight,
        ActiveIndex = 1,
        StartTime = os.time(),
        Theme = selectedTheme
    }

    function window:CreateTab(name, description)
        local tabCount = #self.Tabs + 1
        local newWidth = tabCount * 0.0875
        bottomBar.Size = UDim2.new(newWidth, 0, 0.07, 0)
        bottomBar.Position = UDim2.new(0.5, 0, 0.93, 0)

        local tabFrame = Instance.new("ScrollingFrame")
        tabFrame.Size = UDim2.new(0.94, 0, 0.85, 0)
        tabFrame.Position = UDim2.new(0.03, 0, 0.125, 0)
        tabFrame.BackgroundTransparency = 1
        tabFrame.ScrollBarThickness = 5
        tabFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 105, 180)
        tabFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
        tabFrame.Parent = mainFrame
        tabFrame.Visible = false
        tabFrame.ZIndex = 2

        local tabButton = Instance.new("TextButton")
        tabButton.Size = UDim2.new(0.0875, 0, 1, 0)
        tabButton.Position = UDim2.new((#self.Tabs * 0.0875), 0, 0, 0)
        tabButton.BackgroundTransparency = 1
        tabButton.Text = name == "Home" and "Home" or name
        tabButton.TextColor3 = window.Theme == themes.Light and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)
        tabButton.Font = Enum.Font.GothamBold
        tabButton.TextSize = 16
        tabButton.TextScaled = true
        tabButton.BorderSizePixel = 0
        tabButton.Parent = bottomBar
        tabButton.ZIndex = 4

        local descLabel = Instance.new("TextLabel")
        descLabel.Size = UDim2.new(0.15, 0, 0.04, 0)
        descLabel.Position = UDim2.new(0.5, 0, -0.6, 0)
        descLabel.BackgroundColor3 = window.Theme.BottomBarColor
        descLabel.BackgroundTransparency = window.Theme.Transparency
        descLabel.BorderSizePixel = 0
        descLabel.Text = description or "No description"
        descLabel.TextColor3 = window.Theme.TextColor
        descLabel.Font = Enum.Font.Gotham
        descLabel.TextSize = 14
        descLabel.TextScaled = true
        descLabel.TextWrapped = true
        descLabel.Visible = false
        descLabel.Parent = tabButton
        descLabel.ZIndex = 5

        local descCorner = Instance.new("UICorner")
        descCorner.CornerRadius = UDim.new(0.01, 0)
        descCorner.Parent = descLabel

        tabButton.MouseEnter:Connect(function()
            descLabel.Visible = true
        end)

        tabButton.MouseLeave:Connect(function()
            descLabel.Visible = false
        end)

        local tab = {
            Frame = tabFrame,
            Button = tabButton,
            Name = name,
            Elements = {}
        }

        table.insert(self.Tabs, tab)
        if not self.CurrentTab then
            self.CurrentTab = tab
            tab.Frame.Visible = true
            tabButton.TextColor3 = window.Theme == themes.Light and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)
        end

        tabButton.MouseButton1Click:Connect(function()
            if self.CurrentTab ~= tab then
                local oldTab = self.CurrentTab
                oldTab.Button.TextColor3 = window.Theme == themes.Light and Color3.fromRGB(100, 100, 100) or Color3.fromRGB(150, 150, 150)
                local oldTween = TweenService:Create(oldTab.Frame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(-1, 0, 0.125, 0)})
                oldTween:Play()
                oldTween.Completed:Connect(function()
                    oldTab.Frame.Visible = false
                end)

                tab.Frame.Visible = true
                tab.Frame.Position = UDim2.new(1, 0, 0.125, 0)
                TweenService:Create(tab.Frame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.03, 0, 0.125, 0)}):Play()
                tabButton.TextColor3 = window.Theme == themes.Light and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)
                self.CurrentTab = tab
                self.ActiveIndex = table.find(self.Tabs, tab)
                local targetPosition = UDim2.new((self.ActiveIndex - 1) * 0.0875, 0, 0, 0)
                TweenService:Create(highlight, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = targetPosition}):Play()
            end
        end)

        function tab:CreateSlider(options)
            local name = options.Name or "Slider"
            local min = options.Min or 0
            local max = options.Max or 100
            local default = options.Default or min
            local callback = options.Callback or function() end

            local sliderFrame = Instance.new("Frame")
            sliderFrame.Size = UDim2.new(0.85, 0, 0.075, 0)
            sliderFrame.Position = UDim2.new(0.05, 0, (#self.Elements * 0.085), 0)
            sliderFrame.BackgroundColor3 = window.Theme.SliderFrameColor
            sliderFrame.BackgroundTransparency = window.Theme.Transparency
            sliderFrame.BorderSizePixel = 0
            sliderFrame.Parent = self.Frame
            sliderFrame.ZIndex = 3
            sliderFrame.Visible = true

            self.Frame.CanvasSize = UDim2.new(0, 0, (#self.Elements + 1) * 0.085, 0)

            local sliderCorner = Instance.new("UICorner")
            sliderCorner.CornerRadius = UDim.new(0.015, 0)
            sliderCorner.Parent = sliderFrame

            local sliderGradient = Instance.new("UIGradient")
            sliderGradient.Color = window.Theme.SliderGradient
            sliderGradient.Rotation = 90
            sliderGradient.Parent = sliderFrame

            local sliderLabel = Instance.new("TextLabel")
            sliderLabel.Size = UDim2.new(0.8, 0, 0.025, 0)
            sliderLabel.Position = UDim2.new(0.03, 0, 0.01, 0)
            sliderLabel.BackgroundTransparency = 1
            sliderLabel.Text = name .. ": " .. default
            sliderLabel.TextColor3 = window.Theme.TextColor
            sliderLabel.Font = Enum.Font.GothamBold
            sliderLabel.TextSize = 16
            sliderLabel.TextScaled = true
            sliderLabel.TextXAlignment = Enum.TextXAlignment.Left
            sliderLabel.Parent = sliderFrame
            sliderLabel.ZIndex = 4
            sliderLabel.Visible = true

            local sliderBar = Instance.new("Frame")
            sliderBar.Size = UDim2.new(0.75, 0, 0.01, 0)
            sliderBar.Position = UDim2.new(0.05, 0, 0.045, 0)
            sliderBar.BackgroundColor3 = window.Theme.SliderBarColor
            sliderBar.BorderSizePixel = 0
            sliderBar.Parent = sliderFrame
            sliderBar.ZIndex = 4
            sliderBar.Visible = true

            local barCorner = Instance.new("UICorner")
            barCorner.CornerRadius = UDim.new(0.005, 0)
            barCorner.Parent = sliderBar

            local sliderFill = Instance.new("Frame")
            sliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
            sliderFill.Position = UDim2.new(0, 0, 0, 0)
            sliderFill.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
            sliderFill.BorderSizePixel = 0
            sliderFill.Parent = sliderBar
            sliderFill.ZIndex = 4
            sliderFill.Visible = true

            local fillCorner = Instance.new("UICorner")
            fillCorner.CornerRadius = UDim.new(0.005, 0)
            fillCorner.Parent = sliderFill

            local fillGradient = Instance.new("UIGradient")
            fillGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 80, 150))}
            fillGradient.Rotation = 45
            fillGradient.Parent = sliderFill

            local sliderHandle = Instance.new("Frame")
            sliderHandle.Size = UDim2.new(0.015, 0, 0.02, 0)
            sliderHandle.Position = UDim2.new((default - min) / (max - min), 0, -0.005, 0)
            sliderHandle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            sliderHandle.BorderSizePixel = 0
            sliderHandle.Parent = sliderBar
            sliderHandle.ZIndex = 5
            sliderHandle.Visible = true

            local handleCorner = Instance.new("UICorner")
            handleCorner.CornerRadius = UDim.new(0.01, 0)
            handleCorner.Parent = sliderHandle

            local handleGradient = Instance.new("UIGradient")
            handleGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 200, 200))}
            handleGradient.Rotation = 0
            handleGradient.Parent = sliderHandle

            local handleStroke = Instance.new("UIStroke")
            handleStroke.Thickness = 2
            handleStroke.Color = Color3.fromRGB(255, 105, 180)
            handleStroke.Parent = sliderHandle

            local dragging = false
            sliderHandle.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = true
                end
            end)

            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = false
                end
            end)

            RunService.RenderStepped:Connect(function()
                if dragging then
                    local mousePos = UserInputService:GetMouseLocation()
                    local sliderPos = sliderBar.AbsolutePosition
                    local sliderSize = sliderBar.AbsoluteSize.X
                    local newX = math.clamp(mousePos.X - sliderPos.X, 0, sliderSize)
                    local percentage = newX / sliderSize
                    sliderHandle.Position = UDim2.new(percentage, 0, -0.005, 0)
                    sliderFill.Size = UDim2.new(percentage, 0, 1, 0)
                    local value = math.floor(min + (max - min) * percentage)
                    sliderLabel.Text = name .. ": " .. value
                    callback(value)
                end
            end)

            table.insert(self.Elements, sliderFrame)
            return sliderFrame
        end

        function tab:CreateToggle(options)
            local name = options.Name or "Toggle"
            local default = options.Default or false
            local callback = options.Callback or function() end

            local toggleFrame = Instance.new("Frame")
            toggleFrame.Size = UDim2.new(0.85, 0, 0.065, 0)
            toggleFrame.Position = UDim2.new(0.05, 0, (#self.Elements * 0.085), 0)
            toggleFrame.BackgroundColor3 = window.Theme.MainFrameColor
            toggleFrame.BackgroundTransparency = window.Theme.Transparency
            toggleFrame.Parent = self.Frame
            toggleFrame.ZIndex = 3
            toggleFrame.Visible = true

            local toggleGradient = Instance.new("UIGradient")
            toggleGradient.Color = window.Theme.MainGradient
            toggleGradient.Rotation = 90
            toggleGradient.Parent = toggleFrame

            local toggleCorner = Instance.new("UICorner")
            toggleCorner.CornerRadius = UDim.new(0.01, 0)
            toggleCorner.Parent = toggleFrame

            self.Frame.CanvasSize = UDim2.new(0, 0, (#self.Elements + 1) * 0.085, 0)

            local toggleLabel = Instance.new("TextLabel")
            toggleLabel.Size = UDim2.new(0.75, 0, 0.065, 0)
            toggleLabel.Position = UDim2.new(0.1, 0, 0, 0)
            toggleLabel.BackgroundTransparency = 1
            toggleLabel.Text = name
            toggleLabel.TextColor3 = window.Theme.TextColor
            toggleLabel.Font = Enum.Font.GothamBold
            toggleLabel.TextSize = 14
            toggleLabel.TextScaled = true
            toggleLabel.TextXAlignment = Enum.TextXAlignment.Left
            toggleLabel.Parent = toggleFrame
            toggleLabel.ZIndex = 4
            toggleLabel.Visible = true

            local checkbox = Instance.new("TextButton")
            checkbox.Size = UDim2.new(0.05, 0, 0.025, 0)
            checkbox.Position = UDim2.new(0.03, 0, 0.02, 0)
            checkbox.BackgroundColor3 = default and Color3.fromRGB(50, 150, 50) or window.Theme.SliderFrameColor
            checkbox.BackgroundTransparency = window.Theme.Transparency
            checkbox.BorderSizePixel = 0
            checkbox.Text = default and "✔" or ""
            checkbox.TextColor3 = window.Theme.TextColor
            checkbox.Font = Enum.Font.Gotham
            checkbox.TextSize = 14
            checkbox.TextScaled = true
            checkbox.Parent = toggleFrame
            checkbox.ZIndex = 4
            checkbox.Visible = true

            local checkboxCorner = Instance.new("UICorner")
            checkboxCorner.CornerRadius = UDim.new(0.005, 0)
            checkboxCorner.Parent = checkbox

            local checkboxGradient = Instance.new("UIGradient")
            checkboxGradient.Color = default and ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 150, 50)), ColorSequenceKeypoint.new(1, Color3.fromRGB(70, 170, 70))} or window.Theme.SliderGradient
            checkboxGradient.Rotation = 90
            checkboxGradient.Parent = checkbox

            local state = default
            checkbox.MouseButton1Click:Connect(function()
                state = not state
                checkbox.Text = state and "✔" or ""
                checkbox.BackgroundColor3 = state and Color3.fromRGB(50, 150, 50) or window.Theme.SliderFrameColor
                checkboxGradient.Color = state and ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 150, 50)), ColorSequenceKeypoint.new(1, Color3.fromRGB(70, 170, 70))} or window.Theme.SliderGradient
                callback(state)
            end)

            table.insert(self.Elements, toggleFrame)
            return toggleFrame
        end

        function tab:CreateButton(options)
            local name = options.Name or "Button"
            local size = options.Size or "Large"
            local callback = options.Callback or function() end

            local buttonFrame = Instance.new("Frame")
            buttonFrame.Size = UDim2.new(0.85, 0, size == "Small" and 0.04 or 0.065, 0)
            buttonFrame.Position = UDim2.new(0.05, 0, (#self.Elements * 0.085), 0)
            buttonFrame.BackgroundTransparency = 1
            buttonFrame.Parent = self.Frame
            buttonFrame.ZIndex = 3
            buttonFrame.Visible = true

            self.Frame.CanvasSize = UDim2.new(0, 0, (#self.Elements + 1) * 0.085, 0)

            local button = Instance.new("TextButton")
            button.Size = UDim2.new(size == "Small" and 0.37 or 0.75, 0, size == "Small" and 0.025 or 0.05, 0)
            button.Position = UDim2.new(size == "Small" and 0.24 or 0.05, 0, size == "Small" and 0.0075 or 0.0075, 0)
            button.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
            button.BorderSizePixel = 0
            button.Text = name
            button.TextColor3 = window.Theme.TextColor
            button.Font = Enum.Font.GothamBold
            button.TextSize = size == "Small" and 14 or 16
            button.TextScaled = true
            button.Parent = buttonFrame
            button.ZIndex = 4
            button.Visible = true

            local buttonCorner = Instance.new("UICorner")
            buttonCorner.CornerRadius = UDim.new(0.01, 0)
            buttonCorner.Parent = button

            local buttonGradient = Instance.new("UIGradient")
            buttonGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 80, 150))}
            buttonGradient.Rotation = 45
            buttonGradient.Parent = button

            button.MouseButton1Click:Connect(function()
                callback()
            end)

            table.insert(self.Elements, buttonFrame)
            return buttonFrame
        end

        function tab:CreateLabel(options)
            local text = options.Text or "Label"
            
            local labelFrame = Instance.new("Frame")
            labelFrame.Size = UDim2.new(0.85, 0, 0.04, 0)
            labelFrame.Position = UDim2.new(0.05, 0, (#self.Elements * 0.085), 0)
            labelFrame.BackgroundTransparency = 1
            labelFrame.Parent = self.Frame
            labelFrame.ZIndex = 3
            labelFrame.Visible = true

            self.Frame.CanvasSize = UDim2.new(0, 0, (#self.Elements + 1) * 0.085, 0)

            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(0.8, 0, 0.04, 0)
            label.Position = UDim2.new(0.03, 0, 0, 0)
            label.BackgroundTransparency = 1
            label.Text = text
            label.TextColor3 = window.Theme.TextColor
            label.Font = Enum.Font.Gotham
            label.TextSize = 14
            label.TextScaled = true
            label.TextXAlignment = Enum.TextXAlignment.Left
            label.Parent = labelFrame
            label.ZIndex = 4
            label.Visible = true

            table.insert(self.Elements, labelFrame)
            return labelFrame
        end

        function tab:CreateTextBox(options)
            local name = options.Name or "TextBox"
            local default = options.Default or ""
            local callback = options.Callback or function() end

            local textBoxFrame = Instance.new("Frame")
            textBoxFrame.Size = UDim2.new(0.85, 0, 0.065, 0)
            textBoxFrame.Position = UDim2.new(0.05, 0, (#self.Elements * 0.085), 0)
            textBoxFrame.BackgroundTransparency = 1
            textBoxFrame.Parent = self.Frame
            textBoxFrame.ZIndex = 3
            textBoxFrame.Visible = true

            self.Frame.CanvasSize = UDim2.new(0, 0, (#self.Elements + 1) * 0.085, 0)

            local textBoxLabel = Instance.new("TextLabel")
            textBoxLabel.Size = UDim2.new(0.28, 0, 0.025, 0)
            textBoxLabel.Position = UDim2.new(0.03, 0, 0.01, 0)
            textBoxLabel.BackgroundTransparency = 1
            textBoxLabel.Text = name
            textBoxLabel.TextColor3 = window.Theme.TextColor
            textBoxLabel.Font = Enum.Font.GothamBold
            textBoxLabel.TextSize = 14
            textBoxLabel.TextScaled = true
            textBoxLabel.TextXAlignment = Enum.TextXAlignment.Left
            textBoxLabel.Parent = textBoxFrame
            textBoxLabel.ZIndex = 4
            textBoxLabel.Visible = true

            local textBox = Instance.new("TextBox")
            textBox.Size = UDim2.new(0.48, 0, 0.04, 0)
            textBox.Position = UDim2.new(0.34, 0, 0.015, 0)
            textBox.BackgroundColor3 = window.Theme.SliderFrameColor
            textBox.BackgroundTransparency = window.Theme.Transparency
            textBox.BorderSizePixel = 0
            textBox.Text = default
            textBox.TextColor3 = window.Theme.TextColor
            textBox.Font = Enum.Font.Gotham
            textBox.TextSize = 14
            textBox.TextScaled = true
            textBox.Parent = textBoxFrame
            textBox.ZIndex = 4
            textBox.Visible = true

            local textBoxCorner = Instance.new("UICorner")
            textBoxCorner.CornerRadius = UDim.new(0.005, 0)
            textBoxCorner.Parent = textBox

            local textBoxGradient = Instance.new("UIGradient")
            textBoxGradient.Color = window.Theme.SliderGradient
            textBoxGradient.Rotation = 90
            textBoxGradient.Parent = textBox

            textBox.FocusLost:Connect(function(enterPressed)
                if enterPressed then
                    callback(textBox.Text)
                end
            end)

            table.insert(self.Elements, textBoxFrame)
            return textBoxFrame
        end

        return tab
    end

    function window:Toggle()
        if mainFrame.Position.X.Scale == -0.35 then
            TweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.02, 0, 0.07, 0)}):Play()
            TweenService:Create(bottomBar, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 0, 0.86, 0)}):Play()
        else
            TweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(-0.35, 0, 0.07, 0)}):Play()
            TweenService:Create(bottomBar, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 0, 0.93, 0)}):Play()
        end
    end

    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if not gameProcessed and input.KeyCode == Enum.KeyCode.K then
            window:Toggle()
        end
    end)

    local homeTab = window:CreateTab("Home", "Welcome to " .. name)
    local homeBackground = Instance.new("Frame")
    homeBackground.Size = UDim2.new(1, 0, 1, 0)
    homeBackground.BackgroundColor3 = selectedTheme.HomeBackgroundColor
    homeBackground.BackgroundTransparency = selectedTheme.Transparency
    homeBackground.BorderSizePixel = 0
    homeBackground.Parent = homeTab.Frame
    homeBackground.ZIndex = 1
    homeBackground.Visible = true

    local homeCorner = Instance.new("UICorner")
    homeCorner.CornerRadius = UDim.new(0.02, 0)
    homeCorner.Parent = homeBackground

    local homeGradient = Instance.new("UIGradient")
    homeGradient.Color = selectedTheme.HomeGradient
    homeGradient.Rotation = 90
    homeGradient.Parent = homeBackground

    local avatarImage = Instance.new("ImageLabel")
    avatarImage.Size = UDim2.new(0.22, 0, 0.2, 0)
    avatarImage.Position = UDim2.new(0.39, 0, 0.025, 0)
    avatarImage.BackgroundTransparency = 1
    avatarImage.Image = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
    avatarImage.Parent = homeTab.Frame
    avatarImage.ZIndex = 2
    avatarImage.Visible = true

    local avatarCorner = Instance.new("UICorner")
    avatarCorner.CornerRadius = UDim.new(1, 0)
    avatarCorner.Parent = avatarImage

    local avatarStroke = Instance.new("UIStroke")
    avatarStroke.Thickness = 3
    avatarStroke.Color = Color3.fromRGB(88, 101, 242)
    avatarStroke.Parent = avatarImage

    local displayName = Instance.new("TextLabel")
    displayName.Size = UDim2.new(0.85, 0, 0.04, 0)
    displayName.Position = UDim2.new(0.05, 0, 0.235, 0)
    displayName.BackgroundTransparency = 1
    displayName.Text = player.DisplayName
    displayName.TextColor3 = selectedTheme.TextColor
    displayName.Font = Enum.Font.GothamBold
    displayName.TextSize = 20
    displayName.TextScaled = true
    displayName.TextXAlignment = Enum.TextXAlignment.Center
    displayName.Parent = homeTab.Frame
    displayName.ZIndex = 2
    displayName.Visible = true

    local realUsername = Instance.new("TextLabel")
    realUsername.Size = UDim2.new(0.85, 0, 0.025, 0)
    realUsername.Position = UDim2.new(0.05, 0, 0.31, 0)
    realUsername.BackgroundTransparency = 1
    realUsername.Text = "@" .. player.Name
    realUsername.TextColor3 = selectedTheme.SubTextColor
    realUsername.Font = Enum.Font.Gotham
    realUsername.TextSize = 14
    realUsername.TextScaled = true
    realUsername.TextXAlignment = Enum.TextXAlignment.Center
    realUsername.Parent = homeTab.Frame
    realUsername.ZIndex = 2
    realUsername.Visible = true

    local serverPlayers = Instance.new("TextLabel")
    serverPlayers.Size = UDim2.new(0.85, 0, 0.025, 0)
    serverPlayers.Position = UDim2.new(0.05, 0, 0.36, 0)
    serverPlayers.BackgroundTransparency = 1
    serverPlayers.Text = #Players:GetPlayers() .. "/" .. game.Players.MaxPlayers .. " players"
    serverPlayers.TextColor3 = selectedTheme.TextColor
    serverPlayers.Font = Enum.Font.Gotham
    serverPlayers.TextSize = 14
    serverPlayers.TextScaled = true
    serverPlayers.TextXAlignment = Enum.TextXAlignment.Center
    serverPlayers.Parent = homeTab.Frame
    serverPlayers.ZIndex = 2
    serverPlayers.Visible = true

    local elapsedTime = Instance.new("TextLabel")
    elapsedTime.Size = UDim2.new(0.85, 0, 0.025, 0)
    elapsedTime.Position = UDim2.new(0.05, 0, 0.41, 0)
    elapsedTime.BackgroundTransparency = 1
    elapsedTime.Text = "0 seconds elapsed"
    elapsedTime.TextColor3 = selectedTheme.TextColor
    elapsedTime.Font = Enum.Font.Gotham
    elapsedTime.TextSize = 14
    elapsedTime.TextScaled = true
    elapsedTime.TextXAlignment = Enum.TextXAlignment.Center
    elapsedTime.Parent = homeTab.Frame
    elapsedTime.ZIndex = 2
    elapsedTime.Visible = true

    local gameNameLabel = Instance.new("TextLabel")
    gameNameLabel.Size = UDim2.new(0.85, 0, 0.025, 0)
    gameNameLabel.Position = UDim2.new(0.05, 0, 0.46, 0)
    gameNameLabel.BackgroundTransparency = 1
    gameNameLabel.Text = "Connected to: <b>Loading...</b>"
    gameNameLabel.TextColor3 = selectedTheme.TextColor
    gameNameLabel.Font = Enum.Font.Gotham
    gameNameLabel.TextSize = 14
    gameNameLabel.TextScaled = true
    gameNameLabel.TextXAlignment = Enum.TextXAlignment.Center
    gameNameLabel.RichText = true
    gameNameLabel.Parent = homeTab.Frame
    gameNameLabel.ZIndex = 2
    gameNameLabel.Visible = true

    local changelogLabel = Instance.new("TextLabel")
    changelogLabel.Size = UDim2.new(0.85, 0, 0.125, 0)
    changelogLabel.Position = UDim2.new(0.05, 0, 0.51, 0)
    changelogLabel.BackgroundTransparency = 1
    changelogLabel.Text = "Changelog:\n- v1.0: Initial release\n- v1.1: Added new themes\n- v1.2: Improved UI responsiveness"
    changelogLabel.TextColor3 = selectedTheme.TextColor
    changelogLabel.Font = Enum.Font.Gotham
    changelogLabel.TextSize = 14
    changelogLabel.TextScaled = true
    changelogLabel.TextXAlignment = Enum.TextXAlignment.Left
    changelogLabel.TextYAlignment = Enum.TextYAlignment.Top
    changelogLabel.Parent = homeTab.Frame
    changelogLabel.ZIndex = 2
    changelogLabel.Visible = true

    local function updateGameInfo()
        local success, gameInfo = pcall(function()
            return MarketplaceService:GetProductInfo(game.PlaceId)
        end)
        if success and gameInfo then
            gameNameLabel.Text = "Connected to: <b>" .. gameInfo.Name .. "</b>"
        else
            gameNameLabel.Text = "Connected to: <b>Unknown Game</b>"
        end
    end

    updateGameInfo()

    spawn(function()
        while wait(1) do
            serverPlayers.Text = #Players:GetPlayers() .. "/" .. game.Players.MaxPlayers .. " players"
            local elapsed = os.time() - window.StartTime
            elapsedTime.Text = elapsed .. " seconds elapsed"
        end
    end)

    window:Toggle()

    return window
end

return RSV
