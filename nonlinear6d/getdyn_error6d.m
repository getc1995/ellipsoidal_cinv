function [E_error, err] = getdyn_error6d(E, control, dm)
% control: [u_a; u_alpha]
% dm: [w_hat; vd]
    
    w_hat = dm(1);
    vd = dm(2);
    ua = control(1);
    
    xr_max = extreme_value(E, 1)
    yr_max = extreme_value(E, 2)
    thr_max = extreme_value(E, 3)
    vxr_max = extreme_value(E, 4)
    vyr_max = extreme_value(E, 5)
    w_max = extreme_value(E, 6)
    
    vxr_w_max = extreme_value_cross(E, 4, 6);
    vyr_w_max = extreme_value_cross(E, 5, 6);
    
    E_error = [1, 0, 0, 0;
               0, 1, 0, 0;
               0, 0, 0, 0;
               0, 0, 1, 0;
               0, 0, 0, 1;
               0, 0, 0, 0;];
    err = [yr_max * w_hat;
           xr_max * w_hat;
           vyr_w_max + vyr_max*w_hat + ua*(1-cos(thr_max));
           0];%vxr_w_max + vd*w_max + (vd+vxr_max)*w_hat + vyr_max*w_hat];% + ua*sin(thr_max);]
end