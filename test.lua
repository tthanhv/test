local g = Instance.new("ScreenGui")
local f = Instance.new("Frame")
local c = Instance.new("Frame")
local b = Instance.new("TextButton")
local l = Instance.new("UIListLayout")
local t = Instance.new("TextButton")
local open = false

if game.CoreGui:FindFirstChild("TEST") then
    game.CoreGui:FindFirstChild("TEST"):Destroy()
end

g.Name = "TEST"
g.Parent = game.CoreGui

f.Size = UDim2.new(0, 500, 0, 300)
f.Position = UDim2.new(0.5, -250, 0.5, -150)
f.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
f.Visible = false
f.Active = true
f.Draggable = true
f.Parent = g

c.Size = UDim2.new(1, -10, 1, -50)
c.Position = UDim2.new(0, 5, 0, 5)
c.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
c.Parent = f

l.Parent = c
l.SortOrder = Enum.SortOrder.LayoutOrder
l.Padding = UDim.new(0, 5)

b.Size = UDim2.new(1, -10, 0, 40)
b.Position = UDim2.new(0, 5, 1, -45)
b.Text = "Clear"
b.TextColor3 = Color3.fromRGB(255, 255, 255)
b.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
b.Font = Enum.Font.SourceSansBold
b.TextSize = 20
b.Parent = f

b.MouseButton1Click:Connect(function()
    for _, v in pairs(c:GetChildren()) do
        if v:IsA("Frame") then
            v:Destroy()
        end
    end
end)

local function tstring(t)
    if type(t) == "table" then
        local str = "{"
        for k, v in pairs(t) do
            str = str .. tostring(k) .. "=" .. tstring(v) .. ", "
        end
        return str .. "}"
    else
        return tostring(t)
    end
end

local function newTab(n, d)
    local t = Instance.new("Frame")
    local lbl = Instance.new("TextLabel")

    t.Size = UDim2.new(1, -10, 0, 50)
    t.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    t.Parent = c

    lbl.Size = UDim2.new(1, -10, 1, -10)
    lbl.Position = UDim2.new(0, 5, 0, 5)
    lbl.Text = n .. "\\n" .. d
    lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    lbl.TextWrapped = true
    lbl.TextSize = 18
    lbl.Font = Enum.Font.SourceSans
    lbl.Parent = t
end

for _, v in pairs(game:GetDescendants()) do
    if v:IsA("RemoteEvent") then
        v.OnClientEvent:Connect(function(...)
            local args = {...}
            for i = 1, #args do
                args[i] = tstring(args[i])
            end
            newTab(v.Name, "OnClientEvent(" .. table.concat(args, ", ") .. ")")
        end)
    elseif v:IsA("RemoteFunction") then
        v.OnClientInvoke = function(...)
            local args = {...}
            for i = 1, #args do
                args[i] = tstring(args[i])
            end
            newTab(v.Name, "OnClientInvoke(" .. table.concat(args, ", ") .. ")")
        end
    end
end

t.Size = UDim2.new(0, 50, 0, 50)
t.Position = UDim2.new(0, 10, 0, 10)
t.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
t.Text = "x"
t.TextSize = 30
t.Parent = g
t.Active = true
t.Draggable = true

t.MouseButton1Click:Connect(function()
    open = not open
    f.Visible = open
    if open then
        for i = 1, 5 do
            f.BorderSizePixel = i
            wait(0.05)
        end
    else
        for i = 5, 0, -1 do
            f.BorderSizePixel = i
            wait(0.05)
        end
    end
end)
