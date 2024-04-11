-- Assuming this script is in a LocalScript
local player = game.Players.LocalPlayer
local userInputService = game:GetService("UserInputService")
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local function teleportPlayer()
    local direction = humanoid.MoveDirection
    local newPosition = character.PrimaryPart.Position + direction * 10 -- Teleport 10 studs in the direction
    character:SetPrimaryPartCFrame(CFrame.new(newPosition))
end

local function onKeyPress(input)
    if input.KeyCode == Enum.KeyCode.Z then
        teleportPlayer()
    end
end

userInputService.InputBegan:Connect(onKeyPress)
