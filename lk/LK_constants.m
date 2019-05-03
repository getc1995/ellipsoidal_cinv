function con = LK_constants

	% time step
	con.dt = 0.1;

	% nominal speed
	con.u0 = 10; %m/s
    con.u_max = 12;
    con.u_min = 10;

	% Vehicle parameters
    con.m =1650 ; %kg
    con.Iz= 2315; % kgm^2
    con.a=1.11; % m
    con.b = 1.59; % m
    con.L=con.a+con.b;
    
    % Tire parameters
	con.Caf = 1.330e5; % N/rad 
    con.Car = 9.88e4; % N/rad

    con.g = 9.82; %m/s^2

    % Maximal assumed road curvature as alpha*g
    con.alpha_ass = 0.32;

    % Road curvature in simulation
    con.alpha_road = 0.3;

    % LK bounds
    con.y_max = 0.9;
    con.nu_max = 10;
    con.psi_max = 5*pi/180;
    con.r_max = pi/6;
    
    con.dy_max = 0.05;
    con.dnu_max = 0.01;
    con.dpsi_max = 0.01;
    con.dr_max = 0.01;
    
    con.df_max = 5*pi/180;   % control
    
    con.rd_max = 5*pi/180;       % disturbance
%     con.u_max = 30;
%     con.u_min = 10;
    
    con.kappa = con.rd_max/con.u_max; % curvature

%     con.F_yfmax = 15; Not used

end