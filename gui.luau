local UserInputService = game:GetService("UserInputService")

-- ==========================================
-- 1. MAIN SCREEN CONTAINER
-- ==========================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ModernInterface"
ScreenGui.ResetOnSpawn = false

local success, coreGui = pcall(function() return game:GetService("CoreGui") end)
ScreenGui.Parent = (success and coreGui) or game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- ==========================================
-- 2. THEME CONFIGURATION (Purple Scheme)
-- ==========================================
local COLORS = {
    MainBg = Color3.fromRGB(43, 45, 114),      
    SidebarBg = Color3.fromRGB(56, 59, 145),   
    ContentBg = Color3.fromRGB(35, 37, 95),    
    RowBg = Color3.fromRGB(48, 51, 128),        
    TextMain = Color3.fromRGB(255, 255, 255),  
    TextDark = Color3.fromRGB(0, 0, 0),
    StatusGreen = Color3.fromRGB(119, 221, 85)
}

-- ==========================================
-- 3. MAIN WINDOW FRAME
-- ==========================================
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

-- Top Left Logo Placeholder
local LogoPlaceholder = Instance.new("Frame")
LogoPlaceholder.Size = UDim2.new(0, 32, 0, 32)
LogoPlaceholder.Position = UDim2.new(0, 16, 0, 14)
LogoPlaceholder.BackgroundColor3 = COLORS.SidebarBg
LogoPlaceholder.BorderSizePixel = 0
LogoPlaceholder.Parent = MainFrame

local LogoCorner = Instance.new("UICorner")
LogoCorner.CornerRadius = UDim.new(0, 8)
LogoCorner.Parent = LogoPlaceholder

-- Repositioned Header Controls (Moved Safely Left)
local HideUIButton = Instance.new("TextButton")
HideUIButton.Name = "HideUIButton"
HideUIButton.Size = UDim2.new(0, 60, 0, 30)
HideUIButton.Position = UDim2.new(1, -150, 0, 14) 
HideUIButton.BackgroundTransparency = 1
HideUIButton.Text = "Hide"
HideUIButton.TextColor3 = COLORS.TextMain
HideUIButton.TextSize = 15
HideUIButton.Font = Enum.Font.GothamMedium
HideUIButton.Parent = MainFrame

local CloseUIButton = Instance.new("TextButton")
CloseUIButton.Name = "CloseUIButton"
CloseUIButton.Size = UDim2.new(0, 60, 0, 30)
CloseUIButton.Position = UDim2.new(1, -85, 0, 14) 
CloseUIButton.BackgroundTransparency = 1
CloseUIButton.Text = "Close"
CloseUIButton.TextColor3 = COLORS.TextMain
CloseUIButton.TextSize = 15
CloseUIButton.Font = Enum.Font.GothamMedium
CloseUIButton.Parent = MainFrame

-- ==========================================
-- 4. FLOATING MINI-BAR (From Screenshot)
-- ==========================================
local MiniBar = Instance.new("Frame")
MiniBar.Name = "MiniBar"
MiniBar.Size = UDim2.new(0, 240, 0, 65)
MiniBar.Position = UDim2.new(0.5, -120, 0.05, 0) 
MiniBar.BackgroundColor3 = COLORS.MainBg 
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
MiniTitle.TextColor3 = COLORS.TextMain 
MiniTitle.TextSize = 20
MiniTitle.Font = Enum.Font.GothamBold
MiniTitle.TextXAlignment = Enum.TextXAlignment.Left
MiniTitle.Parent = MiniBar

local ShowUIButton = Instance.new("TextButton")
ShowUIButton.Name = "ShowUIButton"
ShowUIButton.Size = UDim2.new(0, 60, 1, 0)
ShowUIButton.Position = UDim2.new(1, -75, 0, 0)
ShowUIButton.BackgroundTransparency = 1
ShowUIButton.Text = "Show"
ShowUIButton.TextColor3 = COLORS.TextMain 
ShowUIButton.TextSize = 18
ShowUIButton.Font = Enum.Font.GothamMedium
ShowUIButton.TextXAlignment = Enum.TextXAlignment.Right
ShowUIButton.Parent = MiniBar

-- ==========================================
-- 5. SIDEBAR NAVIGATION PANEL (Correct Names)
-- ==========================================
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

local HomeBtn = createNavOption("Home", "Home", 1, true)
local ScriptsBtn = createNavOption("Scripts", "Scripts", 2, false)
local BrainrotBtn = createNavOption("Brainrot", "Brainrot Hubs", 3, false) 
local SettingsBtn = createNavOption("Settings", "Settings", 4, false)

