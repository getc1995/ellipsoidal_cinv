function dyn = get_LK_dyn_ellip_vband(con)

	% State is [ y r psi r ]'
	%
	% y 	- lateral position wrt lane center line
	% r 	- lateral velocity
	% psi 	- yaw angle
	% r 	- yaw rate
	%

	Car = con.Car; Caf = con.Caf; a = con.a; b = con.b; % u0 = con.u0;
	m = con.m; Iz = con.Iz; dt = con.dt;
    
%     p1 = 1/u
%     p2 = u
    p1 = con.p1;
    p2 = con.p2;

	% Continuous dynamics
    A=[0 1 p2 0; 
      0 -(Caf+Car)/m*p1 0 ((b*Car-a*Caf)/m*p1 - p2); 
      0 0 0 1;
      0 (b*Car-a*Caf)/Iz*p1  0 -(a^2 * Caf + b^2 * Car)/Iz*p1];

    B=[0;Caf/m; 0; a*Caf/Iz];

    Em=[0;0;-p2;0];
    
    Ed=eye(4);

    % Integrate dynamics
    A_s = @(s) expm(s*A);
    Ad = A_s(dt);
    Bd = integral(A_s, 0, dt, 'ArrayValued', true) * B;
%     Kd = zeros(4,1);
    Emd = integral(A_s, 0, dt, 'ArrayValued', true) * Em;
    Edd = integral(A_s, 0, dt, 'ArrayValued', true) * Ed;

%     con.y_max = 0.9;
%     con.nu_max = 10;
%     con.psi_max = 5*pi/180;
%     con.r_max = pi/6;

    box.A = [1, 0, 0, 0;
             0, 0, 1, 0;];
    box.b = [con.y_max;
             con.psi_max;];
    dyn.box = box;
    
    dyn.control = con.df_max;
    dyn.d_m = con.kappa;
    dyn.d_um = zeros(4,1);
%     dyn.d_um = [con.dy_max;
%             con.dnu_max;
%             con.dpsi_max;
%             con.dr_max];

    option = [];
    
    dyn.A = Ad;
%     for box control/disturbance set
    dyn.B = Bd;
    dyn.Em = Emd;
    dyn.Ed = Edd;
    
% 	for ellipsoidal control/disturbance set 
%     dyn.B = inv((Bd*diag(control))^2);
%     dyn.Em = inv((Emd*diag(d_m))^2);
%     dyn.Ed = inv((Edd*diag(d_um))^2);
    dyn.option = option;
end