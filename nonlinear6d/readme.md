6D tracking model for dubins car.
<p align="center"><img src="/nonlinear6d/tex/4b640ffb32cf5f300829dc3ed0f9dc24.svg?invert_in_darkmode&sanitize=true" align=middle width=328.52078984999997pt height=118.35734295pt/></p>
The ellipsoidal approximation doesn't work for this 6D model. The reason (my guess) is that the linearized 6D model is not controllable. Revise it into 5D and don't set bounds on <img src="/nonlinear6d/tex/ba7326097308b0bf1b4df7d997a770a7.svg?invert_in_darkmode&sanitize=true" align=middle width=24.41027819999999pt height=14.15524440000002pt/> and <img src="/nonlinear6d/tex/59ceb625e4161c1b08be55163a670257.svg?invert_in_darkmode&sanitize=true" align=middle width=23.074720349999986pt height=14.15524440000002pt/>, and that way we can find control invariant set.

Also, this model has many coupled terms, and finding a good approximation of the pre set is for systems with couple terms is still on the TODO list.

