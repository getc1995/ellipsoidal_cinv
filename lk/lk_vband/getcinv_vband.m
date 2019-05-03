function ellip = getcinv_vband(dyn_list, box, verbose, E_init)
    if nargin < 4
        [E, c] = polytope_intersect_sorted(box.A, box.b);
        E_init.E = E;
        E_init.c = c;
    end
    if nargin < 3
        verbose = true;
    end
    
    C = E_init;

	iter = 0;
	while true
        num = length(dyn_list);
        C_list = cell(1,num);
        for i = 1:num
            C_list{i} = pre(C, dyn_list{i});
        end
        
        C_pre = C_list{1};
        for i = 2:num
            % Assume C_pre.c is zero vector
%             disp('intersect')
            C_pre.E = intersect_concentric_ia(C_pre.E, C_list{i}.E);
        end

        if ellip_contains(C_pre, C)
            break;
        end
        [E, c] = polytope_intersect_sorted(box.A, box.b, C_pre.E, C_pre.c);
        C.E = E;
        C.c = c;

		iter = iter+1;
        if verbose
            volume = 1/sqrt(det(C.E));
            disp(['iteration: ', num2str(iter), ' volume: ', num2str(volume)])
        end
	end
    ellip = C;
end