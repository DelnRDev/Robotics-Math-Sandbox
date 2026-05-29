# SE(3)

A rigid body transform consists of:

T =
[
R p
0 1
]

where:

R ∈ SO(3)

p ∈ ℝ³

Interpolation:

T(α)
=
T₀ exp(α log(T₀⁻¹T₁))

Applications:

- Robotics
- Computer Graphics
- Animation
- Motion Planning

Prerequisites:

- Linear Algebra
- Rotation Matrices
- Matrix Exponential
- Lie Groups