function dyn = get_nonlinear_5d_dyn

	% State is [ xr yr thr vr w ]'
    %
	% -v_bar + (v_bar + vr)*cos(thr) + yr * w_hat
    % (v_bar + vr)*sin(thr) - xr * w_hat
    % w - w_hat
    % u_a
    % u_alpha

	v_bar = 10;
    dt = 0.1;
    xr_max = 0.2;
    yr_max = 0.2;
    thr_max = pi/4;
    
%     u_a = 4;
%     u_alpha = 3;
%     
%     w_hat_max = 0.1;
    
    u_a = 1;
    u_alpha = 3;
    
    w_hat_max = pi/120;
    vd = 0;

	% Continuous dynamics
    A=[0, 0, 0, 1, 0;
       0, 0, v_bar, 0, 0;
       0, 0, 0, 0, 1;
       0, 0, 0, 0, 0;
       0, 0, 0, 0, 0];

    B=[0, 0;
       0, 0;
       0, 0;
       1, 0;
       0, 1];

    Em=[0, 0;
        0, 0;
       -1, 0;
        0, 0;
        0, 0];

    % Integrate dynamics
    A_s = @(s) expm(s*A);
    Ad = A_s(dt);
    integral_A = integral(A_s, 0, dt, 'ArrayValued', true);
    Bd = integral_A * B;
%     Kd = zeros(4,1);
    Emd = integral_A * Em;
%     Edd = integral(A_s, 0, dt, 'ArrayValued', true) * Ed;
    Edd = eye(5);

%     con.y_max = 0.9;
%     con.nu_max = 10;
%     con.psi_max = 5*pi/180;
%     con.r_max = pi/6;

    box.A = [1, 0, 0, 0, 0;
             0, 1, 0, 0, 0;
             0, 0, 1, 0, 0;];
    box.b = [xr_max;
             yr_max;
             thr_max];
    dyn.box = box;
    
    dyn.integral_A = integral_A;
    
    dyn.control = [u_a;
                   u_alpha];
               
    dyn.d_m = [w_hat_max;
               vd];
    dyn.d_um = zeros(5,1);
%     dyn.d_um = [0.01;
%                 0.01;
%                 0.1/180*pi;
%                 0.01;
%                 0.1/180*pi;];

    option = [];
    
    dyn.A = Ad;
%     for box control/disturbance set
    dyn.B = Bd;
    dyn.Em = Emd;
    dyn.Ed = Edd;
    dyn.v_bar = v_bar;
    
% 	for ellipsoidal control/disturbance set 
%     dyn.B = inv((Bd*diag(control))^2);
%     dyn.Em = inv((Emd*diag(d_m))^2);
%     dyn.Ed = inv((Edd*diag(d_um))^2);
    dyn.option = option;
end