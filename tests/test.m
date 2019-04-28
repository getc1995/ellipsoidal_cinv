clear all
close all

addpath('../altmany-export_fig')
drawArrow = @(pt1,pt2,varargin) quiver( pt1(1),pt1(1),pt2(1)-pt1(1),pt2(2)-pt1(2),0, varargin{:} );

a = [-1, 2];
b = 2;
f = @(y, a, b) (b - a(2)*y)/a(1);
% E = 0.5 * interval_intersect_unitball(a, b);
% figure(1)
% hold on
% grid on
% axis equal
% y = -4:0.1:4;
% x = f(y,a,b);
% plot(x, y, 'b', 'LineWidth', 1.5)
% x = f(y,a,-b);
% plot(x, y, 'b', 'LineWidth', 1.5)
% 
% % plot(Polyhedron('A', [a;-a], 'b', [b;b]), 'alpha',0.3)
% 
E = [1, 0; 0, 0.25];
T = 1/sqrt(2)*[-1, 1; 1, 1];
E = 0.5 * T * E * T';
% plot_E(E, 'r')
% xlim([-4,4])
% ylim([-4,4])
% tightplot('../figures/polytope_intersect/1');
% 
[E1, ~] = interval_intersect(a, b, E);
% figure(3)
% hold on
% grid on
% axis equal
% x = f(y,a,b);
% plot(x, y, 'b', 'LineWidth', 1.5)
% x = f(y,a,-b);
% plot(x, y, 'b', 'LineWidth', 1.5)
% plot_E(E, 'r')
% plot_E(E1, 'k')
% xlim([-4,4])
% ylim([-4,4])
% tightplot('../figures/polytope_intersect/3');

% a2 = [1, 0];
% b2 = 2;
% figure(4)
% hold on
% grid on
% axis equal
% plot(Polyhedron('A', [a;-a;a2;-a2], 'b', [b;b;b2;b2]), 'alpha',0.3)
% xlim([-4,4])
% ylim([-4,4])
% E = [1, 0; 0, 0.25];
% T = 1/sqrt(2)*[-1, 1; 1, 1];
% E = 0.5 * T * E * T';
% plot_E(E, 'r')
% set(gcf,'color','w');
% % tightplot('../figures/polytope_intersect/4');
% 
% figure(5)
% hold on
% grid on
% axis equal
% plot(Polyhedron('A', [a;-a;a2;-a2], 'b', [b;b;b2;b2]), 'alpha',0.3)
% xlim([-4,4])
% ylim([-4,4])
% E = [1, 0; 0, 0.25];
% T = 1/sqrt(2)*[-1, 1; 1, 1];
% E = 0.5 * T * E * T';
% plot_E(E, 'r')
% set(gcf,'color','w');
% [E1, ~] = polytope_intersect(a, b, E);
% plot_E(E1, 'b')
% tightplot('../figures/polytope_intersect/5');
% 
% 
% figure(6)
% hold on
% grid on
% axis equal
% plot(Polyhedron('A', [a;-a;a2;-a2], 'b', [b;b;b2;b2]), 'alpha',0.3)
% xlim([-4,4])
% ylim([-4,4])
% E = [1, 0; 0, 0.25];
% T = 1/sqrt(2)*[-1, 1; 1, 1];
% E = 0.5 * T * E * T';
% plot_E(E, 'r')
% set(gcf,'color','w');
% [E1, ~] = polytope_intersect([a;a2], [b;b2], E);
% plot_E(E1, 'b')
% tightplot('../figures/polytope_intersect/6');



% [U,S,V] = svd(E);

