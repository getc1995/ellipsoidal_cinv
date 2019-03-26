clear all
close all

n = 5;
d = 0.8;

costheta = (n-1)*d/(2*n) + sqrt(1/n + ((n-1)*d/(2*n))^2);
a = ((1-d*costheta)*(costheta-d))/costheta;
b = 1 - d*costheta;

E1 = diag([1/a, 1/b*ones(1, n-1)]);
% plot_E(E1, 'r')
% axis equal
% hold on
% grid on

E2 = intersection_ia(ellipsoid([d; zeros(n-1, 1)], eye(n)), ellipsoid([-d;zeros(n-1, 1)], eye(n)));
% plot(E2, '-r')
