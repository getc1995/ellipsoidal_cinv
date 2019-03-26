function value = extreme_value_cross(E, dim1, dim2)
% E: ellipsoid x'Ex <= 1, parameter E
% find max( x(dim1)*(dim2))
% Using the trick on convex optimization book ex. 4.21

    n = size(E,1);
    lambda = inv(chol(E));

    B = zeros(n,n);
    B(dim1, dim2) = B(dim1, dim2) + 1/2;
    B(dim2, dim1) = B(dim2, dim1) + 1/2;
    
    A = lambda'*B*lambda;
    value = max(eig(A));
end