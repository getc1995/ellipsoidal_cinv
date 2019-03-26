function [E, c] = interval_intersect(a, b, E, c, plot_flag)
% Find the inner approximation for the intersection of the ellipsoid
% and hyperplane ax <= b and ax >= -b.
    if nargin < 5
        plot_flag = false;
    end
    if nargin < 4
        c = zeros(size(E,1), 1);
    end
    if b <= 0
        error('In hyperplane, b should be positive');
    end
    if size(a, 1) ~= 1
        error('a should be a row vector');
    end
    if ~all(c == 0)
        error('Not implemented for c ~= 0');
    end

    if plot_flag
        figure(98)
        p = hyperplane(a', b);
        plot(p)
        hold on
        grid on
        axis equal
        plot_E(E)
        xlim([-4, 4])
        ylim([-4, 4])
    end
    
    [U, S, ~] = svd(E);
    a = a/b;
    b = 1;
    
    T = U*sqrt(S);
    a = (T\a')';
    
    if plot_flag
        figure(99)
        p = hyperplane(a', b);
        plot(p)
        hold on
        grid on
        axis equal
        plot_E(eye(size(E,1)))
        xlim([-4, 4])
        ylim([-4, 4])
    end
    
    E = interval_intersect_unitball(a, b);
    
    if plot_flag
        figure(100)
        p = hyperplane(a', b);
        plot(p)
        hold on
        grid on
        axis equal
        plot_E(E)
        xlim([-4, 4])
        ylim([-4, 4])
    end
    
    E = T*E*T';
end



