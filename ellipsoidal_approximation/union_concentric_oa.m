function E = union_concentric_oa(E1, E2)
    if E1 ~= E1'
        error('Invalid E1 (non-symetric)');
    end
    if E2 ~= E2'
        error('Invalid E2 (non-symetric)');
    end
    if size(E1, 1) ~= size(E2, 1)
        error('Invalid E1, E2 dim not equal ');
    end
    n = size(E1, 1);
    
    [U, S, ~] = svd(E1);
    T = U * sqrt(S);
    inv_T = inv(T);
    E2 = inv_T*E2*inv_T';
    
    [U, S, ~] = svd(E2);
    S = min(eye(n), S);
    E = T*U*S*U'*T';
    
%     figure(2)
%     plot_E(E2, 'r')
%     hold on
%     plot_E(eye(n),'b')
%     plot_E(U*S*U', 'k')
%     grid on
%     axis equal
%     xlim([-4,4])
%     ylim([-4,4])
%     tightplot('../figures/union_concentric_oa/2');
end