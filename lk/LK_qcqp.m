function steer_output = LK_qcqp(dyn, x0, s0, W,  ellip_list, rd_list)
% x0: initial state
% s0: previous steering angle
    if ~all(size(x0) == [4,1])
        error('x0 dimension error')
    end
    
    if length(ellip_list) ~= length(rd_list)
        error('error horizon mismatch')
    end
    
    A = dyn.A;
    B = dyn.B;
    Em = dyn.Em;
%     Ed = dyn.Ed;
    s_max = dyn.control;
%     y_max = 0.9;
    
% %% LK cvx, used to check the correctness for the fomulation of SOCP
%     n = 4;
%     T = length(rd_list);
%     cvx_begin
%         variables x(n, T+1) s(T+1)
%         
%         obj = sum(sum_square(W * [s(1:T+1)'; x(:, 1:T+1)]));
% %         obj = sum(sum_square(W * [x(:, 2:T+1); s(2:T+1)'-s(1:T)']));
%         minimize(obj)
%         
%         subject to
%             x(:,1) == x0;
%             s(1) == s0;
%             for t = 1:T
%                 x(:, t+1) == A*x(:, t) + B*s(t+1) + Em*rd_list(t);
% %                 x(1, t+1) <= y_max;
% %                 x(1, t+1) >= -y_max;
%                 s(t+1) <= s_max;
%                 s(t+1) >= -s_max;
%                 quad_form(x(:, t+1)-ellip_list{t}.c, ellip_list{t}.E) <= 1;
%             end
% %             quad_form(x(:, 2), ellip_list{1}) <= 1;
%     cvx_end
% %     disp(x)
%     disp(s)
%     steer_output = s(2);
    
%% LK qcqp
    n = 4+1; % dimension of state plus control
    m = 1; % dimension of control
    T = length(rd_list); % length of horizon

%   problem variable is
%   |u0|
%   |x0|
%   |u1|
%   |x1|
%   |...|
%   |uT|
%   |xT|
    % Building equality matrix based on the dynamics
%     |-A, -B| | x(t) | + |eye(n-m), 0||x(t+1)| == Em*rd
%              | u(t) |                |u(t+1)|
    Aeq = zeros(n*(T+1), n*(T+1));
    Beq = zeros(n*(T+1), 1);

    Aeq(1:n, 1:n) = eye(n);
    Beq(1:n) = [s0; x0;];
    ellip = [];
    ellips = cell(1,1);
    for i = 2:T+1
        Aeq((i-1)*n+m+1:i*n, (i-1)*n+m+1:i*n) = eye(n-m);
        Aeq((i-1)*n+m+1:i*n, (i-2)*n+m+1:(i-1)*n) = -A;
        Aeq((i-1)*n+m+1:i*n, (i-1)*n+1:(i-1)*n+m) = -B;
        Beq((i-1)*n+m+1:i*n, 1) = Em*rd_list(i-1);
        
        if i == 2
            ellip_temp = ellip_list{i-1};
            F = chol(ellip_temp.E);
            ellip.Fc = F * ellip_temp.c;
            ellip.F = zeros(n-m, n*(T+1));
            ellip.F(:, (i-1)*n+m+1:i*n) = F;
            ellips{i-1} = ellip;
        end
    end

    % Building inequality matrix based on constraints.
    
    Aueq = [-1, 0, 0, 0, 0; 1, 0, 0, 0, 0;];
    Bueq = [s_max; s_max];
    
    Aueq = kron(eye(T+1), Aueq);
    Bueq = kron(ones(T+1,1), Bueq);

    W = kron(eye(T+1), W);
    H = 2 * W'*W;
    f = [];
    [optx,fval,exitflag,output] = ecosqcqp(H,f,Aueq,Bueq,Aeq,Beq,ellips);
%     s = optx(1:5:end)
%     fval
    steer_output = optx(n+1);
end