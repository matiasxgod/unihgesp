local player = game.Players.LocalPlayer
local userInputService = game:GetService("UserInputService")
local teams = game:GetService("Teams")
local runService = game:GetService("RunService")

-- GUI Creation
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")
screenGui.Name = "ESP_Toggle"
screenGui.ResetOnSpawn = false

-- Main Frame (Draggable)
local frame = Instance.new("Frame")
frame.Parent = screenGui
frame.Size = UDim2.new(0, 220, 0, 160)
frame.Position = UDim2.new(0.5, -110, 0.5, -60)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 10)
frameCorner.Parent = frame

-- Title Label
local title = Instance.new("TextLabel")
title.Parent = frame
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.Text = "Highlight ESP Menu"
title.TextStrokeTransparency = 0.8

-- ESP Toggle Button
local espButton = Instance.new("TextButton")
espButton.Parent = frame
espButton.Size = UDim2.new(0.8, 0, 0, 40)
espButton.Position = UDim2.new(0.1, 0, 0.4, 0)
espButton.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
espButton.TextColor3 = Color3.fromRGB(255, 255, 255)
espButton.Font = Enum.Font.Gotham
espButton.TextSize = 16
espButton.Text = "Enable ESP"

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 6)
buttonCorner.Parent = espButton

-- Footer Label (Rainbow Text)
local footerLabel = Instance.new("TextLabel")
footerLabel.Parent = frame
footerLabel.Size = UDim2.new(1, 0, 0, 20)
footerLabel.Position = UDim2.new(0, 0, 0.9, 0)
footerLabel.BackgroundTransparency = 1
footerLabel.Font = Enum.Font.GothamBold
footerLabel.TextSize = 14
footerLabel.TextStrokeTransparency = 0.5
footerLabel.Text = "Made by Matias"
footerLabel.TextXAlignment = Enum.TextXAlignment.Center

local colors = {
    Color3.fromRGB(255, 0, 0),   -- Red
    Color3.fromRGB(255, 127, 0), -- Orange
    Color3.fromRGB(255, 255, 0), -- Yellow
    Color3.fromRGB(0, 255, 0),   -- Green
    Color3.fromRGB(0, 0, 255),   -- Blue
    Color3.fromRGB(75, 0, 130),  -- Indigo
    Color3.fromRGB(238, 130, 238) -- Violet
}

local currentIndex = 1
runService.RenderStepped:Connect(function()
    footerLabel.TextColor3 = colors[currentIndex]
    currentIndex = currentIndex + 1
    if currentIndex > #colors then
        currentIndex = 1
    end
end)

-- ESP Logic
local espEnabled = false
local espObjects = {}
local teamCheckEnabled = false
local lastUpdated = {}

local function applyESP(character)
    if character and character:FindFirstChild("HumanoidRootPart") then
        local highlight = Instance.new("Highlight")
        highlight.Parent = character
        highlight.FillTransparency = 1
        highlight.OutlineTransparency = 0
        highlight.OutlineColor = Color3.fromRGB(255, 0, 0)

        local billboard = Instance.new("BillboardGui")
        billboard.Parent = character
        billboard.Adornee = character:FindFirstChild("Head")
        billboard.Size = UDim2.new(0, 200, 0, 50)
        billboard.StudsOffset = Vector3.new(0, 2, 0)
        billboard.AlwaysOnTop = true

        local textLabel = Instance.new("TextLabel")
        textLabel.Parent = billboard
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        textLabel.Font = Enum.Font.GothamBold
        textLabel.TextSize = 9
        textLabel.TextStrokeTransparency = 0.5
        textLabel.Text = "Loading..."

        espObjects[character] = {highlight, billboard, textLabel}
    end
end

