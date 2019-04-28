function E = union_offset_unitball_oa(n, d)
% Find the outer approximation of the union of two unit spheres,
% and the distance between the center of the two unit sphere is
% 2*d.
% The dimension of the two unit sphere is n.
% Assume that the offset is along the x axis.
    if d <= 0
        error('union_offset_unitball_oa: offset less than 0')
    end
    costheta = -(n-1)*d/(2*n) + sqrt(1/n + ((n-1)*d/(2*n))^2);
    a = ((1+d*costheta)*(costheta+d))/costheta;
    b = 1+d*costheta;

    E = diag([1/a, 1/b*ones(1, n-1)]);
%     plot([d, costheta+d], [0, sqrt(1-costheta^2)], 'k', 'LineWidth', 1.5)
%     plot([0, d], [0, 0], 'k', 'LineWidth', 1.5)
% 
%     plot([0, -sqrt(a)], [0, 0], '-.b', 'LineWidth', 1.5)
%     plot([0, 0], [0, -sqrt(b)], '-.b', 'LineWidth', 1.5)
end