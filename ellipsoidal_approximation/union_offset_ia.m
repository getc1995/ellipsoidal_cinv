function E = union_offset_ia(E, vecs)
% Find the minkowski sum of an ellipsoid and a box, which is equivilent to
% find the inner approximation of the union of ellipsoids,
% and they are offset by 2*vecs(i).
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
        
        offset = norm(vec);
        E = union_offset_unitball_ia(n, offset);
        
        % Get the transformation matrix
        % Each row vector is the direction
        % of the new axis
        direction = (vec/offset)'; % normalize offset vector
        M = [direction; null(direction)'];
        E = M'*E*M;
        
        E = T*E*T';
    end
end

%% The following code is a trial and error for another approximation scheme
% The idea is to find the outer appoximation first, and then find its 
% intersection with the constraining box.
% Proved to be wrong!!

% function E = union_offset_ia(E, vecs)
% % Find the minkowski sum of an ellipsoid and a box, which is equivilent to
% % find the inner approximation of the union of ellipsoids,
% % and they are offset by 2*vecs(i).
% 
%     if size(E, 1) ~= size(vecs, 1)
%         error('Dimension of ellipsoid and offset vector mismatch')
%     end
%     
%     n = size(E, 1);
%     [U, S, ~] = svd(E);
%     T = U * sqrt(S);
%     
%     vecs = sqrt(S) * inv(U) * vecs;
%     
%     vecs_norm = sqrt(sum(vecs.^2, 1));
%     direction = (vecs./vecs_norm)'; % normalize offset vector
%     null_space = null(direction);
%     M = [direction; null_space'];
%     
% %     M_norm = sqrt(sum(M.^2, 2));
%     
%     hyperplane = zeros(n,size(vecs, 2));
%     for i = 1:size(vecs, 2)
%         vec = vecs(:, i);
%         
%         rest_vec = M;
%         rest_vec(i,:) = [];
%         null_vec = null(rest_vec);
%         
%         dot_prod = abs(null_vec'*vec);
% %         if dot_prod > 0
% %             vec = null_vec + vec;
% %         else
% %             vec = -null_vec + vec;
% %         end
%         
%         null_vec = null_vec/(dot_prod+1);
%         hyperplane(:,i) = null_vec;
%     end
%     
%     hyperplane = [hyperplane, null_space];
%     E = union_offset_oa(eye(n), vecs);
%     [E, ~] = polytope_intersect_sorted(hyperplane', ones(n,1), E);
% %     Q_inv = inv(Q);
% %     E = Q_inv'*Q_inv;
% %     plot_unitcircles(vecs, hyperplane, E)
%     
%     E = T*E*T';
% end
% 
% 
% function plot_unitcircles(vecs, Q, E)
%     figure(10)
%     grid on
%     axis equal
%     hold on
%     
%     for i = 1:2
%         plot(vecs(1,i), vecs(2,i), 'r*')
%     end
%     
%     v1 = vecs(:, 1) + vecs(:, 2);
%     v2 = -vecs(:, 1) + vecs(:, 2);
%     v3 = vecs(:, 1) - vecs(:, 2);
%     v4 = -vecs(:, 1) - vecs(:, 2);
%     
%     plot(ellipsoid(v1, eye(2)), 'r')
%     plot(ellipsoid(v2, eye(2)), 'r')
%     plot(ellipsoid(v3, eye(2)), 'r')
%     plot(ellipsoid(v4, eye(2)), 'r')
%     
%     plot_E(E, 'b')
%     for i = 1:2
%         plot(Q(1,i), Q(2,i), 'b*')
%     end
% end