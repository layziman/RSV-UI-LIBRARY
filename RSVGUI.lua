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
    topFrame.Size = UDim2.new(1, 0, 0, 50)
    topFrame.Position = UDim2.new(0, 0, 0, 0)
    topFrame.BackgroundColor3 = Color3.fromRGB(255, 147, 0)
    topFrame.BackgroundTransparency = 1
    topFrame.BorderSizePixel = 0

    local mainText = Instance.new("TextLabel")
    mainText.Parent = topFrame
    mainText.Size = UDim2.new(0, 200, 0, 30)
    mainText.Position = UDim2.new(0.5, -100, 0, 5)
    mainText.BackgroundTransparency = 1
    mainText.Text = name
    mainText.TextColor3 = Color3.fromRGB(0, 0, 0)
    mainText.Font = Enum.Font.SourceSansBold
    mainText.TextSize = 24

    local subText = Instance.new("TextLabel")
    subText.Parent = topFrame
    subText.Size = UDim2.new(0, 200, 0, 20)
    subText.Position = UDim2.new(0.5, -100, 0, 30)
    subText.BackgroundTransparency = 1
    subText.Text = "made by " .. credits
    subText.TextColor3 = Color3.fromRGB(255, 255, 255)
    subText.Font = Enum.Font.SourceSansBold
    subText.TextSize = 16

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 350, 0, 400)
    mainFrame.Position = UDim2.new(0, -350, 0, 50)
    mainFrame.BackgroundColor3 = selectedTheme.MainFrameColor
    mainFrame.BackgroundTransparency = selectedTheme.Transparency
    mainFrame.BorderSizePixel = 0
    mainFrame.ClipsDescendants = true
    mainFrame.Parent = screenGui
    mainFrame.ZIndex = 1

    local mainCorner = Instance.new("UICorner")
    mainCorner.CornerRadius = UDim.new(0, 20)
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
    bottomBar.Size = UDim2.new(0, 82.5, 0, 50)
    bottomBar.Position = UDim2.new(0.5, -41.25, 1, 10)
    bottomBar.BackgroundColor3 = selectedTheme.BottomBarColor
    bottomBar.BackgroundTransparency = selectedTheme.Transparency
    bottomBar.BorderSizePixel = 0
    bottomBar.Parent = screenGui
    bottomBar.ZIndex = 2

    local bottomBarCorner = Instance.new("UICorner")
    bottomBarCorner.CornerRadius = UDim.new(0, 15)
    bottomBarCorner.Parent = bottomBar

    local bottomBarGradient = Instance.new("UIGradient")
    bottomBarGradient.Color = selectedTheme.BottomBarGradient
    bottomBarGradient.Rotation = 90
    bottomBarGradient.Parent = bottomBar

    local highlight = Instance.new("Frame")
    highlight.Size = UDim2.new(0, 82.5, 1, 0)
    highlight.Position = UDim2.new(0, 0, 0, 0)
    highlight.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
    highlight.BorderSizePixel = 0
    highlight.Parent = bottomBar
    highlight.ZIndex = 3

    local highlightCorner = Instance.new("UICorner")
    highlightCorner.CornerRadius = UDim.new(0, 10)
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
        local newWidth = tabCount * 82.5
        bottomBar.Size = UDim2.new(0, newWidth, 0, 50)
        bottomBar.Position = UDim2.new(0.5, -newWidth / 2, 1, 10)

        local tabFrame = Instance.new("ScrollingFrame")
        tabFrame.Size = UDim2.new(0, 330, 0, 340)
        tabFrame.Position = UDim2.new(0, 10, 0, 50)
        tabFrame.BackgroundTransparency = 1
        tabFrame.ScrollBarThickness = 5
        tabFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 105, 180)
        tabFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
        tabFrame.Parent = mainFrame
        tabFrame.Visible = false
        tabFrame.ZIndex = 2

        local tabButton = Instance.new("TextButton")
        tabButton.Size = UDim2.new(0, 82.5, 1, 0)
        tabButton.Position = UDim2.new(0, (#self.Tabs * 82.5), 0, 0)
        tabButton.BackgroundTransparency = 1
        tabButton.Text = name == "Home" and "Home" or name
        tabButton.TextColor3 = window.Theme == themes.Light and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)
        tabButton.Font = Enum.Font.GothamBold
        tabButton.TextSize = 16
        tabButton.BorderSizePixel = 0
        tabButton.Parent = bottomBar
        tabButton.ZIndex = 4

        local descLabel = Instance.new("TextLabel")
        descLabel.Size = UDim2.new(0, 150, 0, 30)
        descLabel.Position = UDim2.new(0.5, -75, -0.6, 0)
        descLabel.BackgroundColor3 = window.Theme.BottomBarColor
        descLabel.BackgroundTransparency = window.Theme.Transparency
        descLabel.BorderSizePixel = 0
        descLabel.Text = description or "No description"
        descLabel.TextColor3 = window.Theme.TextColor
        descLabel.Font = Enum.Font.Gotham
        descLabel.TextSize = 14
        descLabel.TextWrapped = true
        descLabel.Visible = false
        descLabel.Parent = tabButton
        descLabel.ZIndex = 5

        local descCorner = Instance.new("UICorner")
        descCorner.CornerRadius = UDim.new(0, 5)
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
                local oldTween = TweenService:Create(oldTab.Frame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(-1, 10, 0, 50)})
                oldTween:Play()
                oldTween.Completed:Connect(function()
                    oldTab.Frame.Visible = false
                end)

                tab.Frame.Visible = true
                tab.Frame.Position = UDim2.new(1, 10, 0, 50)
                TweenService:Create(tab.Frame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0, 10, 0, 50)}):Play()
                tabButton.TextColor3 = window.Theme == themes.Light and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)
                self.CurrentTab = tab
                self.ActiveIndex = table.find(self.Tabs, tab)
                local targetPosition = UDim2.new(0, (self.ActiveIndex - 1) * 82.5, 0, 0)
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
            sliderFrame.Size = UDim2.new(0, 300, 0, 60)
            sliderFrame.Position = UDim2.new(0, 15, 0, #self.Elements * 70 + 10)
            sliderFrame.BackgroundColor3 = window.Theme.SliderFrameColor
            sliderFrame.BackgroundTransparency = window.Theme.Transparency
            sliderFrame.BorderSizePixel = 0
            sliderFrame.Parent = self.Frame
            sliderFrame.ZIndex = 3
            sliderFrame.Visible = true

            self.Frame.CanvasSize = UDim2.new(0, 0, 0, (#self.Elements + 1) * 70 + 10)

            local sliderCorner = Instance.new("UICorner")
            sliderCorner.CornerRadius = UDim.new(0, 12)
            sliderCorner.Parent = sliderFrame

            local sliderGradient = Instance.new("UIGradient")
            sliderGradient.Color = window.Theme.SliderGradient
            sliderGradient.Rotation = 90
            sliderGradient.Parent = sliderFrame

            local sliderLabel = Instance.new("TextLabel")
            sliderLabel.Size = UDim2.new(0, 280, 0, 20)
            sliderLabel.Position = UDim2.new(0, 10, 0, 5)
            sliderLabel.BackgroundTransparency = 1
            sliderLabel.Text = name .. ": " .. default
            sliderLabel.TextColor3 = window.Theme.TextColor
            sliderLabel.Font = Enum.Font.GothamBold
            sliderLabel.TextSize = 16
            sliderLabel.TextXAlignment = Enum.TextXAlignment.Left
            sliderLabel.Parent = sliderFrame
            sliderLabel.ZIndex = 4
            sliderLabel.Visible = true

            local sliderBar = Instance.new("Frame")
            sliderBar.Size = UDim2.new(0, 260, 0, 8)
            sliderBar.Position = UDim2.new(0, 20, 0, 35)
            sliderBar.BackgroundColor3 = window.Theme.SliderBarColor
            sliderBar.BorderSizePixel = 0
            sliderBar.Parent = sliderFrame
            sliderBar.ZIndex = 4
            sliderBar.Visible = true

            local barCorner = Instance.new("UICorner")
            barCorner.CornerRadius = UDim.new(0, 4)
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
            fillCorner.CornerRadius = UDim.new(0, 4)
            fillCorner.Parent = sliderFill

            local fillGradient = Instance.new("UIGradient")
            fillGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 80, 150))}
            fillGradient.Rotation = 45
            fillGradient.Parent = sliderFill

            local sliderHandle = Instance.new("Frame")
            sliderHandle.Size = UDim2.new(0, 16, 0, 16)
            sliderHandle.Position = UDim2.new((default - min) / (max - min), -8, 0, -4)
            sliderHandle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            sliderHandle.BorderSizePixel = 0
            sliderHandle.Parent = sliderBar
            sliderHandle.ZIndex = 5
            sliderHandle.Visible = true

            local handleCorner = Instance.new("UICorner")
            handleCorner.CornerRadius = UDim.new(0, 8)
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
                    sliderHandle.Position = UDim2.new(0, newX - 8, 0, -4)
                    sliderFill.Size = UDim2.new(0, newX, 1, 0)
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
            toggleFrame.Size = UDim2.new(0, 300, 0, 50)
            toggleFrame.Position = UDim2.new(0, 15, 0, #self.Elements * 70 + 10)
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
            toggleCorner.CornerRadius = UDim.new(0, 8)
            toggleCorner.Parent = toggleFrame

            self.Frame.CanvasSize = UDim2.new(0, 0, 0, (#self.Elements + 1) * 70 + 10)

            local toggleLabel = Instance.new("TextLabel")
            toggleLabel.Size = UDim2.new(0, 260, 0, 50)
            toggleLabel.Position = UDim2.new(0, 40, 0, 0)
            toggleLabel.BackgroundTransparency = 1
            toggleLabel.Text = name
            toggleLabel.TextColor3 = window.Theme.TextColor
            toggleLabel.Font = Enum.Font.GothamBold
            toggleLabel.TextSize = 14
            toggleLabel.TextXAlignment = Enum.TextXAlignment.Left
            toggleLabel.Parent = toggleFrame
            toggleLabel.ZIndex = 4
            toggleLabel.Visible = true

            local checkbox = Instance.new("TextButton")
            checkbox.Size = UDim2.new(0, 20, 0, 20)
            checkbox.Position = UDim2.new(0, 10, 0, 15)
            checkbox.BackgroundColor3 = default and Color3.fromRGB(50, 150, 50) or window.Theme.SliderFrameColor
            checkbox.BackgroundTransparency = window.Theme.Transparency
            checkbox.BorderSizePixel = 0
            checkbox.Text = default and "✔" or ""
            checkbox.TextColor3 = window.Theme.TextColor
            checkbox.Font = Enum.Font.Gotham
            checkbox.TextSize = 14
            checkbox.Parent = toggleFrame
            checkbox.ZIndex = 4
            checkbox.Visible = true

            local checkboxCorner = Instance.new("UICorner")
            checkboxCorner.CornerRadius = UDim.new(0, 5)
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
            buttonFrame.Size = UDim2.new(0, 300, 0, size == "Small" and 30 or 50)
            buttonFrame.Position = UDim2.new(0, 15, 0, #self.Elements * 70 + 10)
            buttonFrame.BackgroundTransparency = 1
            buttonFrame.Parent = self.Frame
            buttonFrame.ZIndex = 3
            buttonFrame.Visible = true

            self.Frame.CanvasSize = UDim2.new(0, 0, 0, (#self.Elements + 1) * 70 + 10)

            local button = Instance.new("TextButton")
            button.Size = UDim2.new(0, size == "Small" and 130 or 260, 0, size == "Small" and 20 or 40)
            button.Position = UDim2.new(0, size == "Small" and 85 or 20, 0, size == "Small" and 5 or 5)
            button.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
            button.BorderSizePixel = 0
            button.Text = name
            button.TextColor3 = window.Theme.TextColor
            button.Font = Enum.Font.GothamBold
            button.TextSize = size == "Small" and 14 or 16
            button.Parent = buttonFrame
            button.ZIndex = 4
            button.Visible = true

            local buttonCorner = Instance.new("UICorner")
            buttonCorner.CornerRadius = UDim.new(0, 8)
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
            labelFrame.Size = UDim2.new(0, 300, 0, 30)
            labelFrame.Position = UDim2.new(0, 15, 0, #self.Elements * 70 + 10)
            labelFrame.BackgroundTransparency = 1
            labelFrame.Parent = self.Frame
            labelFrame.ZIndex = 3
            labelFrame.Visible = true

            self.Frame.CanvasSize = UDim2.new(0, 0, 0, (#self.Elements + 1) * 70 + 10)

            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(0, 280, 0, 30)
            label.Position = UDim2.new(0, 10, 0, 0)
            label.BackgroundTransparency = 1
            label.Text = text
            label.TextColor3 = window.Theme.TextColor
            label.Font = Enum.Font.Gotham
            label.TextSize = 14
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
            textBoxFrame.Size = UDim2.new(0, 300, 0, 50)
            textBoxFrame.Position = UDim2.new(0, 15, 0, #self.Elements * 70 + 10)
            textBoxFrame.BackgroundTransparency = 1
            textBoxFrame.Parent = self.Frame
            textBoxFrame.ZIndex = 3
            textBoxFrame.Visible = true

            self.Frame.CanvasSize = UDim2.new(0, 0, 0, (#self.Elements + 1) * 70 + 10)

            local textBoxLabel = Instance.new("TextLabel")
            textBoxLabel.Size = UDim2.new(0, 100, 0, 20)
            textBoxLabel.Position = UDim2.new(0, 10, 0, 5)
            textBoxLabel.BackgroundTransparency = 1
            textBoxLabel.Text = name
            textBoxLabel.TextColor3 = window.Theme.TextColor
            textBoxLabel.Font = Enum.Font.GothamBold
            textBoxLabel.TextSize = 14
            textBoxLabel.TextXAlignment = Enum.TextXAlignment.Left
            textBoxLabel.Parent = textBoxFrame
            textBoxLabel.ZIndex = 4
            textBoxLabel.Visible = true

            local textBox = Instance.new("TextBox")
            textBox.Size = UDim2.new(0, 170, 0, 30)
            textBox.Position = UDim2.new(0, 120, 0, 10)
            textBox.BackgroundColor3 = window.Theme.SliderFrameColor
            textBox.BackgroundTransparency = window.Theme.Transparency
            textBox.BorderSizePixel = 0
            textBox.Text = default
            textBox.TextColor3 = window.Theme.TextColor
            textBox.Font = Enum.Font.Gotham
            textBox.TextSize = 14
            textBox.Parent = textBoxFrame
            textBox.ZIndex = 4
            textBox.Visible = true

            local textBoxCorner = Instance.new("UICorner")
            textBoxCorner.CornerRadius = UDim.new(0, 5)
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

        function tab:CreateDropdown(options)
            local name = options.Name or "Dropdown"
            local items = options.Items or {}
            local default = options.Default or (items[1] or "")
            local callback = options.Callback or function() end

            local dropdownFrame = Instance.new("Frame")
            dropdownFrame.Size = UDim2.new(0, 300, 0, 50)
            dropdownFrame.Position = UDim2.new(0, 15, 0, #self.Elements * 70 + 10)
            dropdownFrame.BackgroundColor3 = window.Theme.SliderFrameColor
            dropdownFrame.BackgroundTransparency = window.Theme.Transparency
            dropdownFrame.Parent = self.Frame
            dropdownFrame.ZIndex = 3

            self.Frame.CanvasSize = UDim2.new(0, 0, 0, (#self.Elements + 1) * 70 + 10)

            local dropdownCorner = Instance.new("UICorner")
            dropdownCorner.CornerRadius = UDim.new(0, 8)
            dropdownCorner.Parent = dropdownFrame

            local dropdownGradient = Instance.new("UIGradient")
            dropdownGradient.Color = window.Theme.SliderGradient
            dropdownGradient.Rotation = 90
            dropdownGradient.Parent = dropdownFrame

            local dropdownLabel = Instance.new("TextLabel")
            dropdownLabel.Size = UDim2.new(0, 200, 0, 20)
            dropdownLabel.Position = UDim2.new(0, 10, 0, 5)
            dropdownLabel.BackgroundTransparency = 1
            dropdownLabel.Text = name
            dropdownLabel.TextColor3 = window.Theme.TextColor
            dropdownLabel.Font = Enum.Font.GothamBold
            dropdownLabel.TextSize = 14
            dropdownLabel.TextXAlignment = Enum.TextXAlignment.Left
            dropdownLabel.Parent = dropdownFrame
            dropdownLabel.ZIndex = 4

            local dropdownButton = Instance.new("TextButton")
            dropdownButton.Size = UDim2.new(0, 260, 0, 20)
            dropdownButton.Position = UDim2.new(0, 20, 0, 25)
            dropdownButton.BackgroundColor3 = window.Theme.SliderBarColor
            dropdownButton.BorderSizePixel = 0
            dropdownButton.Text = default
            dropdownButton.TextColor3 = window.Theme.TextColor
            dropdownButton.Font = Enum.Font.Gotham
            dropdownButton.TextSize = 14
            dropdownButton.Parent = dropdownFrame
            dropdownButton.ZIndex = 4

            local buttonCorner = Instance.new("UICorner")
            buttonCorner.CornerRadius = UDim.new(0, 5)
            buttonCorner.Parent = dropdownButton

            local dropdownList = Instance.new("ScrollingFrame")
            dropdownList.Size = UDim2.new(0, 260, 0, 0)
            dropdownList.Position = UDim2.new(0, 20, 0, 50)
            dropdownList.BackgroundColor3 = window.Theme.SliderBarColor
            dropdownList.BackgroundTransparency = window.Theme.Transparency
            dropdownList.BorderSizePixel = 0
            dropdownList.ScrollBarThickness = 5
            dropdownList.ScrollBarImageColor3 = Color3.fromRGB(255, 105, 180)
            dropdownList.CanvasSize = UDim2.new(0, 0, 0, #items * 30)
            dropdownList.Visible = false
            dropdownList.Parent = dropdownFrame
            dropdownList.ZIndex = 5

            local listCorner = Instance.new("UICorner")
            listCorner.CornerRadius = UDim.new(0, 5)
            listCorner.Parent = dropdownList

            local listLayout = Instance.new("UIListLayout")
            listLayout.SortOrder = Enum.SortOrder.LayoutOrder
            listLayout.Parent = dropdownList

            local isOpen = false
            dropdownButton.MouseButton1Click:Connect(function()
                isOpen = not isOpen
                if isOpen then
                    dropdownList.Visible = true
                    TweenService:Create(dropdownList, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 260, 0, math.min(#items * 30, 90))}):Play()
                else
                    TweenService:Create(dropdownList, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 260, 0, 0)}):Play()
                    delay(0.3, function()
                        dropdownList.Visible = false
                    end)
                end
            end)

            for i, item in pairs(items) do
                local itemButton = Instance.new("TextButton")
                itemButton.Size = UDim2.new(0, 260, 0, 30)
                itemButton.BackgroundTransparency = 1
                itemButton.Text = tostring(item)
                itemButton.TextColor3 = window.Theme.TextColor
                itemButton.Font = Enum.Font.Gotham
                itemButton.TextSize = 14
                itemButton.Parent = dropdownList
                itemButton.ZIndex = 6

                itemButton.MouseButton1Click:Connect(function()
                    dropdownButton.Text = tostring(item)
                    isOpen = false
                    TweenService:Create(dropdownList, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 260, 0, 0)}):Play()
                    delay(0.3, function()
                        dropdownList.Visible = false
                    end)
                    callback(item)
                end)
            end

            table.insert(self.Elements, dropdownFrame)
            return dropdownFrame
        end

        function tab:CreateColorPicker(options)
            local name = options.Name or "Color Picker"
            local default = options.Default or Color3.fromRGB(255, 255, 255)
            local callback = options.Callback or function() end

            local pickerFrame = Instance.new("Frame")
            pickerFrame.Size = UDim2.new(0, 300, 0, 50)
            pickerFrame.Position = UDim2.new(0, 15, 0, #self.Elements * 70 + 10)
            pickerFrame.BackgroundColor3 = window.Theme.SliderFrameColor
            pickerFrame.BackgroundTransparency = window.Theme.Transparency
            pickerFrame.Parent = self.Frame
            pickerFrame.ZIndex = 3

            self.Frame.CanvasSize = UDim2.new(0, 0, 0, (#self.Elements + 1) * 70 + 10)

            local pickerCorner = Instance.new("UICorner")
            pickerCorner.CornerRadius = UDim.new(0, 8)
            pickerCorner.Parent = pickerFrame

            local pickerGradient = Instance.new("UIGradient")
            pickerGradient.Color = window.Theme.SliderGradient
            pickerGradient.Rotation = 90
            pickerGradient.Parent = pickerFrame

            local pickerLabel = Instance.new("TextLabel")
            pickerLabel.Size = UDim2.new(0, 200, 0, 20)
            pickerLabel.Position = UDim2.new(0, 10, 0, 5)
            pickerLabel.BackgroundTransparency = 1
            pickerLabel.Text = name
            pickerLabel.TextColor3 = window.Theme.TextColor
            pickerLabel.Font = Enum.Font.GothamBold
            pickerLabel.TextSize = 14
            pickerLabel.TextXAlignment = Enum.TextXAlignment.Left
            pickerLabel.Parent = pickerFrame
            pickerLabel.ZIndex = 4

            local colorDisplay = Instance.new("Frame")
            colorDisplay.Size = UDim2.new(0, 20, 0, 20)
            colorDisplay.Position = UDim2.new(0, 260, 0, 5)
            colorDisplay.BackgroundColor3 = default
            colorDisplay.BorderSizePixel = 0
            colorDisplay.Parent = pickerFrame
            colorDisplay.ZIndex = 4

            local displayCorner = Instance.new("UICorner")
            displayCorner.CornerRadius = UDim.new(0, 5)
            displayCorner.Parent = colorDisplay

            local pickerButton = Instance.new("TextButton")
            pickerButton.Size = UDim2.new(0, 260, 0, 20)
            pickerButton.Position = UDim2.new(0, 20, 0, 25)
            pickerButton.BackgroundColor3 = window.Theme.SliderBarColor
            pickerButton.BorderSizePixel = 0
            pickerButton.Text = "#" .. default:ToHex()
            pickerButton.TextColor3 = window.Theme.TextColor
            pickerButton.Font = Enum.Font.Gotham
            pickerButton.TextSize = 14
            pickerButton.Parent = pickerFrame
            pickerButton.ZIndex = 4

            local buttonCorner = Instance.new("UICorner")
            buttonCorner.CornerRadius = UDim.new(0, 5)
            buttonCorner.Parent = pickerButton

            local pickerArea = Instance.new("Frame")
            pickerArea.Size = UDim2.new(0, 260, 0, 0)
            pickerArea.Position = UDim2.new(0, 20, 0, 50)
            pickerArea.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            pickerArea.BorderSizePixel = 0
            pickerArea.Visible = false
            pickerArea.Parent = pickerFrame
            pickerArea.ZIndex = 5

            local areaCorner = Instance.new("UICorner")
            areaCorner.CornerRadius = UDim.new(0, 5)
            areaCorner.Parent = pickerArea

            local hueGradient = Instance.new("UIGradient")
            hueGradient.Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
                ColorSequenceKeypoint.new(0.167, Color3.fromRGB(255, 255, 0)),
                ColorSequenceKeypoint.new(0.333, Color3.fromRGB(0, 255, 0)),
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255)),
                ColorSequenceKeypoint.new(0.667, Color3.fromRGB(0, 0, 255)),
                ColorSequenceKeypoint.new(0.833, Color3.fromRGB(255, 0, 255)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
            }
            hueGradient.Rotation = 0
            hueGradient.Parent = pickerArea

            local hueSelector = Instance.new("Frame")
            hueSelector.Size = UDim2.new(0, 16, 0, 16)
            hueSelector.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            hueSelector.BorderSizePixel = 0
            hueSelector.Parent = pickerArea
            hueSelector.ZIndex = 6

            local selectorCorner = Instance.new("UICorner")
            selectorCorner.CornerRadius = UDim.new(1, 0)
            selectorCorner.Parent = hueSelector

            local selectorStroke = Instance.new("UIStroke")
            selectorStroke.Thickness = 2
            selectorStroke.Color = Color3.fromRGB(0, 0, 0)
            selectorStroke.Parent = hueSelector

            local isOpen = false
            local dragging = false

            local function updateColor()
                local huePos = hueSelector.Position.X.Scale
                local hue = huePos * 360
                local color = Color3.fromHSV(hue / 360, 1, 1)
                colorDisplay.BackgroundColor3 = color
                pickerButton.Text = "#" .. color:ToHex()
                callback(color)
            end

            pickerButton.MouseButton1Click:Connect(function()
                isOpen = not isOpen
                if isOpen then
                    pickerArea.Visible = true
                    TweenService:Create(pickerArea, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 260, 0, 20)}):Play()
                else
                    TweenService:Create(pickerArea, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 260, 0, 0)}):Play()
                    delay(0.3, function()
                        pickerArea.Visible = false
                    end)
                end
            end)

            hueSelector.InputBegan:Connect(function(input)
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
                    local pickerPos = pickerArea.AbsolutePosition
                    local pickerSize = pickerArea.AbsoluteSize.X
                    local newX = math.clamp((mousePos.X - pickerPos.X) / pickerSize, 0, 1)
                    hueSelector.Position = UDim2.new(newX, -8, 0, 2)
                    updateColor()
                end
            end)

            local r, g, b = default.R * 255, default.G * 255, default.B * 255
            local h, s, v = Color3.fromRGB(r, g, b):ToHSV()
            hueSelector.Position = UDim2.new(h, -8, 0, 2)
            updateColor()

            table.insert(self.Elements, pickerFrame)
            return pickerFrame
        end

        return tab
    end

    function window:Toggle()
        if mainFrame.Position.X.Offset == -350 then
            TweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0, 20, 0, 50)}):Play()
            TweenService:Create(window.BottomBar, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -window.BottomBar.Size.X.Offset / 2, 1, -60)}):Play()
        else
            TweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0, -350, 0, 50)}):Play()
            TweenService:Create(window.BottomBar, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -window.BottomBar.Size.X.Offset / 2, 1, 10)}):Play()
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
    homeCorner.CornerRadius = UDim.new(0, 15)
    homeCorner.Parent = homeBackground

    local homeGradient = Instance.new("UIGradient")
    homeGradient.Color = selectedTheme.HomeGradient
    homeGradient.Rotation = 90
    homeGradient.Parent = homeBackground

    local avatarImage = Instance.new("ImageLabel")
    avatarImage.Size = UDim2.new(0, 80, 0, 80)
    avatarImage.Position = UDim2.new(0.5, -40, 0, 10)
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
    displayName.Size = UDim2.new(0, 300, 0, 30)
    displayName.Position = UDim2.new(0, 15, 0, 95)
    displayName.BackgroundTransparency = 1
    displayName.Text = player.DisplayName
    displayName.TextColor3 = selectedTheme.TextColor
    displayName.Font = Enum.Font.GothamBold
    displayName.TextSize = 20
    displayName.TextXAlignment = Enum.TextXAlignment.Center
    displayName.Parent = homeTab.Frame
    displayName.ZIndex = 2
    displayName.Visible = true

    local realUsername = Instance.new("TextLabel")
    realUsername.Size = UDim2.new(0, 300, 0, 20)
    realUsername.Position = UDim2.new(0, 15, 0, 125)
    realUsername.BackgroundTransparency = 1
    realUsername.Text = "@" .. player.Name
    realUsername.TextColor3 = selectedTheme.SubTextColor
    realUsername.Font = Enum.Font.Gotham
    realUsername.TextSize = 14
    realUsername.TextXAlignment = Enum.TextXAlignment.Center
    realUsername.Parent = homeTab.Frame
    realUsername.ZIndex = 2
    realUsername.Visible = true

    local serverPlayers = Instance.new("TextLabel")
    serverPlayers.Size = UDim2.new(0, 300, 0, 20)
    serverPlayers.Position = UDim2.new(0, 15, 0, 145)
    serverPlayers.BackgroundTransparency = 1
    serverPlayers.Text = #Players:GetPlayers() .. "/" .. game.Players.MaxPlayers .. " players"
    serverPlayers.TextColor3 = selectedTheme.TextColor
    serverPlayers.Font = Enum.Font.Gotham
    serverPlayers.TextSize = 14
    serverPlayers.TextXAlignment = Enum.TextXAlignment.Center
    serverPlayers.Parent = homeTab.Frame
    serverPlayers.ZIndex = 2
    serverPlayers.Visible = true

    local elapsedTime = Instance.new("TextLabel")
    elapsedTime.Size = UDim2.new(0, 300, 0, 20)
    elapsedTime.Position = UDim2.new(0, 15, 0, 165)
    elapsedTime.BackgroundTransparency = 1
    elapsedTime.Text = "0 seconds elapsed"
    elapsedTime.TextColor3 = selectedTheme.TextColor
    elapsedTime.Font = Enum.Font.Gotham
    elapsedTime.TextSize = 14
    elapsedTime.TextXAlignment = Enum.TextXAlignment.Center
    elapsedTime.Parent = homeTab.Frame
    elapsedTime.ZIndex = 2
    elapsedTime.Visible = true

    local gameNameLabel = Instance.new("TextLabel")
    gameNameLabel.Size = UDim2.new(0, 300, 0, 20)
    gameNameLabel.Position = UDim2.new(0, 15, 0, 185)
    gameNameLabel.BackgroundTransparency = 1
    gameNameLabel.Text = "Connected to: <b>Loading...</b>"
    gameNameLabel.TextColor3 = selectedTheme.TextColor
    gameNameLabel.Font = Enum.Font.Gotham
    gameNameLabel.TextSize = 14
    gameNameLabel.TextXAlignment = Enum.TextXAlignment.Center
    gameNameLabel.RichText = true
    gameNameLabel.Parent = homeTab.Frame
    gameNameLabel.ZIndex = 2
    gameNameLabel.Visible = true

    local changelogLabel = Instance.new("TextLabel")
    changelogLabel.Size = UDim2.new(0, 300, 0, 100)
    changelogLabel.Position = UDim2.new(0, 15, 0, 205)
    changelogLabel.BackgroundTransparency = 1
    changelogLabel.Text = "Changelog:\n- v1.0: Initial release\n- v1.1: Added new themes\n- v1.2: Improved UI responsiveness"
    changelogLabel.TextColor3 = selectedTheme.TextColor
    changelogLabel.Font = Enum.Font.Gotham
    changelogLabel.TextSize = 14
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
end

return RSV
