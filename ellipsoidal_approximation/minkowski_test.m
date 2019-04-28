close all
clear all

% This is a file that tests minkowski sum/diff 
% of two ellipsoids

n = 3;

Q1 = 10*(rand(n) - 0.5);
Q2 = rand(n) - 0.5;
% Q3 = Q1 + Q2;

Q1 = Q1 * Q1';
Q2 = Q2 * Q2';
% Q3 = Q3^2;


plot(ellipsoid(Q1), 'r')
hold on
plot(ellipsoid(Q2), 'b')
% plot(ellipsoid(Q3), 'k')

axis equal
grid on
% 
% % option.show_all = true;

% 
[y, Y] = minksum([ellipsoid(Q1), ellipsoid(Q2)]);
% [y, Y] = minkdiff(ellipsoid(Q1), ellipsoid(Q2));
plot3(Y(1,:), Y(2,:),Y(3,:), '.g')
% tic
% for i = 1:10000
%     n = 4;
%     syms x
%     
%     [U, S, ~] = svd(Q2);
%     T = U * sqrt(S);
%     T_inv = inv(T);
%     E_temp = T \ Q1 * T_inv';
%     
%     [U, S, ~] = svd(E_temp);
%     lambda = diag(S);
%     lhs = 1/(lambda(1)+x) + 1/(lambda(2)+x) + 1/(lambda(3)+x);
%     rhs = n/(x*(x+1));
% %     f = matlabFunction(lhs-rhs);
%     eqn = lhs==rhs;
%     lambda1 = sqrt(min(lambda));
%     lambda2 = sqrt(max(lambda));
%     p = double(vpasolve(eqn, x, [lambda1, min(lambda2, lambda1^2)]));
    
%     lambda = [25, 100, 400, 100];
% %     f = str2func('@(lambda, n, x) + 1/(lambda(1)+x) + 1/(lambda(2)+x) + 1/(lambda(3)+x)+ 1/(lambda(4)+x) - n/(x*(x+1))');
% %     f = @(x) 1/(25+x) + 1/(100+x) + 1/(400+x)+ 1/(100+x) - n/(x*(x+1));
% %     fzero(@(x) f(lambda, n, x), [5, 20]);
% %     Q_diff = (1+1/p)*Q1 + (1+p)*Q2;
%     p = solve_minkeqn(lambda, n, [5, 20]);
% end
% time = toc
% plot(ellipsoid(Q_diff), 'y')

% [E, c] = minksum_ellipsoid_oa(inv(Q1), zeros(n, 1), inv(Q2), zeros(n, 1));

% [E, c] = minkdiff_ellipsoid_ia(inv(Q1), zeros(n, 1), inv(Q2), zeros(n, 1));
% [E, c] = minkdiff_ellipsoid_oa(inv(Q1), zeros(n, 1), inv(Q2), zeros(n, 1));
[E, c] = minksum_ellipsoid_ia(inv(Q1), zeros(n, 1), inv(Q2), zeros(n, 1));
plot_E(E, 'y')








