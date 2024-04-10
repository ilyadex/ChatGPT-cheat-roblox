local ScreenGui = Instance.new("ScreenGui")
local github = Instance.new("TextLabel")
local chatgpt = Instance.new("TextLabel")


ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

github.Name = "github"
github.Parent = ScreenGui
github.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
github.BackgroundTransparency = 1.000
github.BorderColor3 = Color3.fromRGB(0, 0, 0)
github.BorderSizePixel = 0
github.Position = UDim2.new(0.42836675, 0, 0, 0)
github.Size = UDim2.new(0, 200, 0, 26)
github.Font = Enum.Font.Unknown
github.Text = "github.com/ilyadex"
github.TextColor3 = Color3.fromRGB(1, 255, 247)
github.TextScaled = true
github.TextSize = 14.000
github.TextWrapped = true

chatgpt.Name = "chatgpt"
chatgpt.Parent = ScreenGui
chatgpt.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
chatgpt.BackgroundTransparency = 1.000
chatgpt.BorderColor3 = Color3.fromRGB(0, 0, 0)
chatgpt.BorderSizePixel = 0
chatgpt.Position = UDim2.new(0.42836675, 0, 0.0335051529, 0)
chatgpt.Size = UDim2.new(0, 200, 0, 16)
chatgpt.Font = Enum.Font.Unknown
chatgpt.Text = "ChatGPT-cheat-roblox"
chatgpt.TextColor3 = Color3.fromRGB(1, 255, 247)
chatgpt.TextScaled = true
chatgpt.TextSize = 14.000
chatgpt.TextWrapped = true
