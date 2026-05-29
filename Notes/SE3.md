# SE(3)

A rigid body transform is

$$
T=
\begin{bmatrix}
R & \vec{p}\\
0 & 1
\end{bmatrix}
$$

where

$$
R \in SO(3)
$$

and

$$
\vec{p}\in\mathbb{R}^3
$$

Interpolation:

$$
T(\alpha)=
T_0
\exp
\left(
\alpha
\log
\left(
T_0^{-1}T_1
\right)
\right)
$$