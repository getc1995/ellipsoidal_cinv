function plot_E(E, color, c)
    if nargin < 3
        c = zeros(size(E,1), 1);
    end
    if nargin < 2
        color = 'r';
    end
    
    Q = inv(E);
    plot(ellipsoid(c, 0.5*(Q+Q')), color)
end