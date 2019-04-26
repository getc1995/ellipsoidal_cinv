6D tracking model for dubins car.
$$
\begin{align*}
dt\begin{bmatrix}
x_r \\
y_r \\
\theta_r \\
vx_r \\
vy_r \\
\omega\\
\end{bmatrix} = 
\begin{bmatrix}
vx_r + y_r \hat{\omega} \\
vy_r - x_r \hat{\omega}\\
\omega - \hat{\omega}\\
-vy_r(\omega - \hat{\omega}) \\
(vx_r+\bar{v})(\omega - \hat{\omega}) \\
0\\
\end{bmatrix} + 
\begin{bmatrix}
0 \\
0\\
0\\
\cos \theta_r u_a \\
\sin \theta_r u_a \\
u_\alpha\\
\end{bmatrix}
\end{align*}
$$
The ellipsoidal approximation doesn't work for this 6D model. The reason (my guess) is that the linearized 6D model is not controllable. Revise it into 5D and don't set bounds on $vx_r$ and $vy_r$, and that way we can find control invariant set.

Also, this model has many coupled terms, and finding a good approximation of the pre set is for systems with couple terms is still on the TODO list.

