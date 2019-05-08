clear all
close all

addpath('../ellipsoidal_approximation')
% E = diag([1/4, 1, 1]);
dim = 3;
Q = rand(dim)-0.5;
E = Q'*Q;

plot_E(E, 'b', [3;1;-1]);
axis equal
grid on
