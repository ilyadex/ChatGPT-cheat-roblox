-- Создаем ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

-- Создаем рамку для радара
local radarFrame = Instance.new("Frame")
radarFrame.Size = UDim2.new(0.2, 0, 0.2, 0) -- Размер радара
radarFrame.Position = UDim2.new(0, 10, 0, 10) -- Положение радара в верхнем левом углу
radarFrame.AnchorPoint = Vector2.new(0, 0) -- Устанавливаем начальную точку якоря в верхний левый угол
radarFrame.BackgroundColor3 = Color3.new(0, 0, 0) -- Черный цвет радара
radarFrame.BorderSizePixel = 2
radarFrame.BorderColor3 = Color3.new(1, 1, 1) -- Белая рамка
radarFrame.Parent = screenGui

-- Создаем метки для каждой стороны света
local function createDirectionMarker(x, y, text)
    local directionMarker = Instance.new("TextLabel")
    directionMarker.Text = text
    directionMarker.Size = UDim2.new(0, 30, 0, 15)
    directionMarker.Position = UDim2.new(x, -15, y, -7.5)
    directionMarker.BackgroundTransparency = 1
    directionMarker.TextColor3 = Color3.new(1, 1, 1)
    directionMarker.Parent = radarFrame
end

createDirectionMarker(0.5, 0, "Север")
createDirectionMarker(0.5, 1, "Юг")
createDirectionMarker(0, 0.5, "Запад")
createDirectionMarker(1, 0.5, "Восток")

-- Функция обновления радара
local function updateRadar()
    -- Очищаем радар перед обновлением
    for _, obj in ipairs(radarFrame:GetChildren()) do
        if obj:IsA("Frame") then
            obj:Destroy()
        end
    end

    -- Получаем игроков
    local players = game.Players:GetPlayers()

    -- Рисуем метки для каждого игрока
    for _, player in ipairs(players) do
        if player ~= game.Players.LocalPlayer then
            local playerMarker = Instance.new("Frame")
            playerMarker.Size = UDim2.new(0, 5, 0, 5) -- Размер метки игрока
            playerMarker.BackgroundColor3 = Color3.new(1, 0, 0) -- Красный цвет метки
            playerMarker.BorderSizePixel = 0
            playerMarker.Position = UDim2.new(0.5 + player.Character.HumanoidRootPart.Position.X / game.Workspace.CurrentCamera.ViewportSize.X - 0.1, -2.5, 0.5 + player.Character.HumanoidRootPart.Position.Z / game.Workspace.CurrentCamera.ViewportSize.Y - 0.1, -2.5)
            playerMarker.Parent = radarFrame
        end
    end

    -- Рисуем метку для игрока
    local myMarker = Instance.new("Frame")
    myMarker.Size = UDim2.new(0, 5, 0, 5) -- Размер метки игрока
    myMarker.BackgroundColor3 = Color3.new(0, 0, 1) -- Синий цвет метки
    myMarker.BorderSizePixel = 0
    myMarker.Position = UDim2.new(0.5 + game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X / game.Workspace.CurrentCamera.ViewportSize.X - 0.1, -2.5, 0.5 + game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z / game.Workspace.CurrentCamera.ViewportSize.Y - 0.1, -2.5)
    myMarker.Parent = radarFrame
end

-- Обновляем радар каждую секунду
while true do
    updateRadar()
    wait(1)
end