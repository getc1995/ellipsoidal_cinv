clear all
close all

addpath('../ellipsoidal_approximation')
addpath('../tests')

con = LK_constants;
con.u0 = 10;

%% Ellipsoidal method
dyn = get_LK_dyn_ellip(con);
% 
% box.A = [1, 0, 0, 0;
%          0, 0, 1, 0;];
% box.b = [con.y_max;
%          con.psi_max;];
verbose = false;
tic
ellip = getcinv(dyn, dyn.box, verbose);
time = toc
volume = 1/sqrt(det(ellip.E));
disp(['E volume: ', num2str(volume)])

% for dt = [0.01, 0.001, 0.0001]
%     con.dt = dt;
%     dyn = get_LK_dyn_ellip(con);
%     tic
%     ellip = getcinv(dyn, box, verbose, ellip);
%     time = toc
%     volume = 1/sqrt(det(ellip.E));
%     disp(['E volume: ', num2str(volume)])
% end

% plot_E_4d(ellip.E)


T = 10000;
rd = zeros(1, T);
tic
for i = 1:T
    d = rd(i);
    ellip = pre(ellip, dyn, d);
    
    [E, c] = polytope_intersect_sorted(dyn.box.A, dyn.box.b, ellip.E, ellip.c);
    ellip.E = E;
    ellip.c = c;
end
time = toc
% volume = 1/sqrt(det(ellip.E));
% disp(['E volume: ', num2str(volume)])

% %% Polytopic method
% dyn_poly = get_LK_dyn_poly(con);
% 
% ymax = con.y_max; %half lane width
% dPsi_max = con.psi_max; %*con.u_min/con.u0;
% 
% domain = Polyhedron('A', [1 0 0 0; 0 0 1 0; -1 0 0 0; 0 0 -1 0;], ...
%                     'b', [ymax; dPsi_max; ymax; dPsi_max]);
% 
% tic
% C_poly = dyn_poly.cinv_oi(domain, 1000, 0, 1);
% time = toc
% 
% disp(['C_poly volume: ', num2str(C_poly.volume)])
% % plot_4d_poly(C_poly)
% 
% % [C, d] = inner_ellipsoid_mosek(C_poly.A, C_poly.b);
% % E_poly = inv(C'*C);
% % volume = 1/sqrt(det(E_poly));
% % disp(['C_poly volume: ', num2str(C_poly.volume)])
% % disp(['E_poly volume: ', num2str(volume)])
% % plot_E_4d(E_poly)
% % 
% % 
% % V_prim = intersect1(domain, dyn_poly.pre(domain,1));
% % [C, d] = inner_ellipsoid_mosek(V_prim.A, V_prim.b);
% % E_init = inv(C'*C);

