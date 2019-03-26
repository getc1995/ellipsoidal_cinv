function p = solve_minkeqn(lambda, n, interval)
% solve for the equation 
% 1/(lambda(1)+x) + 1/(lambda(2)+x)+ ... + 1/(lambda(n)+x) == n/(x*(x+1));
% return the solution in the interval
    strfunc = '@(lambda, n, x) ';
    for i = 1:n
        strfunc = [strfunc, '+ 1/(lambda(', num2str(i), ')+x)'];
    end
    strfunc = [strfunc, '- n/(x*(x+1))'];
    f = str2func(strfunc);
    p = fzero(@(x) f(lambda, n, x), interval);
end