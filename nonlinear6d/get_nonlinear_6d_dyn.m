function dyn = get_nonlinear_6d_dyn

	% State is [ xr yr thr vxr vyr w ]'
    %
	% vxr + yr * w_hat
    % vyr - xr * w_hat
    % w - w_hat
    % -vyr * w + ua * cos(thr) + vyr * w_hat
    % (vxr + v_bar) * w + ua * sin(thr) - (vxr + v_bar) * w_hat + vd * (w-w_hat)
    % u_alpha

	v_bar = 10;
    dt = 0.1;
    xr_max = 0.5;
    yr_max = 0.5;
    thr_max = pi/4;
    
    u_a = 3;
    u_alpha = pi/6;
    
    w_hat_max = pi/6;
    vd = 2;

	% Continuous dynamics
    A=[0, 0, 0, 1, 0, 0;
       0, 0, 0, 0, 1, 0;
       0, 0, 0, 0, 0, 1;
       0, 0, 0, 0, 0, 0;
       0, 0, 0, 0, 0, v_bar;
       0, 0, 0, 0, 0, 0];
   
    eig(A)

    B=[0, 0;
       0, 0;
       0, 0;
       1, 0;
       0, 0;
       0, 1];

    Em=[0, 0;
        0, 0;
       -1, 0;
        0, 0;
       -v_bar, 0;
        0, 0];

    % Integrate dynamics
    A_s = @(s) expm(s*A);
    Ad = A_s(dt);
    integral_A = integral(A_s, 0, dt, 'ArrayValued', true);
    Bd = integral_A * B;
%     Kd = zeros(4,1);
    Emd = integral_A * Em;
%     Edd = integral(A_s, 0, dt, 'ArrayValued', true) * Ed;
    Edd = eye(6);

%     con.y_max = 0.9;
%     con.nu_max = 10;
%     con.psi_max = 5*pi/180;
%     con.r_max = pi/6;

    box.A = [1, 0, 0, 0, 0, 0;
             0, 1, 0, 0, 0, 0;
             0, 0, 1, 0, 0, 0;];
    box.b = [xr_max;
             yr_max;
             thr_max];
    dyn.box = box;
    
    dyn.integral_A = integral_A;
    
    dyn.control = [u_a;
                   u_alpha];
               
    dyn.d_m = [w_hat_max;
               vd];
    dyn.d_um = zeros(6,1);
%     d_um = [con.dy_max;
%             con.dnu_max;
%             con.dpsi_max;
%             con.dr_max];

    option = [];
    
    dyn.A = Ad;
%     for box control/disturbance set
    dyn.B = Bd*diag(dyn.control);
    dyn.Em = Emd*diag(dyn.d_m);
    dyn.Ed = Edd*diag(dyn.d_um);
    
% 	for ellipsoidal control/disturbance set 
%     dyn.B = inv((Bd*diag(control))^2);
%     dyn.Em = inv((Emd*diag(d_m))^2);
%     dyn.Ed = inv((Edd*diag(d_um))^2);
    dyn.option = option;
end