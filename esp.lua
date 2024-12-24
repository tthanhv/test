-- author: HaXer19 

local function gcolor() 
    return Color3.fromRGB(math.random(50, 255), math.random(50, 255), math.random(50, 255))
end

local function fdis(distance)
    return string.format("%dm", math.floor(distance))
end

local function x1f2c3e4()
    local players = game:GetService("Players")
    local localPlayer = players.LocalPlayer
    local camera = workspace.CurrentCamera

    for _, player in pairs(players:GetPlayers()) do
        if player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local character = player.Character
            local head = character:FindFirstChild("Head")
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

            if head and humanoidRootPart then
                local distance = (humanoidRootPart.Position - localPlayer.Character.HumanoidRootPart.Position).magnitude
                local onScreen, screenPosition = camera:WorldToViewportPoint(head.Position)

                if onScreen then
                    local billboard = Instance.new("BillboardGui")
                    billboard.Adornee = head
                    billboard.Size = UDim2.new(0, 200, 0, 50)
                    billboard.StudsOffset = Vector3.new(0, 2, 0)
                    billboard.AlwaysOnTop = true
                    local textLabel = Instance.new("TextLabel")
                    textLabel.Size = UDim2.new(1, 0, 1, 0)
                    textLabel.BackgroundTransparency = 1
                    textLabel.TextColor3 = gcolor()
                    textLabel.TextStrokeTransparency = 0.2
                    textLabel.Font = Enum.Font.GothamBold
                    textLabel.TextSize = 14
                    textLabel.Text = string.format("Username: %s\nDisplay: %s\nDistance: %s", player.Name, player.DisplayName, fdis(distance))
                    textLabel.Parent = billboard
                    local aura = Instance.new("Frame")
                    aura.Size = UDim2.new(1, 4, 1, 4)
                    aura.Position = UDim2.new(-0.02, 0, -0.02, 0)
                    aura.BackgroundColor3 = gcolor()
                    aura.BorderSizePixel = 0
                    aura.BackgroundTransparency = 0.5
                    aura.Parent = billboard
                    billboard.Parent = player.Character
                end
            end
        end
    end
end

while true do
    pcall(function()
        x1f2c3e4()
    end)
    wait(2)
end
