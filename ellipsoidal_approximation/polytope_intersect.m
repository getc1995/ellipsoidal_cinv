function [E, c] = polytope_intersect(A, b, E, c)
% Find the inner approximation for the intersection of the ellipsoid
% and polytope Ax <= b and Ax >= -b.
    if nargin < 3
        E = 1e-10 * eye(size(A, 2));
        c = zeros(size(E,1), 1);
    end
    if nargin < 4
        c = zeros(size(E,1), 1);
    end
    if any(b <= 0)
        error('In hyperplane, b should be positive');
    end
    if size(A, 1) ~= length(b)
        error('A and b dimension mismatch');
    end
    if ~all(c == 0)
        error('Not implemented for c ~= 0');
    end
    
%     A_norm = sqrt(sum(A.^2, 2));
%     b = b./A_norm;
%     A = A./A_norm;
%     [b, idx] = sort(b);
%     A = A(idx,:);
    for n = 1:length(b)
        [E, ~] = interval_intersect(A(n,:), b(n), E);
    end
end



