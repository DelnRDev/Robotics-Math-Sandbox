for t = 0, 20, 0.1 do

	local x = t
	local y = math.sin(t)
	local z = 0

	local point =
		Instance.new("Part")

	point.Anchored = true

	point.Size =
		Vector3.new(
			0.2,
			0.2,
			0.2
		)

	point.Position =
		Vector3.new(
			x,
			y,
			z
		)

	point.Parent = workspace
end