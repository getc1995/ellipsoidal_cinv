function ellip = pre_nonlinear6d(ellip, dyn, d_m, d_um)
    E = ellip.E;
    c = ellip.c;
    
    A = dyn.A;
    B = dyn.B*diag(dyn.control);
    if nargin < 4
    %   Use default d_um
        Ed = dyn.Ed*diag(dyn.d_um);
    else
        Ed = dyn.Ed*diag(d_um);
    end
    
    set_disturbance = true;
    if nargin < 3
    %   Use default d_m and assume worst case set disturbance
        [E_error, err] = getdyn_error6d(E, dyn.control, dyn.d_m);
%         dyn.integral_A
%         eig(dyn.integral_A)
        Em = [dyn.Em*diag(dyn.d_m), dyn.integral_A * E_error * diag(err)];
        set_disturbance = true;
    else
    %   Use input previewed disturbance
    %   Warning!!!
        error('Not implemented for preview cases!')
        Em = dyn.Em*d_m;
        set_disturbance = false;
    end
        
%     Em = dyn.Em*diag(dyn.d_m);
%     Ed = dyn.Ed*diag(dyn.d_um);
    
%     A = dyn.A;
%     B = dyn.B;
%     Em = dyn.Em;
%     Ed = dyn.Ed;
    option  = dyn.option;
    n = size(E, 1);
    if size(E,1) ~= size(E,2)
        error('E matrix is not square matrix')
    end
    
    if n ~= size(A,1) || n ~= size(A,2)
        error('A matrix dimension error')
    end
    
    if n ~= size(B,1) || size(B,2) > size(B,1)
        error('B matrix dimension error')
    end
    
    if n ~= size(Em,1) || size(Em,2) > size(Em,1)
        error('Em matrix dimension error')
    end
    
    if n ~= size(Ed,1) || size(Ed,2) > size(Ed,1)
        error('Ed matrix dimension error')
    end
    
    if ~isfield(option, 'B_box')
        option.B_box = true;
    end
    
    if ~isfield(option, 'Em_box')
        option.Em_box = true;
    end
    
    if ~isfield(option, 'Ed_box')
        option.Ed_box = true;
    end
    
    if ~all(all(Ed == 0))
        if option.Ed_box
            E = intersect_offset_ia(E, Ed);
        else
            [E, ~] = minkdiff_ellipsoid_ia(E, zeros(n, 1), Ed, zeros(n, 1));
        end
    end
    
    if ~all(all(B == 0))
        if option.B_box
            E = union_offset_ia(E, B);
        else
            [E, ~] = minksum_ellipsoid_ia(E, zeros(n, 1), Ed, zeros(n, 1));
        end
    end
    
    if ~all(all(Em == 0))
        if set_disturbance
            if option.Em_box
                E = intersect_offset_ia(E, Em);
            else
                [E, ~] = minkdiff_ellipsoid_ia(E, zeros(n, 1), Em, zeros(n, 1));
            end
        else
            c = c - Em;
        end
    end
    
    E = A'*E*A;
    c = A\c;
    ellip.E = E;
    ellip.c = c;
end