local function updateESP()
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local char = plr.Character
            local rootPart = char:FindFirstChild("HumanoidRootPart")
            local humanoid = char:FindFirstChild("Humanoid")
            local espData = espObjects[char]

            if rootPart and humanoid and espData then
                local distance = (rootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                local teamName = plr.Team and plr.Team.Name or "No Team"
                local health = math.floor(humanoid.Health)
                local maxHealth = math.floor(humanoid.MaxHealth)
                espData[3].Text = string.format("%s | %.1fm | %d/%d HP | %s", teamName, distance, health, maxHealth, plr.Name)
            end
        end
    end
end

local function refreshESP()
    -- Yeni ESP'yi sadece gerekli olduğunda ekleyelim
    for _, data in pairs(espObjects) do
        for _, obj in pairs(data) do
            obj:Destroy()
        end
    end
    espObjects = {}

    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr ~= player and plr.Character then
            -- Takım kontrolü aktifse ve oyuncu aynı takımda ise atla
            if teamCheckEnabled and plr.Team == player.Team then
                continue  -- Burada `return` yerine `continue` kullanıyoruz.
            end
            -- ESP'yi yalnızca farklı takımda olan oyunculara uygula
            applyESP(plr.Character)
        end
    end
end

local function toggleESP()
    espEnabled = not espEnabled
    espButton.Text = espEnabled and "Disable ESP" or "Enable ESP"

    if espEnabled then
        refreshESP()
        -- `RenderStepped` ile sürekli güncellemek yerine, sadece oyuncu değiştiğinde güncelleme yapalım.
        runService.Heartbeat:Connect(function()
            if espEnabled then
                updateESP()
            end
        end)
    else
        for _, data in pairs(espObjects) do
            for _, obj in pairs(data) do
                obj:Destroy()
            end
        end
        espObjects = {}
    end
end

espButton.MouseButton1Click:Connect(toggleESP)

-- TeamCheck Logic
local teamCheckButton = Instance.new("TextButton")
teamCheckButton.Parent = frame
teamCheckButton.Size = UDim2.new(0.8, 0, 0, 40)
teamCheckButton.Position = UDim2.new(0.1, 0, 0.6, 0)
teamCheckButton.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
teamCheckButton.TextColor3 = Color3.fromRGB(255, 255, 255)
teamCheckButton.Font = Enum.Font.Gotham
teamCheckButton.TextSize = 16
teamCheckButton.Text = "Enable TeamCheck"

local teamButtonCorner = Instance.new("UICorner")
teamButtonCorner.CornerRadius = UDim.new(0, 6)
teamButtonCorner.Parent = teamCheckButton

local function toggleTeamCheck()
    teamCheckEnabled = not teamCheckEnabled
    teamCheckButton.Text = teamCheckEnabled and "Disable TeamCheck" or "Enable TeamCheck"
    refreshESP()  -- Update ESP after toggling TeamCheck
end

teamCheckButton.MouseButton1Click:Connect(toggleTeamCheck)

-- Close Button (X)
local closeButton = Instance.new("TextButton")
closeButton.Parent = frame
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -40, 0, 5)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.BorderSizePixel = 0

closeButton.MouseButton1Click:Connect(function()
    -- Disable ESP and TeamCheck
    espEnabled = false
    teamCheckEnabled = false
    espButton.Text = "Enable ESP"
    teamCheckButton.Text = "Enable TeamCheck"

    -- Destroy all ESP objects
    for _, data in pairs(espObjects) do
        for _, obj in pairs(data) do
            obj:Destroy()
        end
    end
    espObjects = {}

    -- Destroy the GUI and unload the script
    screenGui:Destroy()
end)

-- RightControl Toggle for GUI Visibility
local guiVisible = true
userInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.RightControl then
        guiVisible = not guiVisible
        screenGui.Enabled = guiVisible
    end
end)

-- Detect new players or respawned players
game.Players.PlayerAdded:Connect(function(plr)
    plr.CharacterAdded:Connect(function()
        if espEnabled then
            -- Only refresh ESP if ESP is enabled
            refreshESP()
        end
    end)
end)
