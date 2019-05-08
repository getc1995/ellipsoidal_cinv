function plot_E(E, color, c)
    if nargin < 3
        c = zeros(size(E,1), 1);
    end
    if nargin < 2
        color = 'r';
    end
    
    Q = inv(E);
%     figure
%     plot(ellipsoid(c, 0.5*(Q+Q')), color)
%     axis equal
%     grid on
    [U, S, ~] = svd(Q);
    F = U*sqrt(S);
%     figure
    draw_ellipsoid(F, c, color)
end


function draw_ellipsoid(C, d, color)
    if isempty(C) && isempty(d)
        return
    else
        sz = size(d);
        dim = sz(1);
        if dim == 2
            th = linspace(0,2*pi,100);
            y = [cos(th);sin(th)];
            x = C*y + d;
            plot(x(1,:), x(2,:), color, 'LineWidth', 1.5);
            hold on
            plot(d(1), d(2), [color,'.'])
            hold off
        elseif dim == 3
            th = linspace(0,2*pi,50);
            y = [cos(th);sin(th);zeros(size(th))];
            for phi = linspace(0,pi,10)
                T = makehgtform('xrotate', phi);
                R = T(1:3,1:3);
                y = [y, R * y];
            end
            x = C*y + d;
            drawPolyFromVertices(x, color, 'FaceAlpha', 0.3)
        elseif dim > 3
            error('Cannot plot ellipsoid in 4D and higher.')
        end
    end
end


function drawPolyFromVertices(c, color, varargin)

if isempty(c)
  return
end

k = convhull(c(1,:), c(2,:), c(3,:));
X = reshape(c(1,k'), size(k'));
Y = reshape(c(2,k'), size(k'));
Z = reshape(c(3,k'), size(k'));
plot3(X,Y,Z,color)
fill3(X,Y,Z,color, 'FaceAlpha', 0.5, varargin{:})
end