--To be honest, I scripted this when I didn't sleep for 4 days. I don't even know how. I don't even remember when or how I wrote this script.

game:GetService("RunService"):Set3dRenderingEnabled(false)
game:GetService("RunService"):Stop()

local Background = Drawing.new("Square")
Background.Size = Vector2.new(10000, 10000)
Background.Filled = true
Background.Position = Vector2.new(0,0)
Background.ZIndex = 0
Background.Visible = true

wait(1)
local function WeibullDistribution(x, scale, k)
    if scale <= 1 then scale = 1 end
    if k <= 1 then k = 1 end
	if x >= 0 then
		return (k/scale) * ((x/scale)^(k-1)) * (2.71828^-((x/scale)^k))
	else
		return 0
	end
	
end

local tb2 = {}
for i = 75,125,0.05 do
    local New = Drawing.new("Square")
    New.Visible = true
    New.Position = Vector2.new(0, 0)
    New.Size = Vector2.new(1.01,1.01)
    New.Color = Color3.new(1,0,0)
    tb2[i] = New
end  

local tb = {}
for i = 75,125,0.05 do
    local New = Drawing.new("Square")
    New.Visible = true
    New.Position = Vector2.new(0, 0)
    New.Size = Vector2.new(1.01,1.01)
    New.Color = Color3.new(1,0,0)
    tb[i] = New
end    


local tb3 = {}
for i = 75,125,0.05 do
    local New = Drawing.new("Square")
    New.Visible = true
    New.Position = Vector2.new(0, 0)
    New.Size = Vector2.new(1.01,1.01)
    New.Color = Color3.new(1,0,0)
    tb3[i] = New
end    

local Index2 = 0
local Degress = 1
local Index3 = 1

game:GetService("RunService").Stepped:Connect(function()
    local FIndex3 = 75 + ((math.acos(math.cos(Index3 * math.pi))) * 15)
    for i,v in pairs(tb) do
        local Pos =  500 - (WeibullDistribution(i, FIndex3, math.sin(Index2) * 60) * 1000)
        v.Position = Vector2.new(
            -1000+(i*20) + (math.sin(math.rad(Degress)) * ((i-100)*32)), 
            Pos - (math.cos(math.rad(Degress)) * ((i-100)*2))
        )
        v.Color = Color3.fromHSV(1, math.acos(math.cos(math.pi * (i/1 + (Index2 * 7)))) / math.pi, 1)
    end
    
    for i,v in pairs(tb2) do
        local Pos =  500 - (WeibullDistribution(i, FIndex3 + .5, math.sin(Index2) * 60) * 1000)
        v.Position = Vector2.new(
            -1000+(i*20) + (math.sin(math.rad(Degress)) * ((i-100)*32)), 
            Pos - (math.cos(math.rad(Degress)) * ((i-100)*2))
        )
        v.Color = Color3.fromHSV(1, math.acos(math.cos(math.pi * (i/1 + (Index2 * 7)))) / math.pi, 1)
    end
    
    for i,v in pairs(tb3) do
        local Pos =  500 - (WeibullDistribution(i, FIndex3 - .5, math.sin(Index2) * 60) * 1000)
        v.Position = Vector2.new(
            -1000+(i*20) + (math.sin(math.rad(Degress)) * ((i-100)*32)), 
            Pos - (math.cos(math.rad(Degress)) * ((i-100)*2))
        )
        v.Color = Color3.fromHSV(1, math.acos(math.cos(math.pi * (i/1 + (Index2 * 7)))) / math.pi, 1)
    end
    
    
    
    Index2 = Index2 + 0.01
    if math.sin(Index2) <= 0.01 then
        Index2 = Index2 + 0.1
    end
    Degress = Degress + 0.1
    Index3 = Index3 + 0.0025
end)
