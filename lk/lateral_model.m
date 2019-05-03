function [y, v, delta_yaw, r] = lateral_model(u, x0, rd, steer, con)
    %% v0 and v in m/s, r0 and r and in rads
    %% u and steer are like the input arrays to the system
    Car = con.Car; Caf = con.Caf; a = con.a; b = con.b;
    m = con.m; Iz = con.Iz;
    
    y0 = x0(1);
    v0 = x0(2);
    delta_yaw0 = x0(3);
    r0 = x0(4);
    
    A=[0 1 u 0; 
      0 -(Caf+Car)/(m*u) 0 ((b*Car-a*Caf)/(m*u) - u); 
      0 0 0 1;
      0 (b*Car-a*Caf)/(Iz*u)  0 -(a^2 * Caf + b^2 * Car)/(Iz*u)];

    B=[0;Caf/m; 0; a*Caf/Iz];

    E=[0;0;-1;0];
    K = [0; 0; 0; 0];

    state = [y0, v0, delta_yaw0, r0];
    dt = con.dt;
    
    A_s = @(s) expm(s*A);
    Ad = A_s(dt);
    Bd = integral(A_s, 0, dt, 'ArrayValued', true) * B;
    Kd = zeros(4,1);
    Ed = integral(A_s, 0, dt, 'ArrayValued', true) * E;
    
    state = Ad*(state') + Bd*steer + Ed*rd + Kd;

    y = state(1);
    v = state(2);
    delta_yaw = state(3);
    r = state(4);
end

