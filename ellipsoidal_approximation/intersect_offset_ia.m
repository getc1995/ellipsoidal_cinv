function E = intersect_offset_ia(E, vecs)
% Find the minkowski difference of an ellipsoid and a box, which is equivilent to
% Find the inner approximation of the intersection of two identical 
% ellipsoids,
% and they are offset by 2*vecs(i).
% The dimension of the two unit sphere is n.
    if size(E, 1) ~= size(vecs, 1)
        error('Dimension of ellipsoid and offset vector mismatch')
    end
    
    n = size(E, 1);
    
    for i = 1:size(vecs, 2)
        vec = vecs(:, i);
        if norm(vec) == 0
            continue
        end
        [U, S, ~] = svd(E);
        T = U * sqrt(S);
        T_inv = inv(T);
        vec = sqrt(S) * inv(U) * vec;
        
%         plot(vec(1), vec(2), '*')
%         plot(ellipsoid(vec, eye(n)), 'k')
%         plot(ellipsoid(-vec, eye(n)), 'k')
        
        offset = norm(vec);
        E = intersect_offset_unitball_ia(n, offset);
%         figure
%         grid on
%         axis equal
%         hold on
%         xlim([-4, 4])
%         ylim([-4, 4])
%         plot_E(eye(n), 'k', [-offset; 0])
%         plot_E(eye(n), 'k', [offset; 0])
%         plot_E(E, 'r')
%         tightplot('../figures/intersect_offset_ia/7');
        
        % Get the transformation matrix
        % Each row vector is the direction
        % of the new axis
        direction = (vec/offset)'; % normalize offset vector
        M = [direction; null(direction)'];
        E = M'*E*M;
%         plot_E(E, 'y')
        
        E = T*E*T';
    end
end