clear all
close all
% x = linspace(-5,5);
% y = linspace(-5,5);
% [X, Y] = meshgrid(x,y);
% offset = 0.99;
% Z = (X - offset).^2 + Y.^2;
% contour(X,Y,Z,[1,1],'ShowText','on', 'Color', 'r')
% axis equal
% hold on
% grid on
% 
% Z = (X + offset).^2 + Y.^2;
% contour(X,Y,Z,[1,1],'ShowText','on', 'Color', 'b')
% 
% Z = (X + offset).^2 + (X - offset).^2 + Y.^2;
% contour(X,Y,Z,[1,1],'ShowText','on', 'Color', 'k')
% 
% 
% E = intersection_ia(ellipsoid([offset; 0], eye(2)), ellipsoid([-offset; 0], eye(2)));
% plot(E, 'r')

% E = intersect_offset_ia(2, offset);
% plot_E(E,'b')

num = 2;
A = rand(num, 2)-0.5;
b = 100*rand(num,1);

[E, ~] = polytope_intersect(A, b);
VE = det(inv(E));
plot_E(E, 'r')
axis equal
hold on
grid on

A1 = [A; -A];
b1 = [b; b];
[C, d] = inner_ellipsoid_mosek(A1, b1);
plot_E(inv(C'*C), 'b')
E_ans = inv(C'*C);
VE_ans = det(inv(E_ans));
plot(Polyhedron(A1, b1), 'color', 'g', 'alpha', 0.3)


% offset1 = 0.5;
% offset2 = 0.5;
% Z = (X).^2/(offset1 + 1).^2 + Y.^2;
% contour(X,Y,Z,[1,1],'ShowText','on', 'Color', 'b')
% 
% axis equal
% hold on
% grid on
% 
% Z = (X - offset1).^2 + Y.^2;
% contour(X,Y,Z,[1,1],'ShowText','on', 'Color', 'r')
% Z = (X + offset1).^2 + Y.^2;
% contour(X,Y,Z,[1,1],'ShowText','on', 'Color', 'r')
% Z = (X - offset1).^2 + (Y - offset2).^2;
% contour(X,Y,Z,[1,1],'ShowText','on', 'Color', 'r')
% Z = (X + offset1).^2 + (Y + offset2).^2;
% contour(X,Y,Z,[1,1],'ShowText','on', 'Color', 'r')
