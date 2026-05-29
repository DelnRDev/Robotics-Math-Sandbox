local pointA = Vector3.new(0,0,0)
local pointB = Vector3.new(10,5,3)

local vectorV = pointB - pointA
local length = vectorV.Magnitude
local fHat = vectorV.Unit

local shaft = Instance.new("Part")
shaft.Anchored = true
shaft.Size = Vector3.new(0.2,0.2,length)

shaft.CFrame =
	CFrame.lookAt(pointA, pointB)
	* CFrame.new(0,0,-length/2)

shaft.Parent = workspace