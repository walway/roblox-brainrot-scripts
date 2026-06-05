local UserInputService = game:GetService("UserInputService")

-- 1. Main Container
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ModernInterface"
ScreenGui.ResetOnSpawn = false

local success, coreGui = pcall(function() return game:GetService("CoreGui") end)
ScreenGui.Parent = (success and coreGui) or game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- 2. Theme Colors
local COLORS = {
    MainBg = Color3.fromRGB(43, 45, 114),      
    SidebarBg = Color3.fromRGB(56, 59, 145),   
    ContentBg = Color3.fromRGB(35, 37, 95),    
    RowBg = Color3.fromRGB(48, 51, 128),        
    TextMain = Color3.fromRGB(255, 255, 255),  
    TextDark = Color3.fromRGB(0, 0, 0),
    StatusGreen = Color3.fromRGB(119, 221, 85)
}

-- 3. Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 580, 0, 390) 
MainFrame.Position = UDim2.new(0.5, -290, 0.5, -195)
MainFrame.BackgroundColor3 = COLORS.MainBg
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame
-- Hide Button
local HideUIButton = Instance.new("TextButton")
HideUIButton.Name = "HideUIButton"
HideUIButton.Size = UDim2.new(0, 60, 0, 30)
HideUIButton.Position = UDim2.new(1, -125, 0, 14)
HideUIButton.BackgroundTransparency = 1
HideUIButton.Text = "Hide"
HideUIButton.TextColor3 = COLORS.TextMain
HideUIButton.TextSize = 15
HideUIButton.Font = Enum.Font.GothamMedium
HideUIButton.TextXAlignment = Enum.TextXAlignment.Right
HideUIButton.Parent = MainFrame

-- Close Button
local CloseUIButton = Instance.new("TextButton")
CloseUIButton.Name = "CloseUIButton"
CloseUIButton.Size = UDim2.new(0, 60, 0, 30)
CloseUIButton.Position = UDim2.new(1, -55, 0, 14)
CloseUIButton.BackgroundTransparency = 1
CloseUIButton.Text = "Close"
CloseUIButton.TextColor3 = COLORS.TextMain
CloseUIButton.TextSize = 15
CloseUIButton.Font = Enum.Font.GothamMedium
CloseUIButton.TextXAlignment = Enum.TextXAlignment.Right
CloseUIButton.Parent = MainFrame
local MiniBar = Instance.new("Frame")
MiniBar.Name = "MiniBar"
MiniBar.Size = UDim2.new(0, 240, 0, 65)
MiniBar.Position = UDim2.new(0.5, -120, 0.05, 0) 
MiniBar.BackgroundColor3 = COLORS.TextMain
MiniBar.BorderSizePixel = 0
MiniBar.Active = true
MiniBar.Visible = false 
MiniBar.Parent = ScreenGui

local MiniCorner = Instance.new("UICorner")
MiniCorner.CornerRadius = UDim.new(0, 10)
MiniCorner.Parent = MiniBar

local MiniTitle = Instance.new("TextLabel")
MiniTitle.Name = "MiniTitle"
MiniTitle.Size = UDim2.new(0, 140, 1, 0)
MiniTitle.Position = UDim2.new(0, 15, 0, 0)
MiniTitle.BackgroundTransparency = 1
MiniTitle.Text = "Brainrot Hub"
MiniTitle.TextColor3 = COLORS.TextDark
MiniTitle.TextSize = 22
MiniTitle.Font = Enum.Font.GothamMedium
MiniTitle.TextXAlignment = Enum.TextXAlignment.Left
MiniTitle.Parent = MiniBar