-- ==========================================
-- 6. INDEPENDENT SCROLL CONTENT VIEWS
-- ==========================================
local ContentContainer = Instance.new("Frame")
ContentContainer.Size = UDim2.new(1, -198, 1, -75)
ContentContainer.Position = UDim2.new(0, 182, 0, 60)
ContentContainer.BackgroundColor3 = COLORS.ContentBg
ContentContainer.BorderSizePixel = 0
ContentContainer.Parent = MainFrame

local ContentCorner = Instance.new("UICorner")
ContentCorner.CornerRadius = UDim.new(0, 10)
ContentCorner.Parent = ContentContainer

local function createScrollContainer(name, isVisible)
    local sc = Instance.new("ScrollingFrame")
    sc.Name = name
    sc.Size = UDim2.new(1, -16, 1, -16)
    sc.Position = UDim2.new(0, 8, 0, 8)
    sc.BackgroundTransparency = 1
    sc.BorderSizePixel = 0
    sc.ScrollBarThickness = 4
    sc.ScrollBarImageColor3 = COLORS.SidebarBg
    sc.CanvasSize = UDim2.new(0, 0, 0, 400)
    sc.Visible = isVisible
    sc.Parent = ContentContainer
    
    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 8)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Parent = sc
    
    return sc
end

local HomeScroll = createScrollContainer("HomeScroll", true)
local ScriptsScroll = createScrollContainer("ScriptsScroll", false)
local BrainrotScroll = createScrollContainer("BrainrotScroll", false)
local SettingsScroll = createScrollContainer("SettingsScroll", false)

-- ==========================================
-- 7. EXECUTION CONTROLS (Fixed to Web Loadstrings)
-- ==========================================
local MainHeaderLabel = Instance.new("TextLabel")
MainHeaderLabel.Size = UDim2.new(1, 0, 0, 25)
MainHeaderLabel.BackgroundTransparency = 1
MainHeaderLabel.Text = "Main Executes"
MainHeaderLabel.TextColor3 = COLORS.TextMain
MainHeaderLabel.TextSize = 16
MainHeaderLabel.Font = Enum.Font.GothamBold
MainHeaderLabel.TextXAlignment = Enum.TextXAlignment.Left
MainHeaderLabel.LayoutOrder = 0
MainHeaderLabel.Parent = HomeScroll
local function createExecButton(name, url, order)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -4, 0, 45)
    btn.BackgroundColor3 = COLORS.RowBg
    btn.Text = "Execute " .. name
    btn.TextColor3 = COLORS.TextMain
    btn.TextSize = 14
    btn.Font = Enum.Font.GothamMedium
    btn.LayoutOrder = order
    btn.Parent = HomeScroll
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        -- Changed execution to dynamically pull from your desired URLs instead of local files
        local successRun, err = pcall(function()
            loadstring(game:HttpGet(url))()
        end)
        if not successRun then
            print("Execution Error on " .. name .. ": " .. tostring(err))
        end
    end)
end

-- Re-bound specifically to download directly from the target web repositories cleanly
createExecButton("Cobalt", "https://github.com", 1)
createExecButton("Infinite Yield", "https://githubusercontent.com", 2)

-- ==========================================
-- 8. VIEW STATE HANDLERS (TAB SYSTEM)
-- ==========================================
local tabMap = {
    [HomeBtn] = HomeScroll,
    [ScriptsBtn] = ScriptsScroll,
    [BrainrotBtn] = BrainrotScroll,
    [SettingsBtn] = SettingsScroll
}

local function switchTab(clickedBtn)
    for btn, scrollFrame in pairs(tabMap) do
        if btn == clickedBtn then
            btn.BackgroundColor3 = COLORS.ContentBg
            btn.BackgroundTransparency = 0
            btn.Font = Enum.Font.GothamBold
            scrollFrame.Visible = true
        else
            btn.BackgroundColor3 = COLORS.SidebarBg
            btn.BackgroundTransparency = 1
            btn.Font = Enum.Font.GothamMedium
            scrollFrame.Visible = false
        end
    end
end

HomeBtn.MouseButton1Click:Connect(function() switchTab(HomeBtn) end)
ScriptsBtn.MouseButton1Click:Connect(function() switchTab(ScriptsBtn) end)
BrainrotBtn.MouseButton1Click:Connect(function() switchTab(BrainrotBtn) end)
SettingsBtn.MouseButton1Click:Connect(function() switchTab(SettingsBtn) end)

-- ==========================================
-- 9. VISIBILITY & EJECTION TRIGGERS
-- ==========================================
HideUIButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    MiniBar.Visible = true
end)

ShowUIButton.MouseButton1Click:Connect(function()
    MiniBar.Visible = false
    MainFrame.Visible = true
end)

CloseUIButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy() -- Deletes everything instantly from game execution space
end)

-- ==========================================
-- 10. DRAG FRAMEWORK INTERFACE ENGINE
-- ==========================================
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

print("Full Brainrot Hub Engine Stack Initialized Successfully!")