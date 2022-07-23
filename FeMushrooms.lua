game:GetService("RunService"):Set3dRenderingEnabled(false)

local Position = Vector2.new(1920/2,1080/2)

local tb = {}

local X = 1920
local Y = 1080

for i = 0,360,0.005 do
    local Rotation = math.rad(i)
    
    local PartOfCircle = Drawing.new("Line")
    PartOfCircle.Thickness = 0.005
    PartOfCircle.From = Position
    PartOfCircle.To = Vector2.new(
        (Position.X + (math.sin(Rotation) * (X))),
        (Position.Y - (math.cos(Rotation) * (Y)))
    )
    PartOfCircle.Color = Color3.new(0,0,0)
    PartOfCircle.Visible = true
    PartOfCircle.ZIndex = 1
    table.insert(tb, PartOfCircle)
end    

for i1 = 1000,10000,0.1 do
    for i2,v in pairs(tb) do
        v.Color = Color3.fromHSV(math.acos(math.cos(( (i1 * math.pi)) + (0.1 * i2))) / math.pi, 1,1)
    end    
    
    task.wait() 
end
