local function createESP(player)
    local gui = Instance.new("BillboardGui")
    gui.Name = "ESP"
    gui.AlwaysOnTop = true
    gui.LightInfluence = 1
    gui.Size = UDim2.new(2, 0, 2, 0)
    gui.Parent = player.Character.Head

    local esp = Instance.new("TextLabel")
    esp.Size = UDim2.new(1, 0, 1, 0)
    esp.BackgroundTransparency = 0.5
    esp.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    esp.BorderSizePixel = 0
    esp.Text = player.Name -- Показываем ник игрока
    esp.TextColor3 = Color3.fromRGB(255, 255, 255)
    esp.Font = Enum.Font.SourceSansBold
    esp.TextSize = 16
    esp.Parent = gui
end

game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        if character:FindFirstChild("Humanoid") and character:FindFirstChild("HumanoidRootPart") then
            createESP(player)
        end
    end)
end)

for _, player in ipairs(game.Players:GetPlayers()) do
    if player.Character and player.Character:FindFirstChild("Humanoid") and player.Character:FindFirstChild("HumanoidRootPart") then
        createESP(player)
    end
end
