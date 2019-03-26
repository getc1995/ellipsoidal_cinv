function res = ellip_contains(ellip1, ellip2)
% E1 and E2 are two concentric ellipsoids 
% check if E1 contains E2
    E1 = ellip1.E;
    c1 = ellip1.c;
    E2 = ellip2.E;
    c2 = ellip2.c;
    
    if ~all(c1 == 0) || ~all(c2 == 0)
        error('Not implemented for nonconcentric ellipsoids');
    end
    
    if size(E1, 1) ~= size(E2, 1)
        error('Invalid E1, E2 dim not equal ');
    end
    if size(E1,1) ~= size(E1,2)
        error('E1 matrix is not square matrix')
    end
    if size(E2,1) ~= size(E2,2)
        error('E2 matrix is not square matrix')
    end
    
%     transform E1 to unit-ball, do the same transformation on E1
%     See if E2 is less than a unit-ball
    [U, S, ~] = svd(E1);
    T = U * sqrt(S);
    inv_T = inv(T);
    E2 = inv_T*E2*inv_T';
    
    S = svd(E2);
    
    res = min(S) >= 1;
end