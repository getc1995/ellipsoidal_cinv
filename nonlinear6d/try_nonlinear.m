clear all
close all

% th = 0:0.01:(2*pi + 0.01);
% R = 10;
% dt = 0.01;
% angle = pi/6;
% x = R*cos(th) + dt .* R.*sin(th) .* R.*cos(th) .* cos(angle);
% y = R*sin(th) + dt .* R.*sin(th) .* R.*cos(th) .* sin(angle);
% 
% plot(x, y)
% axis equal
% grid on
% hold on
% 
% for R = 0.1:0.5:R
%     for th = 0:0.2:2*pi
%         x = R*cos(th) + dt .* R.*sin(th) .* R.*cos(th) .* cos(angle);
%         y = R*sin(th) + dt .* R.*sin(th) .* R.*cos(th) .* sin(angle);
%         plot(x, y, '.k')
%     end
% end

th = 0:0.01:(2*pi + 0.01);
R = 10;
dt = 0.1;
angle = pi/4;
u = 2;
x = R*cos(th) + dt .* u .* R.*cos(th) .* cos(angle);
y = R*sin(th) + dt .* u .* R.*cos(th) .* sin(angle);

plot(x, y, 'b')
axis equal
grid on
hold on

x = R*cos(th) + dt .* u .* R.*cos(th) .* cos(angle);
y = R*sin(th);
plot(x, y, 'r')

% for R = 0.1:0.5:R
%     for th = 0:0.2:2*pi
%         x = R*cos(th) + dt .* R.*sin(th) .* R.*cos(th) .* cos(angle);
%         y = R*sin(th) + dt .* R.*sin(th) .* R.*cos(th) .* sin(angle);
%         plot(x, y, '.k')
%     end
% end