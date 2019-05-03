function dyn = get_LK_dyn_poly(con)

	% State is [ y r psi r ]'
	%
	% y 	- lateral position wrt lane center line
	% r 	- lateral velocity
	% psi 	- yaw angle
	% r 	- yaw rate
	%

	Car = con.Car; Caf = con.Caf; a = con.a; b = con.b; u0 = con.u0;
	m = con.m; Iz = con.Iz; dt = con.dt;

	% Continuous dynamics
    A=[0 1 u0 0; 
      0 -(Caf+Car)/(m*u0) 0 ((b*Car-a*Caf)/(m*u0) - u0); 
      0 0 0 1;
      0 (b*Car-a*Caf)/(Iz*u0)  0 -(a^2 * Caf + b^2 * Car)/(Iz*u0)];

    B=[0;Caf/m; 0; a*Caf/Iz];

    Em=[0;0;-1;0];

    % Integrate dynamics
    A_s = @(s) expm(s*A);
    Ad = A_s(dt);
    Bd = integral(A_s, 0, dt, 'ArrayValued', true) * B;
    Kd = zeros(4,1);
    Ed = zeros(4,0);
    Emd = integral(A_s, 0, dt, 'ArrayValued', true) * Em;
%     the following line is wrong
%     Emd = diag(Emd)
    Emd = [zeros(4,2),Emd,zeros(4,1)];

    % set rd to be the road curvature times the longitudinal velocity
    dmax = con.rd_max;
    df_max = con.df_max;
    XU_set = Polyhedron([0 0 0 0 1; 0 0 0 0 -1], [df_max; df_max]);
    Dm_set = Polyhedron([eye(4); -eye(4)], [0;0;dmax;0;0;0;dmax;0;]);
%     DisturbanceMax = XD(1:end-1)*X + XD(end)
%   	XD_plus = [0 0 0 0 con.alpha_ass*con.g/con.u0];
%   	XD_minus = [0 0 0 0 -con.alpha_ass*con.g/con.u0];
    XD_plus = zeros(0,5);
    XD_minus = zeros(0,5);
    
    dyn = Dyn(Ad,Kd,Bd,XU_set,Ed,XD_plus,XD_minus,Emd,Dm_set);
    % dyn.save_constant('feedback', K)
end