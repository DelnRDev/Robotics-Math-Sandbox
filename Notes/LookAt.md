# Deriving CFrame.lookAt

Given two points:

$$
\vec{p}_A
$$

and

$$
\vec{p}_B
$$

Forward direction:

$$
\hat{f}=
\frac{\vec{p}_B-\vec{p}_A}
{\left\|\vec{p}_B-\vec{p}_A\right\|}
$$

Back direction:

$$
\hat{b}=
-\hat{f}
$$

World up:

$$
\hat{y}=
\begin{bmatrix}
0\\
1\\
0
\end{bmatrix}
$$

Right vector:

$$
\hat{r}=
\hat{y}
\times
\hat{b}
$$

Up vector:

$$
\hat{u}=
\hat{b}
\times
\hat{r}
$$

Rotation matrix:

$$
R=
\begin{bmatrix}
| & | & |\\
\hat{r} & \hat{u} & \hat{b}\\
| & | & |
\end{bmatrix}
$$