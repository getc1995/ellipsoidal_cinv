function E = interval_intersect_unitball(a, b)
% Find the inner approximation for the intersection of a unitball
% and hyperplane ax <= b and ax >= -b.
    if b <= 0
        error('Negative b in hyperplane');
    end
    if size(a, 1) ~= 1
        error('a should be a row vector');
    end
    if all(a == 0)
        error('get a zero a vector');
    end
    
    n = length(a);
    norm_a = norm(a);
    a = a/norm_a;
    b = b/norm_a;
    
    if b >= 1
        E = eye(n);
        return 
    end

    % Get the transformation matrix
    % Each row vector is the direction
    % of the new axis
    M = [a; null(a)'];
%     M_inv = inv(M);
    E = eye(n);
    E(1,1) = 1/b^2;
    
%     figure(2)
%     hold on
%     grid on
%     axis equal
%     y = -4:0.1:4;
%     x = ones(length(y))*b;
%     plot(x, y, 'b', 'LineWidth', 1.5)
%     plot(-x, y, 'b', 'LineWidth', 1.5)
%     plot_E(eye(2), 'r')
%     plot_E(E, 'k')
%     xlim([-4,4])
%     ylim([-4,4])
%     tightplot('../figures/polytope_intersect/2');
    
    E = M'*E*M;
end