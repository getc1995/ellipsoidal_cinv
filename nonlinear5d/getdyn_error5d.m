function [E_error, err] = getdyn_error5d(E, control, dm, v_bar)
% control: [u_a; u_alpha]
% dm: [w_hat; vd]
    assert(v_bar > 0)
    w_hat = dm(1);
    vd = dm(2);
    ua = control(1);
    
    xr_max = extreme_value(E, 1);
    yr_max = extreme_value(E, 2);
    thr_max = extreme_value(E, 3);
    vr_max = extreme_value(E, 4);
    w_max = extreme_value(E, 5);
    disp(vr_max)
    
    E_error = [1, 0;
               0, 1;
               0, 0;
               0, 0;
               0, 0];
    err = [(v_bar + vr_max)*abs(cos(thr_max) - 1) + yr_max * w_hat;
           v_bar*abs(sin(thr_max) - thr_max) + vr_max * sin(thr_max) + xr_max * w_hat];
end