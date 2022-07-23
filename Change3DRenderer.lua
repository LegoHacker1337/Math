--Yeah, this code is shit.
--You know why? Because it's like modern art, something incomprehensible, something smarter than your brain. shut up

game.RunService:Set3dRenderingEnabled(false)

local tb = {}
for i = -40,45,0.5 do
	for i2 = -50,50,0.5 do
		local Angle =  i2
		local Angle2 = i
		local Length = 999
		local Rotation = CFrame.Angles(math.rad(Angle2), math.rad(Angle),0)
		local rayAngle = Ray.new(workspace.CurrentCamera.CFrame.p, (workspace.CurrentCamera.CFrame * Rotation).lookVector * Length)
		local anglePart, position = workspace:FindPartOnRayWithIgnoreList(rayAngle , {})
		if anglePart then
			local p = Drawing.new("Square")
			tb[tostring(i).."|"..tostring(i2)] = p
		    p.Position = Vector2.new((1920/2) + (i2*10), (1080/2)+ (-i * 10))
			p.Size = Vector2.new(6,6)
			p.Visible = true
			p.Color = anglePart.Color
			
		else
		    local p = Drawing.new("Square")
			tb[tostring(i).."|"..tostring(i2)] = p
			p.Position = Vector2.new((1920/2) + (i2*10), (1080/2)+ (-i * 10))
			p.Size = Vector2.new(6,6)
			p.Visible = true
			p.Color = Color3.new(0,0,0.8)
		end    
	end
end
wait(3)
while task.wait() do
	for i = -45,45,0.5 do
		for i2 = -50,50,0.5 do
			local Angle =  i2
			local Angle2 = i
			local Length = 999
			local Rotation = CFrame.Angles(math.rad(Angle2), math.rad(Angle),0)
			local rayAngle = Ray.new(workspace.CurrentCamera.CFrame.p, (workspace.CurrentCamera.CFrame * Rotation).lookVector * Length)
			local anglePart, position = workspace:FindPartOnRayWithIgnoreList(rayAngle , {})
			if anglePart and tb[tostring(i).."|"..tostring(i2)] then
                local p = tb[tostring(i).."|"..tostring(i2)]
                p.Color = anglePart.Color
			elseif not anglePart and tb[tostring(i).."|"..tostring(i2)] then
			    local p = tb[tostring(i).."|"..tostring(i2)]
                p.Color = Color3.new(0,0,0.8)
            end    
		end
	end
end    