% dim = 2;
% Q = rand(dim)-0.5;
% E = Q'*Q;
% 
% figure(1)
% plot_E(E,'b')
% hold on
% grid on
% axis equal
% 
% a = rand(1,dim)-0.5;
% b = rand(1);
% p = hyperplane(a', b);
% plot(p, 'k')
% 
% [E1, ~] = interval_intersect(a, b, E)
% 
% figure(1)
% hold on
% plot_E(E1)
% xlim([-10, 10])
% ylim([-10, 10])
% zlim([-10, 10])

% intersection_ia test
% % dim = 2;
% % Q = rand(dim)-0.5;
% % E1 = Q'*Q;
% % Q = rand(dim)-0.5;
% % E2 = Q'*Q;

% E1 = [0.25, 0; 0, 1];
% E2 = [1, 0; 0, 0.1];
% T = 1/sqrt(2)*[-1, 1; 1, 1];
% E1 = 0.5 * T * E1 * T';

% figure(1)
% plot_E(E1,'b')
% hold on
% plot_E(E2,'r')
% grid on
% axis equal
% xlim([-4,4])
% ylim([-4,4])
% tightplot('../figures/intersect_concentric_ia/1');
% % E_test = intersection_ia(ellipsoid(0.5*(inv(E1)+inv(E1)')), ellipsoid(0.5*(inv(E2)+inv(E2)')));
% % plot(E_test, 'g', 'LineWidth', 5)
% % hold on
% E = intersect_concentric_ia(E1, E2);

% % union_concentric_oa test
% figure(3)
% plot_E(E1,'b')
% hold on
% plot_E(E2,'r')
% E3 = union_concentric_oa(E1, E2);
% figure(3)
% plot_E(E3, 'k')
% grid on
% axis equal
% xlim([-4,4])
% ylim([-4,4])
% tightplot('../figures/union_concentric_oa/3');

%% Test for intersect_offset_ia
dim = 2;
E = [1, 0; 0, 0.25];
T = 1/sqrt(2)*[-1, 1; 1, 1];
E = 0.5 * T * E * T';
% control = [0; 0.25];

% Q = rand(dim)-0.5;
% E = Q'*Q;
% control = rand(dim, 1)-0.5;
% control = [control, null(control')];

c1 = [0.5; 0];
c2 = [0.2; 0.4];
control = [c1, c2];
V = [c1 + c2, ...
    c1 - c2, ...
    -c1 - c2, ...
    -c1 + c2, ...
    c1 + c2];

% figure(1)
% plot(V(1,:), V(2,:), 'r');
% grid on
% axis equal
% hold on
% plot_E(E, 'b')
% 
% drawArrow([0,0],c1,'color','k','linewidth',1.5, 'MaxHeadSize',1)
% hold on
% drawArrow([0,0],c2,'color','k','linewidth',1.5, 'MaxHeadSize',1)
% % plot([0, c1(1)], [0, c1(2)], 'k')
% % plot([0, c2(1)], [0, c2(2)], 'k')
% xlim([-4, 4])
% ylim([-4, 4])
% tightplot('../figures/intersect_offset_ia/1');

% figure(2)
% grid on
% axis equal
% hold on
% xlim([-4, 4])
% ylim([-4, 4])
% plot_E(E, 'r', c1 + c2)
% plot_E(E, 'r', c1 - c2)
% plot_E(E, 'r', -c1 + c2)
% plot_E(E, 'r', -c1 - c2)
% plot_E(E, 'b')
% tightplot('../figures/intersect_offset_ia/2');

% figure(3)
% grid on
% axis equal
% hold on
% xlim([-4, 4])
% ylim([-4, 4])
% drawArrow([0,0],c1,'color','k','linewidth',1.5, 'MaxHeadSize',1)
% drawArrow([0,0],-c1,'color','k','linewidth',1.5, 'MaxHeadSize',1)
% plot_E(E, 'r', -c1)
% plot_E(E, 'r', c1)
% tightplot('../figures/intersect_offset_ia/3');

% E1 = intersect_offset_ia(E, c1);
% figure(5)
% grid on
% axis equal
% hold on
% xlim([-4, 4])
% ylim([-4, 4])
% plot_E(E1, 'k')
% plot_E(E, 'r', -c1)
% plot_E(E, 'r', c1)
% tightplot('../figures/intersect_offset_ia/5');


% figure(4)
% grid on
% axis equal
% hold on
% xlim([-4, 4])
% ylim([-4, 4])
% drawArrow([0,0],c2,'color','k','linewidth',1.5, 'MaxHeadSize',1)
% drawArrow([0,0],-c2,'color','k','linewidth',1.5, 'MaxHeadSize',1)
% plot_E(E1, 'k', -c2)
% plot_E(E1, 'k', c2)
% tightplot('../figures/intersect_offset_ia/6');
% 
% E2 = intersect_offset_ia(E1, c2);
% figure(8)
% grid on
% axis equal
% hold on
% xlim([-4, 4])
% ylim([-4, 4])
% plot_E(E1, 'k', -c2)
% plot_E(E1, 'k', c2)
% plot_E(E2, 'r')
% tightplot('../figures/intersect_offset_ia/8');
% 
% 
% figure(10)
% grid on
% axis equal
% hold on
% xlim([-4, 4])
% ylim([-4, 4])
% plot_E(E, 'r', c1 + c2)
% plot_E(E, 'r', c1 - c2)
% plot_E(E, 'r', -c1 + c2)
% plot_E(E, 'r', -c1 - c2)
% plot_E(E2, 'b')
% tightplot('../figures/intersect_offset_ia/9');
% E2 = intersect_offset_ia(E, control);
% plot_E(E2, 'k')

%% Test for union_offset_oa
% figure(1)
% plot(V(1,:), V(2,:), 'r');
% grid on
% axis equal
% hold on
% plot_E(E, 'b')
% 
% drawArrow([0,0],c1,'color','k','linewidth',1.5, 'MaxHeadSize',1)
% hold on
% drawArrow([0,0],c2,'color','k','linewidth',1.5, 'MaxHeadSize',1)
% % plot([0, c1(1)], [0, c1(2)], 'k')
% % plot([0, c2(1)], [0, c2(2)], 'k')
% xlim([-4, 4])
% ylim([-4, 4])
% tightplot('../figures/union_offset_oa/1');
% 
% figure(2)
% grid on
% axis equal
% hold on
% xlim([-4, 4])
% ylim([-4, 4])
% plot_E(E, 'r', c1 + c2)
% plot_E(E, 'r', c1 - c2)
% plot_E(E, 'r', -c1 + c2)
% plot_E(E, 'r', -c1 - c2)
% plot_E(E, 'b')
% tightplot('../figures/union_offset_oa/2');
% 
% figure(3)
% grid on
% axis equal
% hold on
% xlim([-4, 4])
% ylim([-4, 4])
% drawArrow([0,0],c1,'color','k','linewidth',1.5, 'MaxHeadSize',1)
% drawArrow([0,0],-c1,'color','k','linewidth',1.5, 'MaxHeadSize',1)
% plot_E(E, 'r', -c1)
% plot_E(E, 'r', c1)
% tightplot('../figures/union_offset_oa/3');

% E1 = union_offset_oa(E, c1);
% figure(5)
% grid on
% axis equal
% hold on
% xlim([-4, 4])
% ylim([-4, 4])
% plot_E(E1, 'k')
% plot_E(E, 'r', -c1)
% plot_E(E, 'r', c1)
% tightplot('../figures/union_offset_oa/5');


% figure(4)
% grid on
% axis equal
% hold on
% xlim([-4, 4])
% ylim([-4, 4])
% drawArrow([0,0],c2,'color','k','linewidth',1.5, 'MaxHeadSize',1)
% drawArrow([0,0],-c2,'color','k','linewidth',1.5, 'MaxHeadSize',1)
% plot_E(E1, 'k', -c2)
% plot_E(E1, 'k', c2)
% tightplot('../figures/union_offset_oa/6');
% 
% E2 = union_offset_oa(E1, c2);
% figure(8)
% grid on
% axis equal
% hold on
% xlim([-4, 4])
% ylim([-4, 4])
% plot_E(E1, 'k', -c2)
% plot_E(E1, 'k', c2)
% plot_E(E2, 'r')
% tightplot('../figures/union_offset_oa/8');

% E2 = union_offset_oa(E, control);
% figure(10)
% grid on
% axis equal
% hold on
% xlim([-4, 4])
% ylim([-4, 4])
% plot_E(E, 'r', c1 + c2)
% plot_E(E, 'r', c1 - c2)
% plot_E(E, 'r', -c1 + c2)
% plot_E(E, 'r', -c1 - c2)
% plot_E(E2, 'k')
% tightplot('../figures/union_offset_oa/9');

%% Test for union_offset_ia

% figure(1)
% plot(V(1,:), V(2,:), 'r');
% grid on
% axis equal
% hold on
% plot_E(E, 'b')
% 
% drawArrow([0,0],c1,'color','k','linewidth',1.5, 'MaxHeadSize',1)
% hold on
% drawArrow([0,0],c2,'color','k','linewidth',1.5, 'MaxHeadSize',1)
% % plot([0, c1(1)], [0, c1(2)], 'k')
% % plot([0, c2(1)], [0, c2(2)], 'k')
% xlim([-4, 4])
% ylim([-4, 4])
% tightplot('../figures/union_offset_ia/1');

% figure(2)
% grid on
% axis equal
% hold on
% xlim([-4, 4])
% ylim([-4, 4])
% plot_E(E, 'r', c1 + c2)
% plot_E(E, 'r', c1 - c2)
% plot_E(E, 'r', -c1 + c2)
% plot_E(E, 'r', -c1 - c2)
% plot_E(E, 'b')
% tightplot('../figures/union_offset_ia/2');
% 
% figure(3)
% grid on
% axis equal
% hold on
% xlim([-4, 4])
% ylim([-4, 4])
% drawArrow([0,0],c1,'color','k','linewidth',1.5, 'MaxHeadSize',1)
% drawArrow([0,0],-c1,'color','k','linewidth',1.5, 'MaxHeadSize',1)
% plot_E(E, 'r', -c1)
% plot_E(E, 'r', c1)
% tightplot('../figures/union_offset_ia/3');

% E1 = union_offset_ia(E, c1);
% figure(5)
% grid on
% axis equal
% hold on
% xlim([-4, 4])
% ylim([-4, 4])
% plot_E(E1, 'k')
% plot_E(E, 'r', -c1)
% plot_E(E, 'r', c1)
% tightplot('../figures/union_offset_ia/5');


% figure(4)
% grid on
% axis equal
% hold on
% xlim([-4, 4])
% ylim([-4, 4])
% drawArrow([0,0],c2,'color','k','linewidth',1.5, 'MaxHeadSize',1)
% drawArrow([0,0],-c2,'color','k','linewidth',1.5, 'MaxHeadSize',1)
% plot_E(E1, 'k', -c2)
% plot_E(E1, 'k', c2)
% tightplot('../figures/union_offset_ia/6');
% 
% E2 = union_offset_ia(E1, c2);
% figure(8)
% grid on
% axis equal
% hold on
% xlim([-4, 4])
% ylim([-4, 4])
% plot_E(E1, 'k', -c2)
% plot_E(E1, 'k', c2)
% plot_E(E2, 'r')
% tightplot('../figures/union_offset_ia/8');

% E2 = union_offset_ia(E, control);
% figure(10)
% grid on
% axis equal
% hold on
% xlim([-4, 4])
% ylim([-4, 4])
% plot_E(E, 'r', c1 + c2)
% plot_E(E, 'r', c1 - c2)
% plot_E(E, 'r', -c1 + c2)
% plot_E(E, 'r', -c1 - c2)
% plot_E(E2, 'k')
% tightplot('../figures/union_offset_ia/9');


%% Test for union_offset_ia
% offset = 2;
% n = 2;
% E = eye(n);
% plot_E(E, 'r', [offset; 0])
% grid on
% axis equal
% hold on
% plot_E(E, 'r', [-offset; 0])
% E = union_offset_unitball_ia(n , offset);
% plot_E(E, 'b');

% dim = 3;
% % Q = [1, 0; 1, 2];
% Q = rand(dim) - 0.5;
% E = Q'*Q;
% mag = 0.5;
% % control = mag*[1; 1];
% control = mag*[1, 0; 0, 1; 0, 0];
% % control = rand(dim, 1)-0.5;
% % control = [control, null(control')];
% 
% figure(1)
% grid on
% axis equal
% hold on
% % % for i = 1:size(control, 2)
% % %     plot_E(E, 'r', control(:,i))
% % %     plot_E(E, 'r', -control(:,i))
% % % end
% % 
% % plot_E(E, 'r', [mag; mag])
% % plot_E(E, 'r', [-mag; -mag])
% 
% % plot_E(E, 'r', [mag; mag])
% % plot_E(E, 'r', [mag; -mag])
% % plot_E(E, 'r', [-mag; mag])
% % plot_E(E, 'r', [-mag; -mag])
% % 
% plot_E(E, 'r', [mag; mag; 0])
% plot_E(E, 'r', [mag; -mag; 0])
% plot_E(E, 'g', [-mag; mag; 0])
% plot_E(E, 'g', [-mag; -mag; 0])
% % plot_E(E, 'r', [mag; mag; -mag])
% % plot_E(E, 'r', [mag; -mag; -mag])
% % plot_E(E, 'r', [-mag; mag; -mag])
% % plot_E(E, 'r', [-mag; -mag; -mag])
% % 
% 
% % figure(2)
% % grid on
% % axis equal
% % hold on
% % plot_E(E, 'r', [mag; mag; 0])
% % plot_E(E, 'r', [mag; -mag; 0])
% % plot_E(E, 'r', [-mag; mag; 0])
% % plot_E(E, 'r', [-mag; -mag; 0])
% 
% E = union_offset_ia(E, control);
% plot_E(E, 'b')

%% Test union_offset_oa
% % offset = 2;
% % n = 2;
% % E = eye(n);
% % plot_E(E, 'r', [offset; 0])
% % grid on
% % axis equal
% % hold on
% % plot_E(E, 'r', [-offset; 0])
% % E = union_offset_unitball_oa(n, offset);
% % plot_E(E, 'b');
% 
% dim = 2;
% % E = [1, 0; 0, 0.25];
% % control = [0; 0.25];
% 
% Q = rand(dim)-0.5;
% E = Q'*Q;
% control = 0.25*eye(2);
% % control = rand(dim, 1)-0.5;
% % control = [control, null(control')];
% 
% figure(1)
% grid on
% axis equal
% hold on
% % for i = 1:size(control, 2)
% %     plot_E(E, 'r', control(:,i))
% %     plot_E(E, 'r', -control(:,i))
% % end
% 
% plot_E(E, 'r', [0.25; 0.25])
% plot_E(E, 'r', [0.25; -0.25])
% plot_E(E, 'r', [-0.25; 0.25])
% plot_E(E, 'r', [-0.25; -0.25])
% 
% E = union_offset_oa(E, control);
% plot_E(E, 'b')
% 
% figure
% Q = inv([2, -1; 0, -1]);
% plot_E(Q'*Q)
% grid on
% axis equal
% hold on

% %% Test pre
% dim = 4;
% E = eye(dim);
% % plot_E(E, 'r');
% grid on
% axis equal
% hold on
% A = 0.5^0.5 * [-1, 1, 0, 0; 1, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1];
% B = [0.5; 0; 0; 0];
% Em = 0.1 * eye(dim);
% Ed = 0.01 * eye(dim);
% 
% option = [];
% tic
% for i = 1:10000
% E1 = pre(E, A, B, Em, Ed, option);
% end
% time = toc
% % plot_E(E, 'b');