-- Создаем ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

-- Сервисы
local RunService = game:GetService("RunService")

-- Словарь для хранения квадратов игроков
local playerSquares = {}
local playerLabels = {} -- Для хранения текстовых надписей

-- Функция для отображения игроков
local function showPlayers()
    -- Создаем функцию для отображения игроков
    local function drawPlayers()
        -- Удаляем все квадраты игроков и текстовые надписи
        for _, square in pairs(playerSquares) do
            square:Destroy()
        end
        for _, label in pairs(playerLabels) do
            label:Destroy()
        end
        playerSquares = {}
        playerLabels = {}

        for _, player in ipairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer then
                local character = player.Character
                if character then
                    local humanoid = character:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        local rootPart = character:FindFirstChild("HumanoidRootPart")
                        if rootPart then
                            local position = game.Workspace.CurrentCamera:WorldToViewportPoint(rootPart.Position)
                            local sizeY = rootPart.Size.Y * 3.0
                            local sizeX = rootPart.Size.X * 2.0
                            
                            local playerSquare = Instance.new("Frame")
                            playerSquare.Size = UDim2.new(0, sizeX, 0, sizeY)
                            playerSquare.Position = UDim2.new(0, position.X, 0, position.Y)
                            playerSquare.AnchorPoint = Vector2.new(0.5, 0.5)
                            playerSquare.BackgroundColor3 = Color3.new(1, 0, 0)
                            playerSquare.BackgroundTransparency = 0.5
                            playerSquare.Parent = screenGui
                            
                            playerSquares[player] = playerSquare
                            
                            local playerLabel = Instance.new("TextLabel")
                            playerLabel.Size = UDim2.new(0, 100, 0, 20)
                            playerLabel.Position = UDim2.new(0, position.X - 50, 0, position.Y + sizeY / 2 + 5)
                            playerLabel.AnchorPoint = Vector2.new(0.5, 0)
                            playerLabel.Text = player.Name
                            playerLabel.TextColor3 = Color3.new(1, 1, 1)
                            playerLabel.BackgroundTransparency = 1
                            playerLabel.Parent = screenGui
                            
                            playerLabels[player] = playerLabel
                        end
                    end
                end
            end
        end
    end

    drawPlayers()

    RunService.RenderStepped:Connect(function()
        drawPlayers()
    end)

    game.Players.PlayerAdded:Connect(function(player)
        player.CharacterAdded:Connect(function(character)
            if playerSquares[player] then
                playerSquares[player]:Destroy()
                playerLabels[player]:Destroy()
                drawPlayers()
            end
        end)
    end)
end

showPlayers()