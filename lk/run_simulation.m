clear all
close all

addpath('ellipsoidal_approximation')

con = LK_constants;
u0 = 10;
con.u0 = u0;
dyn = get_LK_dyn_ellip(con);

box.A = [1, 0, 0, 0;
         0, 0, 1, 0;];
box.b = [con.y_max;
         con.psi_max;];

ellip = getcinv(dyn, box);
% plot_E_4d(E)

T = 20;
ellip_list = cell(1,T);
ellip_list(:) = {ellip};

t = con.dt*(1:T);
rd = -dyn.d_m*ones(1,T);% .* sin(2*pi*t);
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
%     u = (con.u_max-con.u_min)/2*sin(t) + (con.u_min+con.u_max)/2;
    if t == 10
        rd = -rd;
    end
    steer = LK_qcqp(dyn, x0, s0, W, ellip_list, rd);
    [y, v, delta_yaw, r] = lateral_model(u0, x0, rd(1), steer, con);
    
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
% title('$d_m = 0.5$ degree/s', 'Interpreter', 'latex')
subplot(3,2,1)
plot(time_interval, y_data)
xlabel('$t$ s', 'Interpreter', 'latex')
ylabel('$y$ m', 'Interpreter', 'latex')
xlim([0,simtime])

subplot(3,2,2)
plot(time_interval, v_data)
xlabel('$t$ s', 'Interpreter', 'latex')
ylabel('$v$ m/s', 'Interpreter', 'latex')
xlim([0,simtime])

subplot(3,2,3)
plot(time_interval, delta_yaw_data * 180/pi)
xlabel('$t$ s', 'Interpreter', 'latex')
ylabel('$\Delta\Psi$ degree', 'Interpreter', 'latex')
xlim([0,simtime])

subplot(3,2,4)
plot(time_interval, r_data * 180/pi)
xlabel('$t$ s', 'Interpreter', 'latex')
ylabel('$r$ s', 'Interpreter', 'latex')
xlim([0,simtime])

subplot(3,2,5)
plot(time_interval, steer_data * 180/pi)
xlabel('$t$ s', 'Interpreter', 'latex')
ylabel('steer degree', 'Interpreter', 'latex')
xlim([0,simtime])

subplot(3,2,6)
plot(time_interval, level_data)
xlabel('$t$ s', 'Interpreter', 'latex')
ylabel('$x^T E x$', 'Interpreter', 'latex')
xlim([0,simtime])
tightplot('../figures/lk/step_response');
tightplot('../figures/lk/frequency_response');

% tic
% for i = 1:1000
% steer_output = LK_qcqp(dyn, x0, s0, W, ellip_list, rd);
% end
% time = toc

