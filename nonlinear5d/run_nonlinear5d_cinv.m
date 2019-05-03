clear all
close all

addpath('../ellipsoidal_approximation')

dyn = get_nonlinear_5d_dyn;

verbose = false;
E_init.E = diag([0.2, 0.2, 5/180*pi, 0.1, 5/180*pi].^(-2));
E_init.c = zeros(5,1);

tic
ellip = getcinv_nonlinear5d(dyn, dyn.box, verbose, E_init);
time = toc
volume = 1/sqrt(det(ellip.E));
disp(['E volume: ', num2str(volume)])

E_sol = ellip.E;

figure()
proj_Ellipse([1;2],E_sol,1,[0;0],30,'r')
xlabel('$x_r$ m','interpreter','latex'); ylabel('$y_r$ m','interpreter','latex');
xlim([-0.5,0.5])
ylim([-0.5,0.5])
set(findall(gcf,'type','text'),'FontSize',20);set(gca,'FontSize',20)
set(gcf,'Color','w');
% tightplot('../figures/5d/ellipse1');

figure()
proj_Ellipse([3;5],E_sol,1,[0;0],30,'r')
xlabel('$\theta_r$ rad','interpreter','latex'); ylabel('$\omega$ rad','interpreter','latex');
xlim([-0.8,0.8])
ylim([-0.8,0.8])
set(findall(gcf,'type','text'),'FontSize',20);set(gca,'FontSize',20)
set(gcf,'Color','w');
% tightplot('../figures/5d/ellipse2');

% figure()
% proj_Ellipse([4;5],E_sol,1,[0;0],30,'r')
% xlabel('$v_{\parallel}$','interpreter','latex'); ylabel('$v_{\perp}$','interpreter','latex');
% set(findall(gcf,'type','text'),'FontSize',30);set(gca,'FontSize',30)
% set(gcf,'Color','w');




