function plot_E_4d(E)
    if size(E,1) ~= 4
        error('not 4d')
    end
    
    font = 20;
    for i = 1:4
        figure
        E_plot = E;
        E_plot(:, i) = [];
        E_plot(i, :) = [];
        plot_E(E_plot)
        grid on
        if i == 1
            xlabel('$v$', 'Interpreter', 'latex', 'FontSize', font)
            ylabel('$\psi$', 'Interpreter', 'latex', 'FontSize', font)
            zlabel('$r$', 'Interpreter', 'latex', 'FontSize', font)
            tightplot('../figures/lk/ellip1');
        elseif i == 2
            xlabel('$y$', 'Interpreter', 'latex', 'FontSize', font)
            ylabel('$\psi$', 'Interpreter', 'latex', 'FontSize', font)
            zlabel('$r$', 'Interpreter', 'latex', 'FontSize', font)
            tightplot('../figures/lk/ellip2');
        elseif i == 3
            xlabel('$y$', 'Interpreter', 'latex', 'FontSize', font)
            ylabel('$v$', 'Interpreter', 'latex', 'FontSize', font)
            zlabel('$r$', 'Interpreter', 'latex', 'FontSize', font)
            tightplot('../figures/lk/ellip3');
        elseif i == 4
            xlabel('$y$', 'Interpreter', 'latex', 'FontSize', font)
            ylabel('$v$', 'Interpreter', 'latex', 'FontSize', font)
            zlabel('$\psi$', 'Interpreter', 'latex', 'FontSize', font)
            tightplot('../figures/lk/ellip4');
        end
    end
end