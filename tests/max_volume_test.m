clear all
close all

n = 2;
d = 0.4;
plot_E(eye(2), 'r', [d;0])
hold on
plot_E(eye(2), 'r', [-d;0])

costheta = (n-1)*d/(2*n) + sqrt(1/n + ((n-1)*d/(2*n))^2);
a = ((1-d*costheta)*(costheta-d))/costheta;
b = 1 - d*costheta;

E1 = diag([1/a, 1/b*ones(1, n-1)]);
plot_E(E1, 'b')
axis equal
hold on
grid on
xlim([-2,2])
ylim([-2,2])
plot([-d, costheta-d], [0, sqrt(1-costheta^2)], 'k', 'LineWidth', 1.5)
plot([0, d], [0, 0], 'k', 'LineWidth', 1.5)

plot([0, -sqrt(a)], [0, 0], '-.b', 'LineWidth', 1.5)
plot([0, 0], [0, -sqrt(b)], '-.b', 'LineWidth', 1.5)

tightplot('../figures/intersect_offset_unitball_ia/1')

% E2 = intersection_ia(ellipsoid([d; zeros(n-1, 1)], eye(n)), ellipsoid([-d;zeros(n-1, 1)], eye(n)));
% plot(E2, '-r')

figure(2)
plot_E(eye(2), 'r', [d;0])
hold on
plot_E(eye(2), 'r', [-d;0])
E = union_offset_unitball_oa(n, d);
plot_E(E, 'b')
axis equal
hold on
grid on
xlim([-2,2])
ylim([-2,2])
tightplot('../figures/union_offset_unitball_oa/1')

figure(3)
plot_E(eye(2), 'r', [d;0])
hold on
plot_E(eye(2), 'r', [-d;0])
plot([-d, d], [1, 1], 'r', 'LineWidth', 1.5)
plot([-d, d], [-1, -1], 'r', 'LineWidth', 1.5)
E = union_offset_unitball_ia(n, d);
plot_E(E, 'b')
axis equal
hold on
grid on
xlim([-2,2])
ylim([-2,2])
tightplot('../figures/union_offset_unitball_ia/1')