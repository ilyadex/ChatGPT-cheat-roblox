-- Создаем функцию для удаления прицела и линий
local function removeCrosshair()
    if screenGui then
        screenGui:Destroy() -- Удаляем ScreenGui с прицелом и линиями
    end
end

-- Подписываемся на событие "CharacterRemoving" для игрока
game.Players.LocalPlayer.CharacterRemoving:Connect(removeCrosshair)

-- Создаем ScreenGui только при старте игры
screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true -- Игнорируем внутренний отступ GUI (например, на мобильных устройствах)
screenGui.ResetOnSpawn = false -- Позволяет ScreenGui сохранить свои настройки при смене игрового мира
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.Enabled = false -- Выключаем ScreenGui временно
screenGui.DisplayOrder = 0 -- Устанавливаем порядок отображения на экране

-- Создаем крестик для прицела
local crosshair = Instance.new("Frame")
crosshair.Name = "Crosshair"
crosshair.Size = UDim2.new(0, 20, 0, 20) -- Устанавливаем размеры крестика
crosshair.AnchorPoint = Vector2.new(0.5, 0.5) -- Устанавливаем точку привязки крестика
crosshair.Position = UDim2.new(0.5, 0, 0.5, 0) -- Устанавливаем позицию крестика в центре экрана
crosshair.BackgroundColor3 = Color3.fromRGB(148, 0, 211) -- Устанавливаем цвет крестика (фиолетовый)
crosshair.BorderSizePixel = 0 -- Устанавливаем толщину границы крестика равной 0, чтобы убрать границу
crosshair.BackgroundTransparency = 1 -- Устанавливаем прозрачность крестика (0.5 означает 50% непрозрачности)

-- Создаем горизонтальную линию крестика
local horizontalLine = Instance.new("Frame")
horizontalLine.Name = "HorizontalLine"
horizontalLine.Size = UDim2.new(1, 0, 0, 2) -- Устанавливаем размеры горизонтальной линии
horizontalLine.Position = UDim2.new(0.5, 0, 0.5, 0) -- Устанавливаем позицию горизонтальной линии в центре экрана по вертикали
horizontalLine.AnchorPoint = Vector2.new(0.5, 0.5) -- Устанавливаем точку привязки горизонтальной линии
horizontalLine.BackgroundColor3 = Color3.fromRGB(148, 0, 211) -- Устанавливаем цвет линии (фиолетовый)

-- Создаем вертикальную линию крестика
local verticalLine = Instance.new("Frame")
verticalLine.Name = "VerticalLine"
verticalLine.Size = UDim2.new(0, 2, 1, 0) -- Устанавливаем размеры вертикальной линии
verticalLine.Position = UDim2.new(0.5, 0, 0.5, 0) -- Устанавливаем позицию вертикальной линии в центре экрана по горизонтали
verticalLine.AnchorPoint = Vector2.new(0.5, 0.5) -- Устанавливаем точку привязки вертикальной линии
verticalLine.BackgroundColor3 = Color3.fromRGB(148, 0, 211) -- Устанавливаем цвет линии (фиолетовый)

crosshair.Parent = screenGui
horizontalLine.Parent = crosshair
verticalLine.Parent = crosshair

-- Устанавливаем переменную скорости вращения
local rotationSpeed = 1

-- Функция для обновления угла поворота линий крестика
local function rotateLines()
    horizontalLine.Rotation = horizontalLine.Rotation - rotationSpeed
    verticalLine.Rotation = verticalLine.Rotation - rotationSpeed
end

-- Обновляем угол поворота линий каждый кадр
game:GetService("RunService").RenderStepped:Connect(rotateLines)

-- Делаем ScreenGui видимым
screenGui.Enabled = true

-- Отключаем курсор
game.Players.LocalPlayer:GetMouse().IconEnabled = false