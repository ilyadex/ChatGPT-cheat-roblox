local function createTracer(startPosition, endPosition, color)
    local tracer = Instance.new("Part")
    tracer.Size = Vector3.new(0.1, (endPosition - startPosition).magnitude, 0.1)
    tracer.Anchored = true
    tracer.CFrame = CFrame.new(startPosition, endPosition) * CFrame.new(0, 0, -tracer.Size.Y / 2)
    tracer.BrickColor = BrickColor.new(color)
    tracer.Parent = workspace
    return tracer
end

-- Example usage
local start = Vector3.new(0, 3, 0)
local target = Vector3.new(10, 3, 0)
local redTracer = createTracer(start, target, "Bright red")
