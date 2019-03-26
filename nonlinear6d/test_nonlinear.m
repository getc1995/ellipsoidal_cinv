clear all
close all

n = 3;
Q = rand(n,n) - 0.5;
% Q = diag([0.25, 1]);
% inv_chol = inv(chol(Q))
% chol_inv = chol(inv(Q))
E = Q'*Q;
plot_E(E)
grid on
axis equal

% extreme_value(E, 2)

% extreme_value_cross(E, 3, 2)
% 
% Q = (inv(E) + inv(E)')/2;
% contour = ellbndr_3d(ellipsoid(Q));
% max(contour(3,:) .* contour(2,:))

E1 = E;
dim = 3;
E1(dim,:) = [];
E1(:,dim) = [];
figure
plot_E(E1)
grid on
axis equal
