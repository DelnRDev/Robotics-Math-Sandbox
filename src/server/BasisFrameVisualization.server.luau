local origin = Vector3.new(0,5,0)

local cf =
	CFrame.new(origin)
	* CFrame.Angles(
		math.rad(30),
		math.rad(45),
		0
	)

local function drawAxis(direction, color)
	local axis = Instance.new("Part")

	axis.Anchored = true
	axis.Color = color
	axis.Size = Vector3.new(0.2,0.2,5)

	axis.CFrame =
		CFrame.lookAt(
			origin,
			origin + direction
		)
		*
		CFrame.new(0,0,-2.5)

	axis.Parent = workspace
end

drawAxis(cf.RightVector, Color3.new(1,0,0))
drawAxis(cf.UpVector, Color3.new(0,1,0))
drawAxis(cf.LookVector, Color3.new(0,0,1))