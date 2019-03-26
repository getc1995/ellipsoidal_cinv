clear all
close all

ellipsoids_init()
% c = [1; 2; 3];
% Q = [4, 0, 0; 0, 1, 0; 0, 0, 9];
c = [1; 2];
Q = [4, 0; 0, 1;];
E = ellipsoid(c, Q);
plot(E)
axis equal
grid on

E1 = [1, 2; 2, 1] * E + [3; 4];
plot(E1)

