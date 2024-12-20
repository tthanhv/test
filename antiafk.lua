local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    game:GetService("StarterGui"):SetCore("SendNotification", { 
        Title = "Anti AFK";
        Text = "By HaXer19";
        Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150";
        Duration = 5; 
    })
end)
