local pointA = Vector3.new(6,1,3)
local pointB = Vector3.new(2,4,5)

local vectorV = pointB - pointA

local fHat = vectorV.Unit
local bHat = -fHat

local rHat =
	Vector3.yAxis:Cross(bHat).Unit

local uHat =
	bHat:Cross(rHat).Unit

local shaft = Instance.new("Part")

shaft.Anchored = true
shaft.Size =
	Vector3.new(
		0.5,
		0.5,
		vectorV.Magnitude
	)

shaft.CFrame =
	CFrame.new(pointA)
	*
	CFrame.fromMatrix(
		Vector3.zero,
		rHat,
		uHat,
		bHat
	)
	*
	CFrame.new(
		0,
		0,
		-vectorV.Magnitude/2
	)

shaft.Parent = workspace