function E = intersect_concentric_ia(E1, E2)
    if E1 ~= E1'
        error('Invalid E1');
    end
    if E2 ~= E2'
        error('Invalid E2');
    end
    if size(E1, 1) ~= size(E2, 1)
        error('Invalid E1, E2 dim not equal');
    end
    n = size(E1, 1);
    
    [U, S, ~] = svd(E1);
    T = U * sqrt(S);
    inv_T = inv(T);
    E2 = inv_T*E2*inv_T';
    
    [U, S, ~] = svd(E2);
    S = max(eye(n), S);
    E = T*U*S*U'*T';
end