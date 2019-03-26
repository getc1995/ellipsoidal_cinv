function E = union_offset_unitball_ia(n, d)
% Find the inner approximation of union f two unit spheres,
% and the distance between the center of the two unit sphere is
% 2*d.
% The dimension of the two unit sphere is n.
% Assume that the offset is along the x axis.
    a = d+1;
    E = diag([1/a^2, ones(1, n-1)]);
end