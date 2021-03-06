function ellip = getcinv_nonlinear5d(dyn, box, verbose, E_init)
    if nargin < 4
        [E, c] = polytope_intersect_sorted(box.A, box.b);
        E_init.E = E;
        E_init.c = c;
    end
    if nargin < 3
        verbose = true;
    end
    
    C = E_init;

	i = 0;
	while true
		C_pre = pre_nonlinear5d(C, dyn);

        if ellip_contains(C_pre, C)
            disp('contains! Found it.')
            break;
        end
        [E, c] = polytope_intersect_sorted(box.A, box.b, C_pre.E, C_pre.c);
        C.E = E;
        C.c = c;

		i = i+1;
%         if show_plot
%             plot(V_prim)
%             drawnow
%         end
        if verbose
            volume = 1/sqrt(det(C.E));
            disp(['iteration: ', num2str(i), ' volume: ', num2str(volume)])
        end
	end
    ellip = C;
end