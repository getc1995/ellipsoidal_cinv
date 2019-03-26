clear all
close all

addpath('../ellipsoidal_approximation')

dyn = get_nonlinear_6d_dyn;

verbose = true;
E_init.E = diag([0.1, 0.1, 30/180*pi, 0.1, 0.1, 30/180*pi].^2);
E_init.c = zeros(6,1);

ellip = getcinv_nonlinear6d(dyn, dyn.box, verbose, E_init);
volume = 1/sqrt(det(ellip.E));
disp(['E volume: ', num2str(volume)])

E_sol = ellip.E;

figure()
proj_Ellipse([1;2],E_sol,1,[0;0],30,'r')
xlabel('$x_r$','interpreter','latex'); 
ylabel('$y_r$','interpreter','latex');
zlabel('$\theta_r$','interpreter','latex');
set(findall(gcf,'type','text'),'FontSize',30);set(gca,'FontSize',30)
set(gcf,'Color','w');

figure()
proj_Ellipse([3;6],E_sol,1,[0;0],30,'r')
xlabel('$\theta_r$','interpreter','latex'); ylabel('$\omega$','interpreter','latex');
set(findall(gcf,'type','text'),'FontSize',30);set(gca,'FontSize',30)
set(gcf,'Color','w');

figure()
proj_Ellipse([4;5],E_sol,1,[0;0],30,'r')
xlabel('$v_{\parallel}$','interpreter','latex'); ylabel('$v_{\perp}$','interpreter','latex');
set(findall(gcf,'type','text'),'FontSize',30);set(gca,'FontSize',30)
set(gcf,'Color','w');