local ShowUIButton = Instance.new("TextButton")
ShowUIButton.Name = "ShowUIButton"
ShowUIButton.Size = UDim2.new(0, 60, 1, 0)
ShowUIButton.Position = UDim2.new(1, -75, 0, 0)
ShowUIButton.BackgroundTransparency = 1
ShowUIButton.Text = "Show"
ShowUIButton.TextColor3 = COLORS.TextDark
ShowUIButton.TextSize = 20
ShowUIButton.Font = Enum.Font.GothamMedium
ShowUIButton.TextXAlignment = Enum.TextXAlignment.Right
ShowUIButton.Parent = MiniBar
local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 150, 1, -75)
Sidebar.Position = UDim2.new(0, 16, 0, 60)
Sidebar.BackgroundColor3 = COLORS.SidebarBg
Sidebar.BorderSizePixel = 0
Sidebar.Parent = MainFrame

local SidebarCorner = Instance.new("UICorner")
SidebarCorner.CornerRadius = UDim.new(0, 10)
SidebarCorner.Parent = Sidebar

local SidebarLayout = Instance.new("UIListLayout")
SidebarLayout.Padding = UDim.new(0, 4)
SidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
SidebarLayout.Parent = Sidebar

local function createNavOption(name, text, order, isSelected)
    local btn = Instance.new("TextButton")
    btn.Name = name .. "Btn"
    btn.Size = UDim2.new(1, 0, 0, 40)
    btn.BackgroundColor3 = isSelected and COLORS.ContentBg or COLORS.SidebarBg
    btn.BackgroundTransparency = isSelected and 0 or 1
    btn.Text = "   " .. text 
    btn.TextColor3 = COLORS.TextMain
    btn.TextSize = 14
    btn.Font = isSelected and Enum.Font.GothamBold or Enum.Font.GothamMedium
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.LayoutOrder = order
    btn.Parent = Sidebar
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = btn
    return btn
end

local HomeBtn = createNavOption("Home", "Home", 1, false)
local ScriptsBtn = createNavOption("Scripts", "Scripts", 2, false)
local HubListBtn = createNavOption("HubList", "Hub List", 3, true) 
local SettingsBtn = createNavOption("Settings", "Settings", 4, false)
local ContentContainer = Instance.new("Frame")
ContentContainer.Size = UDim2.new(1, -198, 1, -75)
ContentContainer.Position = UDim2.new(0, 182, 0, 60)
ContentContainer.BackgroundColor3 = COLORS.ContentBg
ContentContainer.BorderSizePixel = 0
ContentContainer.Parent = MainFrame

local ContentCorner = Instance.new("UICorner")
ContentCorner.CornerRadius = UDim.new(0, 10)
ContentCorner.Parent = ContentContainer

local HomeFrame = Instance.new("Frame")
HomeFrame.Size = UDim2.new(1, 0, 1, 0)
HomeFrame.BackgroundTransparency = 1
HomeFrame.Parent = ContentContainer

local ScriptsFrame = Instance.new("Frame")
ScriptsFrame.Size = UDim2.new(1, 0, 1, 0)
ScriptsFrame.BackgroundTransparency = 1
ScriptsFrame.Parent = ContentContainer

local HubListFrame = Instance.new("ScrollingFrame")
HubListFrame.Size = UDim2.new(1, -16, 1, -16)
HubListFrame.Position = UDim2.new(0, 8, 0, 8)
HubListFrame.BackgroundTransparency = 1
HubListFrame.BorderSizePixel = 0
HubListFrame.Parent = ContentContainer

local SettingsFrame = Instance.new("Frame")
SettingsFrame.Size = UDim2.new(1, 0, 1, 0)
SettingsFrame.BackgroundTransparency = 1
SettingsFrame.Parent = ContentContainer

-- Core Control Actions (Hide / Show / Close)
HideUIButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    MiniBar.Visible = true
end)

ShowUIButton.MouseButton1Click:Connect(function()
    MiniBar.Visible = false
    MainFrame.Visible = true
end)

CloseUIButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Drag Function Engine
local function makeDraggable(frame)
    local dragging, dragInput, dragStart, startPos
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true; dragStart = input.Position; startPos = frame.Position
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    frame.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
    end)
end

makeDraggable(MainFrame)
makeDraggable(MiniBar)