function E = union_offset_oa(E, vecs)
% Find the minkowski sum of an ellipsoid and a box, which is equivilent to
% Find the outer approximation of the convex hull of offset ellipsoids
% and they are offset by 2*vecs(i).
% The dimension of the two unit sphere is n.
    if size(E, 1) ~= size(vecs, 1)
        error('Dimension of ellipsoid and offset vector mismatch')
    end
    
    n = size(E, 1);
    
    for i = 1:size(vecs, 2)
        vec = vecs(:, i);
        [U, S, ~] = svd(E);
        T = U * sqrt(S);
        T_inv = inv(T);
        vec = sqrt(S) * inv(U) * vec;
        
%         plot(vec(1), vec(2), '*')
%         plot(ellipsoid(vec, eye(n)), 'k')
%         plot(ellipsoid(-vec, eye(n)), 'k')
        
        offset = norm(vec);
        E = union_offset_unitball_oa(n, offset);
%         plot_E(E, 'g')
        
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