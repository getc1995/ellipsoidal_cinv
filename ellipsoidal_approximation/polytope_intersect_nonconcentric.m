function ellip = polytope_intersect_nonconcentric(A, b, ellip)
% The implementation is not finished
% Find the inner approximation for the intersection of the ellipsoid
% and polytope Ax <= b and Ax >= -b.
    if any(b <= 0)
        error('In hyperplane, b should be positive');
    end
    if size(A, 1) ~= length(b)
        error('A and b dimension mismatch');
    end
    
    E = ellip.E;
    c = ellip.c;
    if size(A, 1) ~= size(E, 1)
        error('A and E dimension mismatch');
    end
    
    if all(c == 0)
        [ellip.E, ~] = polytope_intersect_sorted(A, b, ellip.E);
    else
    %   Shift the ellipsoid to the origin
    %   In other words, shift the hyperplane [A, b] by -c
        [ellip.E, ~] = polytope_intersect_sorted(A_shifted, b_shifted, ellip.E);
    end
%     ellip.c is always left unchanged
end