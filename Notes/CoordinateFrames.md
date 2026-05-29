

# Coordinate Frames

A coordinate frame is a set of orthonormal basis vectors attached to an object.

In Roblox, a `CFrame` stores both position and orientation:

$$
T=
\begin{bmatrix}
R & \vec{p}\\
0 & 1
\end{bmatrix}
$$

where

$$
R=
\begin{bmatrix}
| & | & |\\
\hat{r} & \hat{u} & \hat{b}\\
| & | & |
\end{bmatrix}
$$

and

$$
\vec{p}=
\begin{bmatrix}
x\\
y\\
z
\end{bmatrix}
$$

Roblox convention:

$$
\hat{r}=
\text{RightVector}
$$

$$
\hat{u}=
\text{UpVector}
$$

$$
\hat{b}=
\text{ZVector}
$$

$$
\hat{f}=
\text{LookVector}=
-\hat{b}
$$

So:

```lua
local cf = part.CFrame

local rHat = cf.RightVector
local uHat = cf.UpVector
local fHat = cf.LookVector
local bHat = -fHat