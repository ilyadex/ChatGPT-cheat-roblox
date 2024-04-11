local function createESP(player)
    local gui = Instance.new("BillboardGui")
    gui.Name = "ESP"
    gui.AlwaysOnTop = true
    gui.LightInfluence = 1
    gui.Size = UDim2.new(2, 0, 2, 0)
    gui.Parent = player.Character.Head

    local esp = Instance.new("Frame")
    esp.Size = UDim2.new(1, 0, 1, 0)
    esp.BackgroundTransparency = 0.5
    esp.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    esp.BorderSizePixel = 0
    esp.Parent = gui

    local healthBar = Instance.new("Frame")
    healthBar.Size = UDim2.new(1, 0, 0.1, 0) -- Полоска здоровья будет занимать 10% высоты ESP
    healthBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    healthBar.BorderSizePixel = 0
    healthBar.Parent = esp

    local function updateHealth()
        local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            local healthRatio = humanoid.Health / humanoid.MaxHealth
            healthBar.Size = UDim2.new(healthRatio, 0, 0.1, 0) -- Обновляем размер полоски здоровья
        else
            gui:Destroy() -- Удаляем ESP, если игрок умер или покинул игру
        end
    end

    updateHealth()
    player.CharacterAdded:Connect(updateHealth)
    player.CharacterRemoving:Connect(function()
        gui:Destroy() -- Удаляем ESP при удалении персонажа
    end)
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
