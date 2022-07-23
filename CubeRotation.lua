--Basically a rotation matrix
--Very easy to understand, FeMushrooms was a bit harder.
--It doesnt rotate well, Ill remake this script.
--Doom but in roblox soon (: ( I think )
local function MulMatrices(M1, M2)
	if #M1 ~= 4 and #M2 ~= 2 then return false end

	return (M1[1] * M2[1]) + (M1[2]*M2[2]), (M1[3] * M2[1]) + (M1[4]*M2[2])
end

local function MulMatrices2(M1, M2) 
	if #M1 ~= 9 and #M2 ~= 3 then return false end

	return ({
		(M2[1] * M1[1]) + (M2[2] * M1[2]) + (M2[3] * M1[3]),
		(M2[1] * M1[4]) + (M2[2] * M1[5]) + (M2[3] * M1[6]), 
		(M2[1] * M1[7]) + (M2[2] * M1[8]) + (M2[3] * M1[9])

	})
end    

local function CreateCube(Position, Size, Thickness)
	local Lines = {}
	local Shapes = {}

	local function CreateLine(From,To, Thickness)
		local From = Vector2.new(From.X, From.Y)
		local To = Vector2.new(To.X, To.Y)
		local New = Drawing.new("Line")
		New.From = From
		New.To = To
		New.Visible = true
		New.Thickness = Thickness

		table.insert(Lines, New)

		return New
	end    

	--Lines:

	CreateLine(Position, Position , Thickness)
	CreateLine(Position, Position , Thickness)
	CreateLine(Position, Position , Thickness)
	CreateLine(Position, Position , Thickness)
	CreateLine(Position, Position , Thickness)
	CreateLine(Position, Position , Thickness)
	CreateLine(Position, Position , Thickness)
	CreateLine(Position, Position , Thickness)
	CreateLine(Position, Position , Thickness)
	CreateLine(Position, Position , Thickness)
	CreateLine(Position, Position , Thickness)
	CreateLine(Position, Position , Thickness)
	--Shapes:
	local function ApplyPosition(NewVector)

		local X, Y, Z = NewVector.X, NewVector.Y, NewVector.Z
		local Size = Vector3.new(Size.X, Size.Y, NewVector.Z)

		--Front:

		--#Line1#--
		Lines[1].From = (Vector2.new(NewVector.X, NewVector.Y) - (Vector2.new(Size.X, Size.Y)) - Vector2.new(NewVector.Z,NewVector.Z))
		Lines[1].To = (Vector2.new(NewVector.X, NewVector.Y) - (Vector2.new(Size.X, -Size.Y)) - Vector2.new(NewVector.Z,NewVector.Z))

		--#Line2#--
		Lines[2].From = (Vector2.new(NewVector.X, NewVector.Y) - (Vector2.new(Size.X, -Size.Y)) - Vector2.new(NewVector.Z,NewVector.Z))
		Lines[2].To = (Vector2.new(NewVector.X, NewVector.Y) - (Vector2.new(-Size.X, -Size.Y)) - Vector2.new(NewVector.Z,NewVector.Z)) 


		--#Line3#--
		Lines[3].From = (Vector2.new(NewVector.X, NewVector.Y) - (Vector2.new(-Size.X, -Size.Y)) - Vector2.new(NewVector.Z,NewVector.Z))
		Lines[3].To = (Vector2.new(NewVector.X, NewVector.Y) - (Vector2.new(-Size.X, Size.Y)) - Vector2.new(NewVector.Z,NewVector.Z))


		--#Line4#--
		Lines[4].From = (Vector2.new(NewVector.X, NewVector.Y) - (Vector2.new(-Size.X, Size.Y)) - Vector2.new(NewVector.Z,NewVector.Z))
		Lines[4].To = (Vector2.new(NewVector.X, NewVector.Y) - (Vector2.new(Size.X, Size.Y)) - Vector2.new(NewVector.Z,NewVector.Z))


		--Back:

		--#Line1#--
		Lines[5].From = ((Vector2.new(NewVector.X, NewVector.Y) - (Vector2.new(Size.X, Size.Y)) + Vector2.new(Size.Z,Size.Z)) - Vector2.new(NewVector.Z,NewVector.Z))
		Lines[5].To = ((Vector2.new(NewVector.X, NewVector.Y) - (Vector2.new(Size.X, -Size.Y)) + Vector2.new(Size.Z,Size.Z)) - Vector2.new(NewVector.Z,NewVector.Z))

		--#Line2#--
		Lines[6].From = ((Vector2.new(NewVector.X, NewVector.Y) - (Vector2.new(Size.X, -Size.Y)) + Vector2.new(Size.Z,Size.Z)) - Vector2.new(NewVector.Z,NewVector.Z))
		Lines[6].To = ((Vector2.new(NewVector.X, NewVector.Y) - (Vector2.new(-Size.X, -Size.Y)) + Vector2.new(Size.Z,Size.Z)) - Vector2.new(NewVector.Z,NewVector.Z))

		--#Line3#--
		Lines[7].From = ((Vector2.new(NewVector.X, NewVector.Y) - (Vector2.new(-Size.X, -Size.Y)) + Vector2.new(Size.Z,Size.Z)) - Vector2.new(NewVector.Z,NewVector.Z))
		Lines[7].To = ((Vector2.new(NewVector.X, NewVector.Y) - (Vector2.new(-Size.X, Size.Y)) + Vector2.new(Size.Z,Size.Z)) - Vector2.new(NewVector.Z,NewVector.Z))

		--#Line4#--
		Lines[8].From = ((Vector2.new(NewVector.X, NewVector.Y) - (Vector2.new(-Size.X, Size.Y)) + Vector2.new(Size.Z,Size.Z)) - Vector2.new(NewVector.Z,NewVector.Z))
		Lines[8].To = ((Vector2.new(NewVector.X, NewVector.Y) - (Vector2.new(Size.X, Size.Y)) + Vector2.new(Size.Z,Size.Z)) - Vector2.new(NewVector.Z,NewVector.Z))

		--Back - Front Lines

		--#Line1#--
		Lines[9].From = Lines[1].From
		Lines[9].To = Lines[5].From

		--#Line2#--
		Lines[10].From = Lines[2].From
		Lines[10].To = Lines[6].From

		--#Line3#--
		Lines[11].From = Lines[3].From
		Lines[11].To = Lines[7].From

		--#Line4#--
		Lines[12].From = Lines[4].From
		Lines[12].To = Lines[8].From
	end

	local Angle = 0


	game.RunService.Stepped:Connect(function(t)
		local Rad = math.rad(Angle)
		local Pos = MulMatrices2({
			1,0,0,
			0, math.cos(Rad), -math.sin(Rad),
			0, math.sin(Rad), math.sin(Rad)
		}, {10,10,50})
		Pos = Vector3.new(Pos[1] + 500, Pos[2] + 500, Pos[3] + 50) 
		ApplyPosition(Pos)

		Angle = Angle + 1
	end)

end

CreateCube(Vector3.new(1000,900, 100), Vector3.new(120,20,200), 5)
