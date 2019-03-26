clear all
close all

addpath('ellipsoidal_approximation')

con = LK_constants;
dyn = get_LK_dyn_ellip(con);

box.A = [1, 0, 0, 0;
         0, 0, 1, 0;];
box.b = [con.y_max;
         con.psi_max;];

ellip = getcinv(dyn, box);
% plot_E_4d(E)

T = 100;
ellip_list = cell(1,T);
ellip_list(:) = {ellip};

t = 0.1*(1:T);
rd = -dyn.d_m*ones(1,T);% * sin(2*pi*t);
W = diag([1, 0, 100, 0, 100]);
x0 = zeros(4,1);
s0 = 0;
tic
for i = 1:100
steer_output = LK_qcqp(dyn, x0, s0, W, ellip_list, rd);
end
time = toc

