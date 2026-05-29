local origin =
	Vector3.new(0,5,0)

local direction =
	Vector3.new(10,2,-20)

local length =
	direction.Magnitude

local rayPart =
	Instance.new("Part")

rayPart.Anchored = true

rayPart.Size =
	Vector3.new(
		0.2,
		0.2,
		length
	)

rayPart.CFrame =
	CFrame.lookAt(
		origin,
		origin + direction
	)
	*
	CFrame.new(
		0,
		0,
		-length/2
	)

rayPart.Parent = workspace