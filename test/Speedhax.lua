local player = game.Players.LocalPlayer
local userInputService = game:GetService("UserInputService")
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local originalWalkSpeed = humanoid.WalkSpeed

local function setPlayerSpeed(speed)
    humanoid.WalkSpeed = speed
end

local function onKeyPress(input)
    if input.KeyCode == Enum.KeyCode.X then
        setPlayerSpeed(25)
    elseif input.KeyCode == Enum.KeyCode.C then
        setPlayerSpeed(16)
    end
end

userInputService.InputBegan:Connect(onKeyPress)
-- X on     C off