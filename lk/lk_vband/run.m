clear all
close all

addpath('../../ellipsoidal_approximation')
addpath('../../tests')
addpath('../')

con = LK_constants;

% find the bounding polytope of u-1/u curve,
% using the method in
% S. Smith, P. Nilsson, and N. Ozay paper
syms v p1 p2;
f = [1/v, v];
p = [p1, p2];

sanity_check = 1;
func_poly = compute_hull(f, [con.u_min con.u_max], sanity_check);

% plot(func_poly, 'alpha', 0.3)
% hold on
% x = u_min:0.1:u_max;
% y = 1./x;
% plot(y, x)

num = size(func_poly.V', 2);
dyn_list = cell(1,num);

% Build dynamical system at each vertex
for i = 1:num
    vert = func_poly.V(i, :)';
    con.p1 = vert(1);
    con.p2 = vert(2);
    dyn_list{i} = get_LK_dyn_ellip_vband(con);
end

box = dyn_list{1}.box;
verbose = true;
% Find the dynamical system
tic
ellip = getcinv_vband(dyn_list, box, verbose);
time = toc

% simulation with MPC controller
T = 20;
ellip_list = cell(1,T);
ellip_list(:) = {ellip};

kappa = -con.kappa*ones(1,T);% .* sin(2*pi*t);
W = diag([0, 0, 0, 1, 0]);
x0 = zeros(4,1);
s0 = 0;

y_data = x0(1);
v_data = x0(2);
delta_yaw_data = x0(3);
r_data = x0(4);
steer_data = s0;
level_data = 0;
tic
simtime = 20;
time_interval = 0:con.dt:simtime+con.dt;
for t = 0:con.dt:simtime
%     rd = max_rd*sin(t);
%     rd = -pi/12*0.99999;
%     u = 0.6;
    u = (con.u_max-con.u_min)/2*sin(t) + (con.u_min+con.u_max)/2;
    rd = u*kappa;
    if t == 10
        kappa = -kappa;
    end
    
    con.u0 = u;
    dyn = get_LK_dyn_ellip(con);
    
    steer = LK_qcqp(dyn, x0, s0, W, ellip_list, rd);
    [y, v, delta_yaw, r] = lateral_model(u, x0, rd(1), steer, con);
    
    y_data = [y_data, y];
    v_data = [v_data, v];
    delta_yaw_data = [delta_yaw_data, delta_yaw];
    r_data = [r_data, r];
    steer_data = [steer_data, steer];
    level_data = [level_data, x0'*ellip.E*x0];
    x0 = [y; v; delta_yaw; r];
    s0 = steer;
end
time = toc

figure
subplot(4,2,1)
u = (con.u_max-con.u_min)/2*sin(time_interval) + (con.u_min+con.u_max)/2;
plot(time_interval, u)
xlabel('$t$ s', 'Interpreter', 'latex')
ylabel('$u$ m/s', 'Interpreter', 'latex')
xlim([0,simtime])

subplot(4,2,2)
len1 = length(0:con.dt:10);
len2 = length(10+con.dt:con.dt:simtime+con.dt);
kappa = [-con.kappa*ones(1,len1), con.kappa*ones(1,len2)];
plot(time_interval, kappa)
xlabel('$t$ s', 'Interpreter', 'latex')
ylabel('$\kappa $ m$^{-1}$', 'Interpreter', 'latex')
xlim([0,simtime])

subplot(4,2,3)
plot(time_interval, y_data)
xlabel('$t$ s', 'Interpreter', 'latex')
ylabel('$y$ m', 'Interpreter', 'latex')
xlim([0,simtime])

subplot(4,2,4)
plot(time_interval, v_data)
xlabel('$t$ s', 'Interpreter', 'latex')
ylabel('$v$ m/s', 'Interpreter', 'latex')
xlim([0,simtime])

subplot(4,2,5)
plot(time_interval, delta_yaw_data * 180/pi)
xlabel('$t$ s', 'Interpreter', 'latex')
ylabel('$\Delta\Psi$ degree', 'Interpreter', 'latex')
xlim([0,simtime])

subplot(4,2,6)
plot(time_interval, r_data * 180/pi)
xlabel('$t$ s', 'Interpreter', 'latex')
ylabel('$r$ s', 'Interpreter', 'latex')
xlim([0,simtime])

subplot(4,2,7)
plot(time_interval, steer_data * 180/pi)
xlabel('$t$ s', 'Interpreter', 'latex')
ylabel('steer degree', 'Interpreter', 'latex')
xlim([0,simtime])

subplot(4,2,8)
plot(time_interval, level_data)
xlabel('$t$ s', 'Interpreter', 'latex')
ylabel('$x^T E x$', 'Interpreter', 'latex')
xlim([0,simtime])
tightplot('../../figures/lk_vband/step_response');


