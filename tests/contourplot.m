clear all
close all
x = linspace(-5,5);
y = linspace(-5,5);
[X, Y] = meshgrid(x,y);
Z = (1/2) * (X - Y).^2 ;
contour(X,Y,Z,[1,1],'ShowText','on', 'Color', 'r')
axis equal
hold on
grid on

Z = (1/2) * (X + Y).^2;
contour(X,Y,Z,[1,1],'ShowText','on', 'Color', 'b')

Z = (1/2) * (X - Y).^2 + (1/2) * (X + Y).^2;
contour(X,Y,Z,[1,1],'ShowText','on', 'Color', 'k')

% Z = (2*X - Y).^2 + 0.25 * X.^2;
% contour(X,Y,Z,[1,1],'ShowText','on', 'Color', 'r')

% Z = (1/4*X.^2 + Y.^2);
% contour(X,Y,Z,[1,1],'ShowText','on', 'Color', 'b')
% 
% Z = ((2*X - Y).^2 + 1/4*X.^2 + Y.^2);
% contour(X,Y,Z,[1,1],'ShowText','on', 'Color', 'k')
% 
% Z = ((2*X - Y).^2 + 1/4*X.^2 + Y.^2);
% contour(X,Y,Z,[1,1],'ShowText','on', 'Color', 'k')

% Z = (1/4*(X).^2 + 1/4*Y.^2);
% contour(X,Y,Z,[1,1],'ShowText','on', 'Color', 'r')
% Z = ((X - 2*Y).^2 + Y.^2);
% Z = (1/4*(X + 2*Y).^2 + Y.^2);
% contour(X,Y,Z,[1,1],'ShowText','on')

% Z = (1/2*(X + 2*Y).^2 + 1/2*Y.^2);
% contour(X,Y,Z,[1,1],'ShowText','on')

% Z = (1/4*(X + 1).^2 + 1/4*(Y).^2);
% contour(X,Y,Z,[1,1],'ShowText','on', 'Color', 'b')
% 
% Z = (1/4*(X + Y).^2 + Y.^2);
% contour(X,Y,Z,[1/4,1/4],'ShowText','on')

% Z = (1/4*(X+Y+1).^10 + 1/4*(Y+1).^10);
% contour(X,Y,Z,[1,1],'ShowText','on', 'Color', 'b')

% Z = (1/4*(X+Y-1).^10 + 1/4*(Y-1).^10);
% contour(X,Y,Z,[1,1],'ShowText','on')

% Z = (1/4*(X+Y+1).^10 + 1/4*(X+Y-1).^10 + 1/4*(Y+1).^10 + 1/4*(Y-1).^10);
% contour(X,Y,Z,[1,1],'ShowText','on', 'Color', 'r')



