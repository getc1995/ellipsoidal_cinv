function E = intersect_offset_unitball_ia(n, d)
% Find the inner approximation of two intersected unit sphere,
% and the distance between the center of the two unit sphere is
% 2*d.
% The dimension of the two unit sphere is n.
% Assume that the offset is along the x axis.
    if d >= 1
        error('intersect_offset_ia: empty intersection')
    end
    costheta = (n-1)*d/(2*n) + sqrt(1/n + ((n-1)*d/(2*n))^2);
    a = ((1-d*costheta)*(costheta-d))/costheta;
    b = 1-d*costheta;

    E = diag([1/a, 1/b*ones(1, n-1)]);
end