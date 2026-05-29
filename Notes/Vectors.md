# Vectors

A vector can represent displacement, direction, or velocity.

Given two points:

$$
\vec{p}_A=
\begin{bmatrix}
x_A\\
y_A\\
z_A
\end{bmatrix}
$$

and

$$
\vec{p}_B=
\begin{bmatrix}
x_B\\
y_B\\
z_B
\end{bmatrix}
$$

the displacement from \(A\) to \(B\) is

$$
\vec{v}=
\vec{p}_B-\vec{p}_A
$$

The magnitude is

$$
\|\vec{v}\|=
\sqrt{v_x^2+v_y^2+v_z^2}
$$

The unit vector is

$$
\hat{v}=
\frac{\vec{v}}{\|\vec{v}\|}
$$

In Luau:

```lua
local pointA = Vector3.new(6, 1, 3)
local pointB = Vector3.new(2, 4, 5)

local vectorV = pointB - pointA
local length = vectorV.Magnitude
local vHat = vectorV.Unit