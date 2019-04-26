clear all
close all

% theta = linspace(0, 2*pi, 20);
% phi = linspace(-pi/2, pi/2, 20);

% M = [0, 0, 0;
%      0, 0, 0;
%      5, 6, 0;];
% 
% dt = 0.1;
% expm(M*dt)

v_bar = 10;
% 
% A=[0, 0, 0, 1, 0, 0;
%        0, 0, 0, 0, 1, 0;
%        0, 0, 0, 0, 0, 1;
%        0, 0, 0, 0, 0, 0;
%        0, 0, 0, 0, 0, v_bar;
%        0, 0, 0, 0, 0, 0];
% 
% B=[0, 0;
%    0, 0;
%    0, 0;
%    1, 0;
%    0, 0;
%    0, 1];
% 
% rank(ctrb(A,B))

% addpath('../')
% con = LK_constants;
% Car = con.Car; Caf = con.Caf; a = con.a; b = con.b; u0 = con.u0;
% m = con.m; Iz = con.Iz; dt = con.dt;
% 
% % Continuous dynamics
% A=[0 1 u0 0; 
%   0 -(Caf+Car)/(m*u0) 0 ((b*Car-a*Caf)/(m*u0) - u0); 
%   0 0 0 1;
%   0 (b*Car-a*Caf)/(Iz*u0)  0 -(a^2 * Caf + b^2 * Car)/(Iz*u0)];
% 
% B=[0;Caf/m; 0; a*Caf/Iz];

A=[0, 0, 0, 1, 0;
   0, 0, v_bar, 0, 0;
   0, 0, 0, 0, 1;
   0, 0, 0, 0, 0;
   0, 0, 0, 0, 0];

B=[0, 0;
   0, 0;
   0, 0;
   1, 0;
   0, 1];
rank(ctrb(A,B))