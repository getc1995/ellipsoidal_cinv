function plot_E_4d(E)
    if size(E,1) ~= 4
        error('not 4d')
    end
    
    for i = 1:4
        figure
        grid on
        axis equal
        E_plot = E;
        E_plot(:, i) = [];
        E_plot(i, :) = [];
        plot_E(E_plot)
    end
end