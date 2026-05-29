local RunService = game:GetService("RunService")

local part = Instance.new("Part")
part.Anchored = true
part.Parent = workspace


local function skew(v)
	return {
		{0, -v.Z, v.Y},
		{v.Z, 0, -v.X},
		{-v.Y, v.X, 0}
	}
end

local function matAdd(A, B)
	local C = {}

	for i = 1, 3 do
		C[i] = {}

		for j = 1, 3 do
			C[i][j] = A[i][j] + B[i][j]
		end
	end

	return C
end

local function matScale(A, s)
	local C = {}

	for i = 1, 3 do
		C[i] = {}

		for j = 1, 3 do
			C[i][j] = A[i][j] * s
		end
	end

	return C
end

local function matMul(A, B)
	local C = {}

	for i = 1, 3 do
		C[i] = {}

		for j = 1, 3 do
			C[i][j] = 0

			for k = 1, 3 do
				C[i][j] += A[i][k] * B[k][j]
			end
		end
	end

	return C
end

local function matVec(A, v)
	return Vector3.new(
		A[1][1] * v.X + A[1][2] * v.Y + A[1][3] * v.Z,
		A[2][1] * v.X + A[2][2] * v.Y + A[2][3] * v.Z,
		A[3][1] * v.X + A[3][2] * v.Y + A[3][3] * v.Z
	)
end

local I = {
	{1, 0, 0},
	{0, 1, 0},
	{0, 0, 1}
}

local function rotationRowsToCFrame(R, p)
	local right = Vector3.new(R[1][1], R[2][1], R[3][1])
	local up = Vector3.new(R[1][2], R[2][2], R[3][2])
	local back = Vector3.new(R[1][3], R[2][3], R[3][3])

	return CFrame.fromMatrix(p, right, up, back)
end

local function expSO3(phi)
	local theta = phi.Magnitude
	local A = skew(phi)
	local A2 = matMul(A, A)

	if theta < 1e-6 then
		return matAdd(I, A)
	end

	local s = math.sin(theta)
	local c = math.cos(theta)

	local term1 = matScale(A, s / theta)
	local term2 = matScale(A2, (1 - c) / (theta * theta))

	return matAdd(I, matAdd(term1, term2))
end

local function leftJacobianSO3(phi)
	local theta = phi.Magnitude
	local A = skew(phi)
	local A2 = matMul(A, A)

	if theta < 1e-6 then
		return matAdd(I, matScale(A, 0.5))
	end

	local c = math.cos(theta)
	local s = math.sin(theta)

	local term1 = matScale(A, (1 - c) / (theta * theta))
	local term2 = matScale(A2, (theta - s) / (theta * theta * theta))

	return matAdd(I, matAdd(term1, term2))
end

local function inverseLeftJacobianSO3(phi)
	local theta = phi.Magnitude
	local A = skew(phi)
	local A2 = matMul(A, A)

	if theta < 1e-6 then
		return matAdd(I, matScale(A, -0.5))
	end

	local c = math.cos(theta)
	local s = math.sin(theta)

	local coefficient =
		(1 / (theta * theta))
		-
		((1 + c) / (2 * theta * s))

	local term1 = matScale(A, -0.5)
	local term2 = matScale(A2, coefficient)

	return matAdd(I, matAdd(term1, term2))
end

local function logSE3(T)
	local axis, angle = T:ToAxisAngle()

	local phi
	if math.abs(angle) < 1e-6 then
		phi = Vector3.zero
	else
		phi = axis * angle
	end

	local p = T.Position
	local JInverse = inverseLeftJacobianSO3(phi)

	local rho = matVec(JInverse, p)

	return rho, phi
end

local function expSE3(rho, phi)
	local R = expSO3(phi)
	local J = leftJacobianSO3(phi)

	local p = matVec(J, rho)

	return rotationRowsToCFrame(R, p)
end

local function interpolateSE3(T0, T1, alpha)
	local deltaT = T0:ToObjectSpace(T1)

	local rho, phi = logSE3(deltaT)

	local scaledRho = rho * alpha
	local scaledPhi = phi * alpha

	return T0 * expSE3(scaledRho, scaledPhi)
end

local T0 = part.CFrame

local T1 =
	CFrame.new(20, 8, 10)
	* CFrame.Angles(
		math.rad(45),
		math.rad(120),
		math.rad(30)
	)

local duration = 3
local elapsed = 0

local connection

task.wait(2)

connection = RunService.Heartbeat:Connect(function(dt)
	elapsed += dt

	local alpha = math.clamp(elapsed / duration, 0, 1)

	part.CFrame = interpolateSE3(T0, T1, alpha)

	if alpha >= 1 then
		connection:Disconnect()
	end
end)