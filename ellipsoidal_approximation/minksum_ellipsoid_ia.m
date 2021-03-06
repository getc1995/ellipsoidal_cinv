function [E, c] = minksum_ellipsoid_ia(E1, c1, E2, c2)
% Find the outer approximation of minkowski sum of two ellipsoids
% E = E1 + E2
    if size(E1, 1) ~= size(E2, 1)
        error('E1 E2 dimension mismatch')
    end
    n = size(E1, 1);
    c = c1 + c2;
    
    [U, S, ~] = svd(E2);
    T = U * sqrt(S);
    T_inv = inv(T);
    E_temp = T \ E1 * T_inv';
    
    [U, S, ~] = svd(E_temp);
    Q1 = sqrt(inv(S));
    Q2 = eye(n);
    
    Q = (Q1 + Q2).^2;
    E = U * inv(Q) * U';
    E = T * E * T';
end