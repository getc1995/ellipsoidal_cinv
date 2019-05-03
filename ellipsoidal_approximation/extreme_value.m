function value = extreme_value(E, dim)
% E: ellipsoid x'Ex <= 1, parameter E
% find max( x(dim))
% Using the trick on convex optimization book ex. 4.21

    n = size(E, 1);
    lambda = inv(chol(E));
    vec = zeros(n,1);
    vec(dim) = 1;
    B = diag(vec);
    A = lambda'*B*lambda;
    value = sqrt(max(eig(A)));
end