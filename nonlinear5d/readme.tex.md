5D tracking model for dubins car. The planning model has constant longitudinal velocity $\bar{v}$, and varying yaw rate $\hat{\omega}$.
$$
\begin{align*}
dt\begin{bmatrix}
x_r \\
y_r \\
\theta_r \\
v_r \\
\omega\\
\end{bmatrix} = 
\begin{bmatrix}
-\bar{v} + (\bar{v} + v_r) \cos\theta_r + y_r \hat{\omega} \\
(\bar{v} + v_r)\sin\theta_r - x_r \hat{\omega}\\
\omega - \hat{\omega}\\
0 \\
0\\
\end{bmatrix} + 
\begin{bmatrix}
0 \\
0\\
0\\
u_a \\
u_\alpha\\
\end{bmatrix}
\end{align*}
$$


